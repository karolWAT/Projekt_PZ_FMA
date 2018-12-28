using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FinancialMarketsApp
{
    public partial class Welcome : Form
    {

        public Welcome()
        {
           InitializeComponent();
//           Main main = new Main();     // TEST
//           main.Show();                // TEST
        }

        private void exitButton_Click(object sender, EventArgs e)
        {
            this.Close();
            Application.Exit();
        }

        private void loginButton_Click(object sender, EventArgs e)
        {
            logIn();
        }

        private void passTextBox_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                logIn();
            }
        }

        private Users logIn()
        {
            Users loggedUser = new Users();
            int count = 0;

            string connectionString = @"Data Source = (localdb)\LocalDBKN; Initial Catalog = FinMarketsAppDB; Integrated Security = True; Connect Timeout = 30; Encrypt = False; TrustServerCertificate = False; ApplicationIntent = ReadWrite; MultiSubnetFailover = False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            String query = @"SELECT Count(*) FROM Users WHERE login = '" + loginTextBox.Text + "' AND password = '" + passTextBox.Text + "'";
           
            SqlCommand command = new SqlCommand(query, connection);

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                count = Convert.ToInt32(reader[0].ToString());
            }
            //MessageBox.Show(count.ToString());
            connection.Close();

            if (count == 1)
            {
                loggedUser.idUsers = 0;

                connection.Open();
                String query2 = @"SELECT idUsers FROM Users WHERE login = '" + loginTextBox.Text + "' AND password = '" + passTextBox.Text + "'";
                SqlCommand command2 = new SqlCommand(query2, connection);

                SqlDataReader reader2 = command2.ExecuteReader();
                while (reader2.Read())
                {
                    loggedUser.idUsers = Convert.ToInt32(reader2["idUsers"]);
                }
                connection.Close();

                connection.Open();
                String query3 = @"UPDATE Users SET isLogged = " + 1 + " WHERE idUsers = " + loggedUser.idUsers + "";
                SqlCommand command3 = new SqlCommand(query3, connection);
                command3.ExecuteNonQuery();
                connection.Close();

                this.Hide();
                Main main = new Main();
                main.Show();
            }
            else
            {
                MessageBox.Show("Wrong login or password, try again.");
            }
            return loggedUser;
        }

    }
}
