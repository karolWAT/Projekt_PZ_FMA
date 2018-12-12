using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Serialization;



namespace FinancialMarketsApp
{
    public class GetAPI
    {

        public void cryptoGetData(int i,string response)
        {
            Cryptocurrencies crypto = new Cryptocurrencies();

            int id = i;
            string checkId = null;

            dynamic jsonObj = JObject.Parse(response);
            
                try
                {
//                checkId = jsonObj["data"]["" + id + ""].ToString();
                checkId = jsonObj.SelectToken("$.data["+id+"].id").ToString();
//                MessageBox.Show(checkId);
                }
                catch (Exception e)
                {
                    //Console.WriteLine(e);
                }

                if (checkId != null)
                {
                    string cryptoName = jsonObj.SelectToken("$.data[" + id + "].name").ToString();
                    string cryptoSymbol = jsonObj.SelectToken("$.data[" + id + "].symbol").ToString();
                    string cryptoPrice = jsonObj.SelectToken("$.data[" + id + "].quote.USD.price").ToString();
                    string cryptoChange_24h = jsonObj.SelectToken("$.data[" + id + "].quote.USD.percent_change_24h").ToString();
                    string cryptoChange_7d = jsonObj.SelectToken("$.data[" + id + "].quote.USD.percent_change_7d").ToString();
                    //     MessageBox.Show(cryptoName);
                    //     MessageBox.Show(cryptoSymbol);
                    //     MessageBox.Show(cryptoPrice);
                    //     MessageBox.Show(cryptoChange_24h);
                    //     MessageBox.Show(cryptoChange_7d);

                ConnectDB connectDb = new ConnectDB();
                crypto = connectDb.Read(cryptoSymbol);       // check if currency already exist in db

                    if (crypto.Symbol == null)
                    {
                        crypto.Symbol = "'" + cryptoSymbol + "'";
                        crypto.Name = "'" + cryptoName + "'";
                        crypto.Price = "'" + cryptoPrice + "'";
                        crypto.Change24h = "'" + cryptoChange_24h + "'";
                        crypto.Change7d = "'" + cryptoChange_7d + "'";

                        connectDb.Save(crypto);
                    }
                    else
                    {
                        crypto.Symbol = "'" + cryptoSymbol + "'";
                        crypto.Name = "'" + cryptoName + "'";
                        crypto.Price = "'" + cryptoPrice + "'";
                        crypto.Change24h = "'" + cryptoChange_24h + "'";
                        crypto.Change7d = "'" + cryptoChange_7d + "'";

                        connectDb.Update(crypto);
                    }
                }
              
             }
        }
}

