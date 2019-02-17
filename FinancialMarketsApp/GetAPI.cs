using System;
using Newtonsoft.Json.Linq;


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
                    Console.WriteLine(e);
                }

                if (checkId != null)
                {
                    int startIndex = 0;
                    int length = 4;
                    int priceLength = 7;

                    try
                    {
                        string cryptoName = jsonObj.SelectToken("$.data[" + id + "].name").ToString();
                        string cryptoSymbol = jsonObj.SelectToken("$.data[" + id + "].symbol").ToString();
                        string cryptoPrice = jsonObj.SelectToken("$.data[" + id + "].quote.USD.price").ToString().Substring(startIndex, priceLength);
                        string cryptoChange_24h = jsonObj.SelectToken("$.data[" + id + "].quote.USD.percent_change_24h").ToString().Substring(startIndex, length);
                        string cryptoChange_7d = jsonObj.SelectToken("$.data[" + id + "].quote.USD.percent_change_7d").ToString().Substring(startIndex, length);
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
                catch (Exception e)
                    {
                        Console.WriteLine(e);
                    }
                    

                

                    
                }
              
             }
        }
}

