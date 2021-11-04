using DTO_QuanLyCafe;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL_QuanLyCafe
{
    public class DAL_Menu : DBConnect
    {
        private static DAL_Menu instance;

        public static DAL_Menu Instance
        {
            get { if (instance == null) instance = new DAL_Menu(); return DAL_Menu.instance; }
            private set { DAL_Menu.instance = value; }
        }

        private DAL_Menu() { }

        SqlConnection Connection;
        SqlDataAdapter SDA;
        DataTable data = new DataTable();

        public DataTable ListMenu(DTO_Menu menu)
        {
            using (Connection = new SqlConnection(_Connection))
            {
                string TruyVan = @"exec sp_ListMenu @CategoryID = '" + menu.CategoryID + "'";
                SDA = new SqlDataAdapter(TruyVan, _Connection);
                data = new DataTable();
                SDA.Fill(data);
                return data;
            }
        }
    }
}
