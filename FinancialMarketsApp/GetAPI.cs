using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;

namespace FinancialMarketsApp
{
    public class GetAPI
    {

        public Cryptocurrencies GetData(int i, string response)
        {
            string j = i.ToString();
            Cryptocurrencies crypto = new Cryptocurrencies();
            //           Console.Write(response);
            dynamic jsonObj = JObject.Parse(response);
            try
            {
                string cryptoName = jsonObj["data"]["" + j + ""]["name"].ToString();
                string cryptoSymbol = jsonObj["data"]["" + j + ""]["symbol"].ToString();
                string cryptoPrice = jsonObj["data"]["" + j + ""]["quotes"]["USD"]["price"].ToString();
                string cryptoChange_24h = jsonObj["data"]["" + j + ""]["quotes"]["USD"]["percent_change_24h"].ToString();
                string cryptoChange_7d = jsonObj["data"]["" + j + ""]["quotes"]["USD"]["percent_change_7d"].ToString();
                //                MessageBox.Show(cryptoName);
                //                MessageBox.Show(cryptoSymbol);
                //                MessageBox.Show(cryptoPrice);
                //                MessageBox.Show(cryptoChange_24h);
                //                MessageBox.Show(cryptoChange_7d);
                crypto.Symbol = "'" + cryptoSymbol + "'";
                crypto.Name = "'" + cryptoName + "'";
                crypto.Price = "'" + cryptoPrice + "'";
                crypto.Change24h = "'" + cryptoChange_24h + "'";
                crypto.Change7d = "'" + cryptoChange_7d + "'";
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
            }
            return crypto;
        }

    }
}
