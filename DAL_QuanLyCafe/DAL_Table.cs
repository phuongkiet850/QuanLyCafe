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
    public class DAL_Table : DBConnect
    {
        private static DAL_Table instance;

        public static DAL_Table Instance
        {
            get { if (instance == null) instance = new DAL_Table(); return DAL_Table.instance; }
            private set { DAL_Table.instance = value; }
        }

        SqlConnection Connection;
        SqlDataAdapter SDA;
        DataTable data = new DataTable();

        public DataTable ListTable()
        {
            using (Connection = new SqlConnection(_Connection))
            {
                string TruyVan = @"exec sp_ListTable";
                SDA = new SqlDataAdapter(TruyVan, _Connection);
                data = new DataTable();
                SDA.Fill(data);
                return data;
            }
            
        }

        public bool MergeTable(int NewIdTable, int OldIdTable, int NewIdBill, int OldIdBill)
        {
            using (Connection = new SqlConnection(_Connection))
            {
                string TruyVan = @"exec sp_MergeTable @NewIdTable = " + NewIdTable + ", @OldIdTable = " + OldIdTable + ", @NewIdBill = " + NewIdBill + ", @OldIdBill = " + OldIdBill + "";
                SDA = new SqlDataAdapter(TruyVan, _Connection);
                data = new DataTable();
                SDA.Fill(data);
                return true;
            }

        }

        public bool Switch(int NewIdTable, int OldIdTable)
        {
            using (Connection = new SqlConnection(_Connection))
            {
                string TruyVan = @"exec sp_Switch @NewIdTable = " + NewIdTable + ", @OldIdTable = " + OldIdTable + "";
                SDA = new SqlDataAdapter(TruyVan, _Connection);
                data = new DataTable();
                SDA.Fill(data);
                return true;
            }
        }

       
    }
}
