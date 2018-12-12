using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
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
                getapi.GetData(i, response);
                apiProgressBar.Increment(1);
               // MessageBox.Show(i.ToString());
                j = i + 1;
                progrssBarlabel.Text = j+"%";
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
            MessageBox.Show(responseNBPtabA + "\n\n" + responseNBPgold);
        }

        private void Main_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'finMarketsAppDBDataSet1.ViewWallet' table. You can move, or remove it, as needed.
            this.viewWalletTableAdapter.Fill(this.finMarketsAppDBDataSet1.ViewWallet);
            // TODO: This line of code loads data into the 'finMarketsAppDBDataSet.Cryptocurrencies' table. You can move, or remove it, as needed.
            this.cryptocurrenciesTableAdapter.Fill(this.finMarketsAppDBDataSet.Cryptocurrencies);

        }


        void fillDataGridView()
        {
            // serect where like % searchText
        }

        private void cryptoDataGridView_CellClick(object sender, EventArgs e)
        {
            if (cryptoDataGridView.CurrentRow.Index != -1)
            {
                walletNameTextBox.Text = cryptoDataGridView.CurrentRow.Cells[0].Value.ToString();
                walletSymbolTextBox.Text = cryptoDataGridView.CurrentRow.Cells[1].Value.ToString();
                walletPriceTextBox.Text = cryptoDataGridView.CurrentRow.Cells[2].Value.ToString();
                walletQuantityTextBox.Text = "0";
            }  
       
        }


        private void search()
        {
            string searchText = searchTextBox.Text;

            if (searchText != "")
            {
                ConnectDB connectDb = new ConnectDB();

                List<Cryptocurrencies> listCrpyto = new List<Cryptocurrencies>();
                listCrpyto = connectDb.Search(searchText);

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
                    cryptoDataGridView.Rows[i].Cells[2].Value = row.Price;
                    cryptoDataGridView.Rows[i].Cells[3].Value = row.Change24h;
                    cryptoDataGridView.Rows[i].Cells[4].Value = row.Change7d;
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
                cryptoDataGridView.Columns[2].Width = 74;
                cryptoDataGridView.Columns[3].Width = 65;
                cryptoDataGridView.Columns[4].Width = 58;
            }
        }


        private void searchButton_Click(object sender, EventArgs e)
        {
            search();
        }

        private void searchTextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if(e.KeyCode == Keys.Enter)
            {
                search();
            }
        }
    }
}
