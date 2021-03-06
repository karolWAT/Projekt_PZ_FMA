﻿using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Net.Http;
using System.Timers;
using System.Windows.Forms;

namespace FinancialMarketsApp
{
    public partial class Main : Form
    {
        public int searchInt = 0;

        public int BackgroundFlag { get; private set; }

        public Main()
        {
            InitializeComponent();
        }

        private void calculateWalletbalance()
        {
            float balance = 0;
            ConnectDB connectDb = new ConnectDB();
            balance = connectDb.calculateBalance();
            balanceValueLabel.Text = balance.ToString() + " $";
        }

        private void checkUser()
        {
            Users user = new Users();
            ConnectDB connectDb = new ConnectDB();
            user = connectDb.checkLoggedUser();
            userNameLabel.Text = user.login;

            if (user.isAdmin == 1)
            {
                adminLabel.Visible = true;
                adminSymbolLabel.Visible = true;
                adminSymbolTextBox.Visible = true;
                removeFromDBButton.Visible = true;
            }
        }

        private void logOutButton_Click(object sender, EventArgs e)
        {
            this.Hide();
            Welcome welcome = new Welcome();
            Users user = new Users();

            ConnectDB connectDb = new ConnectDB();
            user = connectDb.checkLoggedUser();
            string connectionString =
                @"Data Source = (localdb)\LocalDBKN; Initial Catalog = FinMarketsAppDB; Integrated Security = True; Connect Timeout = 30; Encrypt = False; TrustServerCertificate = False; ApplicationIntent = ReadWrite; MultiSubnetFailover = False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            String query3 = @"UPDATE Users SET isLogged = " + 0 + " WHERE idUsers = " + user.idUsers + "";
            SqlCommand command3 = new SqlCommand(query3, connection);
            command3.ExecuteNonQuery();
            connection.Close();

            welcome.Show();
        }

        private void apiButton_Click(object sender, EventArgs e)
        {

            var client = new HttpClient();
            // var url = "https://api.coinmarketcap.com/v2/ticker/?limit=10";   // old api without authorization
            var url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=1000";
            client.DefaultRequestHeaders.Add("X-CMC_PRO_API_KEY", "f742b5ad-230c-4dfe-b1dc-7fbe4ec51be4");
            string response = client.GetStringAsync(url).Result;
            //Console.Write(response);
            GetAPI getapi = new GetAPI();

            int j = 0;
            progrssBarlabel.Text = j + "%";
            apiProgressBar.Increment(-100);
//            apiProgressBar.Invoke(new Action(delegate ()
//            {
//                apiProgressBar.Increment(-100);
//            }));

            for (int i = 0; i < 1000; i++)
            {
                getapi.cryptoGetData(i, response);
                apiProgressBar.Increment(1);
                // MessageBox.Show(i.ToString());
                j = i + 1;
                if (j <= 100)
                {
                    progrssBarlabel.Text = j + "%";
                }
            }

            MessageBox.Show("Updated");
        }

        private void apiButtonAuto()
        {
            var client = new HttpClient();
            var url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=100";
            client.DefaultRequestHeaders.Add("X-CMC_PRO_API_KEY", "f742b5ad-230c-4dfe-b1dc-7fbe4ec51be4");
            try
            {
                string response = client.GetStringAsync(url).Result;
                GetAPI getapi = new GetAPI();
                for (int i = 0; i < 100; i++)
                {
                    getapi.cryptoGetData(i, response);
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            
        }

        private void apiNbpButton_Click(object sender, EventArgs e)
        {
            var client2 = new HttpClient();
            var urlNBPtabA = "http://api.nbp.pl/api/exchangerates/tables/A?format=json";
            // var urlNBPtabB = "http://api.nbp.pl/api/exchangerates/tables/B?format=json";
            var urlNBPgold = "http://api.nbp.pl/api/cenyzlota?format=json";
            string responseNBPtabA = client2.GetStringAsync(urlNBPtabA).Result;
            // string responseNBPtabB = client2.GetStringAsync(urlNBPtabB).Result;
            string responseNBPgold = client2.GetStringAsync(urlNBPgold).Result; // cena 1g złota
            int k = 0;
            progrssBarNbplabel.Text = k + "%";
            apiNbpProgressBar.Increment(-100);

            for (int i = 0; i < 100; i++)
            {
                apiNbpProgressBar.Increment(1);
                k = i + 1;
                progrssBarNbplabel.Text = k + "%";
            }

            // string response = responseNBPtabA + "\n\n" + responseNBPgold;
            JArray jsonArray = JArray.Parse(responseNBPtabA);
            JArray jsonArrayGold = JArray.Parse(responseNBPgold);
            dynamic jsonObj = JObject.Parse(jsonArray[0].ToString());
            dynamic jsonObjGold = JObject.Parse(jsonArrayGold[0].ToString());
            String responseConnected = String.Empty;

            string dateNBP = jsonObj.SelectToken("$.effectiveDate").ToString();
//            MessageBox.Show(dateNBP);
            responseConnected += "NBP " + dateNBP + "\n\n";

            for (int counterInJson = 0; counterInJson < 40; counterInJson++)
            {
                try
                {
                    string currencyNBP = jsonObj.SelectToken("$.rates[" + counterInJson + "].currency").ToString();
                    string codeNBP = jsonObj.SelectToken("$.rates[" + counterInJson + "].code").ToString();
                    string priceNBP = jsonObj.SelectToken("$.rates[" + counterInJson + "].mid").ToString();
                    responseConnected += codeNBP + ": " + priceNBP + " \t" + currencyNBP + "\n";
                    //                MessageBox.Show(currencyNBP+" "+codeNBP+" "+priceNBP);
                }
                catch (Exception f)
                {
                    Console.WriteLine(f);
                }
            }
            string goldPriceNBP = jsonObjGold.SelectToken("$.cena").ToString();
//            string goldDateNBP = jsonObjGold.SelectToken("$.data").ToString();
            responseConnected += "\n\nGold: " + goldPriceNBP + " PLN per gram";

            // MessageBox.Show(responseNBPtabA + "\n\n" + responseNBPgold);
            MessageBox.Show(responseConnected, "Exchange rates");
        }

        private void Main_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'finMarketsAppDBDataSet21.ViewWallet' table. You can move, or remove it, as needed.
            this.viewWalletTableAdapter1.Fill(this.finMarketsAppDBDataSet21.ViewWallet);
//            this.viewWalletTableAdapter.Fill(this.finMarketsAppDBDataSet1.ViewWallet);
            this.cryptocurrenciesTableAdapter.Fill(this.finMarketsAppDBDataSet.Cryptocurrencies);

            notifyIcon1.Visible = false;
            checkUser();
            calculateWalletbalance();
            refreshWallet();

            System.Timers.Timer timer = new System.Timers.Timer();
            timer.Interval = 60*60*1000;
            timer.Elapsed += timerElapsed;
            timer.Start();
        }

        private void timerElapsed(object sender, ElapsedEventArgs e)
        {
            apiButtonAuto();
            calculateWalletbalance();
            refreshWallet();
       }

        private void cryptoDataGridView_CellClick(object sender, EventArgs e)
        {
            if (cryptoDataGridView.CurrentRow.Index != -1)
            {
                walletNameTextBox.Text = cryptoDataGridView.CurrentRow.Cells[0].Value.ToString();
                walletSymbolTextBox.Text = cryptoDataGridView.CurrentRow.Cells[1].Value.ToString();
                walletPriceTextBox.Text = cryptoDataGridView.CurrentRow.Cells[2].Value.ToString();
                walletQuantityTextBox.Text = "0";
                alertUpTextBox.Text = "0";
                alertDownTextBox.Text = "0";

                walletNameTextBox.BackColor = searchTextBox.BackColor;
                walletSymbolTextBox.BackColor = searchTextBox.BackColor;
                walletPriceTextBox.BackColor = searchTextBox.BackColor;
                walletQuantityTextBox.BackColor = searchTextBox.BackColor;

                // ADMIN OPTION
                adminSymbolTextBox.Text = cryptoDataGridView.CurrentRow.Cells[1].Value.ToString();
            }

        }

        private void walletDataGridView_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            ConnectDB connectDb = new ConnectDB();
            Users user = new Users();
            user = connectDb.checkLoggedUser();
            (decimal[] up, decimal[] down) = connectDb.CalculateChangeWallet(user);

            if (walletDataGridView.CurrentRow.Index != -1)
            {
                int i = walletDataGridView.CurrentRow.Index;

                walletNameTextBox.Text = walletDataGridView.CurrentRow.Cells[0].Value.ToString();
                walletSymbolTextBox.Text = walletDataGridView.CurrentRow.Cells[1].Value.ToString();
                walletPriceTextBox.Text = walletDataGridView.CurrentRow.Cells[2].Value.ToString();
                walletQuantityTextBox.Text = walletDataGridView.CurrentRow.Cells[3].Value.ToString();
                walletNameTextBox.BackColor = Color.GreenYellow;
                walletSymbolTextBox.BackColor = Color.GreenYellow;
                walletPriceTextBox.BackColor = Color.GreenYellow;
                walletQuantityTextBox.BackColor = Color.GreenYellow;

                alertUpTextBox.Text = up[i].ToString();
                alertDownTextBox.Text = down[i].ToString();
            }
        }

        private void AddToWalletBtn_Click(object sender, EventArgs e)
        {

            Cryptocurrencies crypto = new Cryptocurrencies();
            ConnectDB connectDb = new ConnectDB();
            if (walletSymbolTextBox.Text != "" & walletNameTextBox.Text != "")
            {
                crypto = connectDb.Read(walletSymbolTextBox.Text); // to get crypto id from symbol Text Box
                WalletsC walletsC = new WalletsC();
                WalletsC walletsC2 = new WalletsC();

                Users user = new Users();
                user = connectDb.checkLoggedUser();
                walletsC.idUser = user.idUsers;

                walletsC.idWalletC = 1; 
                walletsC.idCrypto = crypto.idCrypto;
                walletsC.priceWhenAdded = crypto.Price;
                walletsC.price = crypto.Price;
                walletsC.quantity = walletQuantityTextBox.Text;
                float tempSum = Convert.ToSingle(walletsC.price) * Convert.ToSingle(walletsC.quantity);
                walletsC.sum = tempSum.ToString();
                walletsC.idAlert = 1;
                walletsC.alertUp = alertUpTextBox.Text;
                walletsC.alertDown = alertDownTextBox.Text;

                walletsC2 = connectDb.readWalletsC(walletsC.idUser, walletsC.idWalletC, walletsC.idCrypto);
                if (walletsC2.idCrypto != 0)
                {
                    connectDb.updateWalletsC(walletsC, user);
                }
                else
                {
                    connectDb.saveWalletsC(walletsC);
                }
                this.viewWalletTableAdapter1.Fill(this.finMarketsAppDBDataSet21.ViewWallet);
//                this.viewWalletTableAdapter.Fill(this.finMarketsAppDBDataSet1.ViewWallet);
                calculateWalletbalance();
                refreshWallet();
            }
        }

        private void RemoveFromWalletBtn_Click(object sender, EventArgs e)
        {

            if (walletSymbolTextBox.Text != "" & walletNameTextBox.Text != "")
            {
                if (MessageBox.Show("Do you want remove this asset from your wallet?", "Warning",
                        MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                {
                    Cryptocurrencies crypto = new Cryptocurrencies();
                    ConnectDB connectDb = new ConnectDB();
                    crypto = connectDb.Read(walletSymbolTextBox.Text); // to get crypto id from symbol Text Box
                    WalletsC walletsC = new WalletsC();
                    WalletsC walletsC2 = new WalletsC();

                    Users user = new Users();
                    user = connectDb.checkLoggedUser();
                    walletsC.idUser = user.idUsers;

                    walletsC.idWalletC = 1; // też sprzawdzam użytkonika a póżniej jego crytpo wallet
                    walletsC.idCrypto = crypto.idCrypto;
                    walletsC.quantity = walletQuantityTextBox.Text;
                    walletsC.sum = 0.ToString();
                    walletsC.idAlert = 1; // bede pewnie z gui bral dla alertu wzrostoego 1 a dla malejacego 2

                    walletsC2 = connectDb.readWalletsC(walletsC.idUser, walletsC.idWalletC, walletsC.idCrypto);
                    if (walletsC2.idCrypto != 0)
                    {
                        connectDb.deleteWalletsC(walletsC);
                        this.viewWalletTableAdapter1.Fill(this.finMarketsAppDBDataSet21.ViewWallet);
//                        this.viewWalletTableAdapter.Fill(this.finMarketsAppDBDataSet1.ViewWallet);
                        calculateWalletbalance();
                        refreshWallet();
                        try
                        {
                            if (walletDataGridView.CurrentRow.Index != -1)
                            {
                                walletNameTextBox.Text = walletDataGridView.CurrentRow.Cells[0].Value.ToString();
                                walletSymbolTextBox.Text = walletDataGridView.CurrentRow.Cells[1].Value.ToString();
                                walletPriceTextBox.Text = walletDataGridView.CurrentRow.Cells[2].Value.ToString();
                                walletQuantityTextBox.Text = walletDataGridView.CurrentRow.Cells[3].Value.ToString();
                            }
                        }
                        catch (Exception)
                        {
                        }
                    }
                    else
                        MessageBox.Show("You do not have this asset in your wallet", "Warning", MessageBoxButtons.OK,
                        MessageBoxIcon.Warning);
                }
            }
            else MessageBox.Show("Select asset to remowe", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void searchButton_Click(object sender, EventArgs e)
        {
            if (searchTextBox.Text == "" & searchInt == 0)
            {
                search();
                searchInt++;
            }
            else if (searchTextBox.Text != "")
            {
                search();
                searchInt = 0;
            }
        }

        private void searchTextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (searchTextBox.Text == "" & searchInt == 0)
            {
                search();
                searchInt++;
            }
            else if (searchTextBox.Text != "")
            {
                search();
                searchInt = 0;
            }
        }


        private void search()
        {
            string searchText = searchTextBox.Text;

            if (searchText != "")
            {
                ConnectDB connectDb = new ConnectDB();

                List<Cryptocurrencies> listCrpyto = new List<Cryptocurrencies>();
                listCrpyto = connectDb.search(searchText);

                cryptoDataGridView.Columns.Clear();
                cryptoDataGridView.DataSource = null;

                cryptoDataGridView.Columns.Add("name", "name");
                cryptoDataGridView.Columns.Add("symbol", "symbol");
                cryptoDataGridView.Columns.Add("price", "price");
                cryptoDataGridView.Columns.Add("change24h", "change24h");
                cryptoDataGridView.Columns.Add("change7d", "change7d");
                cryptoDataGridView.Columns[0].Width = 79;
                cryptoDataGridView.Columns[1].Width = 42;
                cryptoDataGridView.Columns[1].DefaultCellStyle.Alignment = DataGridViewContentAlignment.TopRight;
                cryptoDataGridView.Columns[2].Width = 74;
                cryptoDataGridView.Columns[2].DefaultCellStyle.Alignment = DataGridViewContentAlignment.TopRight;
                cryptoDataGridView.Columns[3].Width = 65;
                cryptoDataGridView.Columns[3].DefaultCellStyle.Alignment = DataGridViewContentAlignment.TopRight;
                cryptoDataGridView.Columns[4].Width = 58;
                cryptoDataGridView.Columns[4].DefaultCellStyle.Alignment = DataGridViewContentAlignment.TopRight;

                int i = 0;
                foreach (var row in listCrpyto)
                {
                    cryptoDataGridView.Rows.Add("", "", "", "", "");
                    cryptoDataGridView.Rows[i].Cells[0].Value = row.Name;
                    cryptoDataGridView.Rows[i].Cells[1].Value = row.Symbol;
                    cryptoDataGridView.Rows[i].Cells[2].Value = Convert.ToDecimal(row.Price);
                    cryptoDataGridView.Rows[i].Cells[3].Value = Convert.ToDecimal(row.Change24h);
                    cryptoDataGridView.Rows[i].Cells[4].Value = Convert.ToDecimal(row.Change7d);
                    i++;
                }
            }
            else
            {

                cryptoDataGridView.Columns.Clear();
                cryptoDataGridView.DataSource = cryptocurrenciesBindingSource;

                cryptoDataGridView.AutoGenerateColumns = true;
                cryptoDataGridView.Columns[0].Width = 79;
                cryptoDataGridView.Columns[1].Width = 42;
                cryptoDataGridView.Columns[1].DefaultCellStyle.Alignment = DataGridViewContentAlignment.TopRight;
                cryptoDataGridView.Columns[2].Width = 74;
                cryptoDataGridView.Columns[2].DefaultCellStyle.Alignment = DataGridViewContentAlignment.TopRight;
                cryptoDataGridView.Columns[3].Width = 65;
                cryptoDataGridView.Columns[3].DefaultCellStyle.Alignment = DataGridViewContentAlignment.TopRight;
                cryptoDataGridView.Columns[4].Width = 58;
                cryptoDataGridView.Columns[4].DefaultCellStyle.Alignment = DataGridViewContentAlignment.TopRight;

            }
        }

        private void refreshButton_Click(object sender, EventArgs e)
        {
            this.viewWalletTableAdapter1.Fill(this.finMarketsAppDBDataSet21.ViewWallet);
//            this.viewWalletTableAdapter.Fill(this.finMarketsAppDBDataSet1.ViewWallet);
            calculateWalletbalance();
            refreshWallet();
        }

        private void refreshWallet()
        {
            ConnectDB connectDb = new ConnectDB();
            
            Users user = new Users();
            user = connectDb.checkLoggedUser();

            (decimal[] up, decimal[] down) = connectDb.CalculateChangeWallet(user);

            int i = walletDataGridView.RowCount;
            i--;

            while (i >= 0)
            {
//                MessageBox.Show(up[i].ToString());
//                MessageBox.Show(down[i].ToString());
                // MessageBox.Show(walletDataGridView.Rows[i].Cells[5].Value.ToString());
                // MessageBox.Show(walletDataGridView.Rows[i].Cells[5].Value.ToString());
                if (Convert.ToDecimal(walletDataGridView.Rows[i].Cells[6].Value) >= up[i])
                {
                    notifyIcon1.Visible = true;
                    walletDataGridView.Rows[i].Cells[6].Style.BackColor = Color.GreenYellow;
                    notifyIcon1.ShowBalloonTip(300, "Financial Markets App - Alert", walletDataGridView.Rows[i].Cells[0].Value.ToString() + " price above your limit", ToolTipIcon.None);
                }
                else if (Convert.ToDecimal(walletDataGridView.Rows[i].Cells[6].Value) <= -down[i])
                {
                    notifyIcon1.Visible = true;
                    walletDataGridView.Rows[i].Cells[6].Style.BackColor = Color.Red;
                    notifyIcon1.ShowBalloonTip(300, "Financial Markets App - Alert", walletDataGridView.Rows[i].Cells[0].Value.ToString() + " price below your limit", ToolTipIcon.None);
                }

                i--;
            }

        }

        private void removeFromDBButton_Click(object sender, EventArgs e)
        {
            Cryptocurrencies crypto = new Cryptocurrencies();
            crypto.Symbol = "'" + adminSymbolTextBox.Text + "'";
            ConnectDB connectDb = new ConnectDB();
            connectDb.deleteFromDB(crypto);
            this.cryptocurrenciesTableAdapter.Fill(this.finMarketsAppDBDataSet.Cryptocurrencies);
        }

        private void darkWhiteButton_Click(object sender, EventArgs e)
        {
            // if (BackColor != Color.Black)
            if (BackgroundFlag == 0)
            {
                // BackColor = Color.Black;
                this.BackgroundImage = Properties.Resources.backlogo13;
                walletDataGridView.BackgroundColor = Color.Green;
                addToWalletBtn.BackColor = Color.Green;
                refreshBtn.BackColor = Color.Green;
                BackgroundFlag = 1;
            }
            else
            {
                // BackColor = Color.SteelBlue;
                this.BackgroundImage = Properties.Resources.backlogo20;
                walletDataGridView.BackgroundColor = Color.DodgerBlue;
                addToWalletBtn.BackColor = Color.DodgerBlue;
                refreshBtn.BackColor = Color.DodgerBlue;
                BackgroundFlag = 0;
            }
        }

        private void plEngButton_Click(object sender, EventArgs e)
        {
            if (walletLabel.Text == "WALLET")
            {
                cryptocurrenciesLabel.Text = "kryptowaluty";
                currenciesLabel.Text = "waluty";
                apiButton.Text = "Odśwież";
                apiNbpButton.Text = "Pokaż";
                darkLightButton.Text = "Ciemny/Jasny";
                logOutButton.Text = "Wyloguj";
                cryptocurrenciesListLabel.Text = "LISTA KRYPTOWALUT";
                searchButton.Text = "Szukaj";
                walletLabel.Text = "PORTFEL";
                walletNameLabel.Text = "nazwa";
                walletPriceLabel.Text = "cena";
                walletQuantityLabel.Text = "ilość";
                addToWalletBtn.Text = "Dodaj/Aktualizuj";
                refreshBtn.Text = "Odśwież ceny";
                removeFromWalletBtn.Text = "Usuń";
                balanceLabel.Text = "SALDO:";
                downloadButton.Text = "Pobierz";
                downloadLabel.Text = "Zapisz do pliku";
            }
            else
            {
                cryptocurrenciesLabel.Text = "cryptocurrencies";
                currenciesLabel.Text = "currencies";
                apiButton.Text = "Refresh";
                apiNbpButton.Text = "Show";
                darkLightButton.Text = "Dark / Light";
                logOutButton.Text = "Log out";
                cryptocurrenciesListLabel.Text = "CRYPTOCURRENCIES LIST";
                searchButton.Text = "Search";
                walletLabel.Text = "WALLET";
                walletNameLabel.Text = "name";
                walletPriceLabel.Text = "price";
                walletQuantityLabel.Text = "quantity";
                addToWalletBtn.Text = "Add / Update";
                refreshBtn.Text = "Refresh prices";
                removeFromWalletBtn.Text = "Remove";
                balanceLabel.Text = "BALANCE:";
                downloadButton.Text = "Download";
                downloadLabel.Text = "Save wallet to file";
            }
        }

        private void downloadButton_Click(object sender, EventArgs e)
        {
            String contentName = String.Empty;
            String contentSymbol = String.Empty;
            String contentPrice = String.Empty;
            String contentQuantity = String.Empty;
            String contentSum = String.Empty;
            String contentChange = String.Empty;
            String dashes = "--------------------------------------";

            DateTime thisDay = DateTime.Today;

            SaveFileDialog saveFile = new SaveFileDialog();
            saveFile.Filter = "txt files (*.txt)|*.txt|All files (*.*)|*.*";
            saveFile.Title = "Save File";
            saveFile.ShowDialog();
 
            if (saveFile.FileName != "")
            {
                File.AppendAllText(saveFile.FileName, walletLabel.Text + " ");
                File.AppendAllText(saveFile.FileName, thisDay.ToString("d") + Environment.NewLine);

                for (int i = 0; i < walletDataGridView.RowCount; i++)
                {
                    if (walletDataGridView.CurrentRow.Index != -1)
                    {
                        contentName = walletDataGridView.Rows[i].Cells[0].Value.ToString();
                        contentSymbol = walletDataGridView.Rows[i].Cells[1].Value.ToString();
                        contentPrice = walletDataGridView.Rows[i].Cells[2].Value.ToString();
                        contentQuantity = walletDataGridView.Rows[i].Cells[3].Value.ToString();
                        contentSum = walletDataGridView.Rows[i].Cells[4].Value.ToString();
                        contentChange = walletDataGridView.Rows[i].Cells[5].Value.ToString();
                        File.AppendAllText(saveFile.FileName, contentName + "  " + contentSymbol + "  " + contentPrice + "  " + contentQuantity + "  " + contentSum + "  " + contentChange + Environment.NewLine);
                    }
                }
                File.AppendAllText(saveFile.FileName, dashes + Environment.NewLine + balanceLabel.Text + " " + balanceValueLabel.Text + Environment.NewLine + Environment.NewLine);
            }
        }

        private void Main_Resize(object sender, EventArgs e)
        {
            if (WindowState == FormWindowState.Minimized)
            {
                ShowIcon = false;
                notifyIcon1.Visible = true;
                ShowInTaskbar = false;
                //                notifyIcon1.BalloonTipTitle = "Financial Markets App";
                //                notifyIcon1.BalloonTipText = "Application minimized";
                notifyIcon1.ShowBalloonTip(400, "Financial Markets App", "Application minimalized", ToolTipIcon.None);
            }
        }

        private void notifyIcon1_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            ShowInTaskbar = true;
            notifyIcon1.Visible = false;
            WindowState = FormWindowState.Normal;

            refreshWallet();

        }
    }    
        
}
