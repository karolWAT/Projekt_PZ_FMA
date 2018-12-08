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

        private void logIn()
        {
            int count = 0;

            string connectionString = @"Data Source = (localdb)\LocalDBKN; Initial Catalog = FinMarketsAppDB; Integrated Security = True; Connect Timeout = 30; Encrypt = False; TrustServerCertificate = False; ApplicationIntent = ReadWrite; MultiSubnetFailover = False";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            String query = @"SELECT Count(*) FROM Users WHERE login = '" + loginTextBox.Text + "' AND password = '" + passTextBox.Text + "'";

            SqlCommand command = new SqlCommand(query, connection);
            DataTable dt = new DataTable();

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                count = Convert.ToInt32(reader[0].ToString());
            }
            //MessageBox.Show(count.ToString());
            connection.Close();

            if (count == 1)
            {
                this.Hide();
                Main main = new Main();
                main.Show();
            }
            else
            {
                MessageBox.Show("Wrong login or password, try again.");
            }
        }

    }
}
