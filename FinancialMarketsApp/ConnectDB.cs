using System;
using System.Data.SqlClient;

namespace FinancialMarketsApp
{
    public class ConnectDB
    {

        public Cryptocurrencies Get(String symbol)
        {
            Cryptocurrencies crypto = new Cryptocurrencies();

            string connectionString = @"Data Source=(localdb)\LocalDBKN;Initial Catalog=FinMarketsAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string query = @"SELECT * FROM Cryptocurrencies WHERE symbol = " + "'" + symbol.Trim() + "'";
            SqlCommand command = new SqlCommand(query, connection);

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                crypto.Name = reader["name"].ToString();
                crypto.Symbol = reader["symbol"].ToString();
                crypto.Price = reader["price"].ToString();
                crypto.Change7d = reader["change7d"].ToString();
                crypto.Change24h = reader["change24h"].ToString();
            }

            connection.Close();
            return crypto;
        }



        public bool ApiSave(Cryptocurrencies crypto)
        {
            string connectionString = @"Data Source=(localdb)\LocalDBKN;Initial Catalog=FinMarketsAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string query = @"INSERT INTO Cryptocurrencies VALUES (" + crypto.Name + "," + crypto.Symbol + "," + crypto.Price + "," + crypto.Change24h + "," + crypto.Change7d +")";
            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();

            connection.Close();
            return true;
        }
    }
}