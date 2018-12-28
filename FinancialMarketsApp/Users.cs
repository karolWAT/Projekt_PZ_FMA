using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinancialMarketsApp
{
    public class Users
    {
        public int idUsers { get; set; }

        public string login { get; set; }

        public string password { get; set; }

        public string email { get; set; }

        public int isLogged { get; set; }

        public int isAdmin { get; set; }
    }
}
