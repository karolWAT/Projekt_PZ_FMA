using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinancialMarketsApp
{
    public class Cryptocurrencies
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Symbol { get; set; }

        public string Price { get; set; }

        public string Change24h { get; set; }

        public string Change7d { get; set; }
    }
}
