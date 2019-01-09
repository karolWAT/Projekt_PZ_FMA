using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Drawing;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FinancialMarketsApp
{
    public partial class Main : Form
    {
        public int searchInt = 0;

        public Main()
        {
            InitializeComponent();

            checkUser();
            calculateWalletbalance();
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
            string connectionString = @"Data Source = (localdb)\LocalDBKN; Initial Catalog = FinMarketsAppDB; Integrated Security = True; Connect Timeout = 30; Encrypt = False; TrustServerCertificate = False; ApplicationIntent = ReadWrite; MultiSubnetFailover = False";
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
            var url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=100";
            client.DefaultRequestHeaders.Add("X-CMC_PRO_API_KEY", "f742b5ad-230c-4dfe-b1dc-7fbe4ec51be4");
            string response = client.GetStringAsync(url).Result;
            //Console.Write(response);
            GetAPI getapi = new GetAPI();

            int j = 0;
            progrssBarlabel.Text = j + "%";
            apiProgressBar.Increment(-100);

            for (int i = 0; i < 100; i++)
            {
                getapi.cryptoGetData(i, response);
                apiProgressBar.Increment(1);
                // MessageBox.Show(i.ToString());
                j = i + 1;
                progrssBarlabel.Text = j + "%";
            }
            MessageBox.Show("Updated");
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

            MessageBox.Show(responseNBPtabA + "\n\n" + responseNBPgold);

        }

        private void Main_Load(object sender, EventArgs e)
        {
            this.viewWalletTableAdapter.Fill(this.finMarketsAppDBDataSet1.ViewWallet);
            this.cryptocurrenciesTableAdapter.Fill(this.finMarketsAppDBDataSet.Cryptocurrencies);
        }


        private void cryptoDataGridView_CellClick(object sender, EventArgs e)
        {
            if (cryptoDataGridView.CurrentRow.Index != -1)
            {
                walletNameTextBox.Text = cryptoDataGridView.CurrentRow.Cells[0].Value.ToString();
                walletSymbolTextBox.Text = cryptoDataGridView.CurrentRow.Cells[1].Value.ToString();
                walletPriceTextBox.Text = cryptoDataGridView.CurrentRow.Cells[2].Value.ToString();
                walletQuantityTextBox.Text = "0";
                
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
            if (walletDataGridView.CurrentRow.Index != -1)
            {
                walletNameTextBox.Text = walletDataGridView.CurrentRow.Cells[0].Value.ToString();
                walletSymbolTextBox.Text = walletDataGridView.CurrentRow.Cells[1].Value.ToString();
                walletPriceTextBox.Text = walletDataGridView.CurrentRow.Cells[2].Value.ToString();
                walletQuantityTextBox.Text = walletDataGridView.CurrentRow.Cells[3].Value.ToString();
                walletNameTextBox.BackColor = Color.GreenYellow;
                walletSymbolTextBox.BackColor = Color.GreenYellow;
                walletPriceTextBox.BackColor = Color.GreenYellow;
                walletQuantityTextBox.BackColor = Color.GreenYellow;
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

                walletsC.idWalletC = 1; // też sprzawdzam użytkonika a póżniej jego crytpo wallet
                walletsC.idCrypto = crypto.idCrypto;
                walletsC.price = crypto.Price;
                walletsC.quantity = walletQuantityTextBox.Text;
                float tempSum = Convert.ToSingle(walletsC.price)*Convert.ToSingle(walletsC.quantity);
                walletsC.sum = tempSum.ToString();
                walletsC.idAlert = 1; // bede pewnie z gui bral dla alertu wzrostoego 1 a dla malejacego 2

                walletsC2 = connectDb.readWalletsC(walletsC.idUser, walletsC.idWalletC, walletsC.idCrypto);
                if (walletsC2.idCrypto != 0)
                {
                    connectDb.updateWalletsC(walletsC);
                }
                else
                {
                    connectDb.saveWalletsC(walletsC);
                }

                this.viewWalletTableAdapter.Fill(this.finMarketsAppDBDataSet1.ViewWallet);
                calculateWalletbalance();
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
                    crypto = connectDb.Read(walletSymbolTextBox.Text);  // to get crypto id from symbol Text Box
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
                        this.viewWalletTableAdapter.Fill(this.finMarketsAppDBDataSet1.ViewWallet);
                        calculateWalletbalance();
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
                    else MessageBox.Show("You do not have this asset in your wallet","Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            else MessageBox.Show("Select asset to remowe","Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        }

        private void searchButton_Click(object sender, EventArgs e)
        {
            if (searchTextBox.Text == "" & searchInt == 0)
            {
                search();
                searchInt++;
            }
            else if(searchTextBox.Text != "")
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
            this.viewWalletTableAdapter.Fill(this.finMarketsAppDBDataSet1.ViewWallet);
            calculateWalletbalance();
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
            if (BackColor != Color.Black)
            {
                BackColor = Color.Black;
                walletDataGridView.BackgroundColor = Color.Green;
                addToWalletBtn.BackColor = Color.Green;
                refreshBtn.BackColor = Color.Green;
            }
            else
            {
                BackColor = Color.SteelBlue;
                walletDataGridView.BackgroundColor = Color.LimeGreen;
                addToWalletBtn.BackColor = Color.LimeGreen;
                refreshBtn.BackColor = Color.LimeGreen;
            }
        }

        private void plEngButton_Click(object sender, EventArgs e)
        {
            if (walletLabel.Text == "WALLET") {
                cryptocurrenciesLabel.Text = "kryptowaluty";
                currenciesLabel.Text = "waluty";
                apiButton.Text = "Odśwież";
                apiNbpButton.Text = "Odśwież";
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
            } else
            {
                cryptocurrenciesLabel.Text = "cryptocurrencies";
                currenciesLabel.Text = "currencies";
                apiButton.Text = "Refresh";
                apiNbpButton.Text = "Refresh";
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
            }
        }
    }
}