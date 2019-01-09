
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Windows.Forms;
using FinancialMarketsApp;

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
                crypto.idCrypto = Convert.ToInt32(reader["idCrypto"]);
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

        public List<Cryptocurrencies> search(string searchText)
        {
            List<Cryptocurrencies> listCrpyto = new List<Cryptocurrencies>();

            string connectionString = @"Data Source=(localdb)\LocalDBKN;Initial Catalog=FinMarketsAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string query = @"SELECT * FROM Cryptocurrencies WHERE symbol like " + "'%" + searchText.Trim() + "%'";
            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Cryptocurrencies crypto = new Cryptocurrencies();
                crypto.Name = reader["name"].ToString();
                crypto.Symbol = reader["symbol"].ToString();
                crypto.Price = reader["price"].ToString();
                crypto.Change7d = reader["change7d"].ToString();
                crypto.Change24h = reader["change24h"].ToString();
                listCrpyto.Add(crypto);
            }

            connection.Close();

            return listCrpyto;
        }


        public bool saveWalletsC(WalletsC walletsC)
        {
            string connectionString = @"Data Source=(localdb)\LocalDBKN;Initial Catalog=FinMarketsAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string query = @"INSERT INTO WalletsC VALUES (" + walletsC.idUser + "," + walletsC.idWalletC + "," + walletsC.idCrypto + "," + "'"+walletsC.quantity+"'" + "," + "'"+walletsC.sum+"'" + "," + walletsC.idAlert + ")";
            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();

            connection.Close();
            return true;
        }

        public bool updateWalletsC(WalletsC walletsC)
        {
            string connectionString = @"Data Source=(localdb)\LocalDBKN;Initial Catalog=FinMarketsAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string query = @"UPDATE WalletsC SET idUser = " + walletsC.idUser + ",idWalletC=" + walletsC.idWalletC + ",idCrypto=" + walletsC.idCrypto + ",quantity=" + "'"+walletsC.quantity+"'" + ",sum=" + "'"+walletsC.sum+"'" + ",idAlert=" + walletsC.idAlert + " WHERE idCrypto = " + walletsC.idCrypto + "";
            //MessageBox.Show(query);
            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();

            connection.Close();
            return true;
        }

        public WalletsC readWalletsC(int idUser, int idWalletC, int idCrypto)
        {
            WalletsC walletsC2 = new WalletsC();

            string connectionString = @"Data Source=(localdb)\LocalDBKN;Initial Catalog=FinMarketsAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string query = @"SELECT * FROM WalletsC WHERE idUser = " + idUser + " AND idWalletC = " + idWalletC + "AND idCrypto =" + idCrypto +"";
            SqlCommand command = new SqlCommand(query, connection);

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                walletsC2.idUser = Convert.ToInt32(reader["idUser"]);
                walletsC2.idWalletC = Convert.ToInt32(reader["idWalletC"]);
                walletsC2.idCrypto = Convert.ToInt32(reader["idCrypto"]);
                walletsC2.quantity = reader["quantity"].ToString();
                walletsC2.sum = reader["sum"].ToString();
                walletsC2.idAlert = Convert.ToInt32(reader["idAlert"]);
            }

            connection.Close();
            return walletsC2;
        }

        public bool deleteWalletsC(WalletsC walletsC)
        {
            string connectionString = @"Data Source=(localdb)\LocalDBKN;Initial Catalog=FinMarketsAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string query = @"DELETE FROM WalletsC WHERE idCrypto = " + walletsC.idCrypto + "";
            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();

            connection.Close();
            return true;
        }

        public bool deleteFromDB(Cryptocurrencies crypto)
        {
            string connectionString = @"Data Source=(localdb)\LocalDBKN;Initial Catalog=FinMarketsAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string query = @"DELETE FROM Cryptocurrencies WHERE symbol = " + crypto.Symbol + "";
            SqlCommand command = new SqlCommand(query, connection);
            command.ExecuteNonQuery();

            connection.Close();
            return true;
        }


        public Users checkLoggedUser()
        {
            Users user = new Users();

            string connectionString = @"Data Source=(localdb)\LocalDBKN;Initial Catalog=FinMarketsAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection connection = new SqlConnection(connectionString);

            connection.Open();
            String query = @"SELECT idUsers,login,isAdmin FROM Users WHERE isLogged = " + 1 + "";
            SqlCommand command2 = new SqlCommand(query, connection);

            SqlDataReader reader2 = command2.ExecuteReader();
            while (reader2.Read())
            {
                user.idUsers = Convert.ToInt32(reader2["idUsers"]);
                user.login = reader2["login"].ToString();
                user.isAdmin = Convert.ToInt32(reader2["isAdmin"]);
            }
            connection.Close();
            
            return user;
        }

        public float calculateBalance()
        {
            float balance = 0;
            float sum = 0;
            string connectionString = @"Data Source=(localdb)\LocalDBKN;Initial Catalog=FinMarketsAppDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            String query = @"SELECT sum FROM dbo.ViewWallet";
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                sum = Convert.ToSingle(reader["sum"].ToString());
                balance = balance + sum;
            }

            connection.Close();
            return balance;
        }

    }
}