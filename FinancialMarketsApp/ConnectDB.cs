using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace FinancialMarketsApp
{
    public class ConnectDB
    {

        public Cryptocurrencies Read(String symbol)
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


        public bool Save(Cryptocurrencies crypto)
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

        public bool Update(Cryptocurrencies crypto)
        {
            string connectionString = @"Data Source=(localdb)\LocalDBKN;Initial Catalog=FinMarketsAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string query = @"UPDATE Cryptocurrencies SET name = " + crypto.Name + ",price=" + crypto.Price + ",change7d=" + crypto.Change7d + ",change24h=" + crypto.Change24h + " WHERE symbol = " + crypto.Symbol + "";
            //MessageBox.Show(query);
            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();

            connection.Close();
            return true;
        }

    }
}