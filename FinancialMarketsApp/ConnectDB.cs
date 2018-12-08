using System.Data.SqlClient;

namespace FinancialMarketsApp
{
    public class ConnectDB
    {
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