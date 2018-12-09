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

            for (int i = 0; i < 100; i++)
            {
                getapi.GetData(i, response);
                apiProgressBar.Increment(1);
               // MessageBox.Show(i.ToString());
            }

        }

        private void apiNbpButton_Click(object sender, EventArgs e)
        {
            var client2 = new HttpClient();
            var urlNBP1 = "http://api.nbp.pl/api/exchangerates/tables/A?format=json";
            var urlNBP2 = "http://api.nbp.pl/api/exchangerates/tables/B?format=json";
            var urlNBP3 = "http://api.nbp.pl/api/exchangerates/tables/C?format=json";
            string responseNBP1 = client2.GetStringAsync(urlNBP1).Result;
            string responseNBP2 = client2.GetStringAsync(urlNBP2).Result;
            string responseNBP3 = client2.GetStringAsync(urlNBP3).Result;
            MessageBox.Show(responseNBP1+"  TAB  "+responseNBP2+"  TAB  "+responseNBP3);
        }

    }
}
