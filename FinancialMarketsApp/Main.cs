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
            int count = 1;

            var client = new HttpClient();
            var url = "https://api.coinmarketcap.com/v2/ticker/?limit=100";

            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            string response = client.GetStringAsync(url).Result;

            for (int i = 0; i < 5000; i++)
            {
                Cryptocurrencies crypto = new Cryptocurrencies();
                GetAPI getapi = new GetAPI();
                crypto = getapi.GetData(count, response);
                ConnectDB connectDb = new ConnectDB();
                if (crypto.Symbol != null)
                {
                    connectDb.ApiSave(crypto);
                }
                count++;
            }

        }

    }
}
