﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
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
        public Main()
        {
            InitializeComponent();
        }

        private void logOutButton_Click(object sender, EventArgs e)
        {
            this.Hide();
            Welcome welcome = new Welcome();
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
            // TODO: This line of code loads data into the 'finMarketsAppDBDataSet1.ViewWallet' table. You can move, or remove it, as needed.
            this.viewWalletTableAdapter.Fill(this.finMarketsAppDBDataSet1.ViewWallet);
            // TODO: This line of code loads data into the 'finMarketsAppDBDataSet.Cryptocurrencies' table. You can move, or remove it, as needed.
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
                ;
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

                walletsC.idUser = 5; // powinienem sprawdzać, który użytkownik jest aktualnie zalogowany - dodać flagę w zakładce 
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

                    walletsC.idUser = 5; // powinienem sprawdzać, który użytkownik jest aktualnie zalogowany - dodać flagę w zakładce 
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
            search();
        }

        private void searchTextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                search();
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
                cryptoDataGridView.Columns[2].Width = 74;
                cryptoDataGridView.Columns[3].Width = 65;
                cryptoDataGridView.Columns[4].Width = 58;

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
//                this.cryptocurrenciesTableAdapter.Fill(this.finMarketsAppDBDataSet.Cryptocurrencies);
//                cryptoDataGridView.Refresh();


                cryptoDataGridView.AutoGenerateColumns = true;
                cryptoDataGridView.Columns[0].Width = 79;
                cryptoDataGridView.Columns[1].Width = 42;
                cryptoDataGridView.Columns[2].Width = 74;
                cryptoDataGridView.Columns[3].Width = 65;
                cryptoDataGridView.Columns[4].Width = 58;
            }
        }

        private void refreshButton_Click(object sender, EventArgs e)
        {
            this.viewWalletTableAdapter.Fill(this.finMarketsAppDBDataSet1.ViewWallet);
        }
    }
}