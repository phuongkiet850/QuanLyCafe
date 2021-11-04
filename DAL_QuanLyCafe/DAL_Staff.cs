using DTO_QuanLyCafe;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DAL_QuanLyCafe
{
    public class DAL_Staff : DBConnect
    {
        private static DAL_Staff instance;

        public static DAL_Staff Instance
        {
            get { if (instance == null) instance = new DAL_Staff(); return instance; }
            private set { instance = value; }
        }

        private DAL_Staff() { }

        SqlConnection Connection;
        SqlDataAdapter SDA;

        DataTable data = new DataTable();

        public bool ExcuteScript()
        {
            Process.Start(Application.StartupPath + @"\data\Data.bat");
            return true;
        }

        public bool AcceptLogin(DTO_Staff staff)
        {
            using (Connection = new SqlConnection(_Connection))
            {
                string TruyVan = @"exec sp_AcceptLogin @Email = '" + staff.Email + "', @Password = '" + staff.Password + "'";
                SDA = new SqlDataAdapter(TruyVan, _Connection);
                data = new DataTable();
                SDA.Fill(data);
                if (SDA.Fill(data) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public bool ForgotPassword(DTO_Staff staff)
        {
            using (Connection = new SqlConnection(_Connection))
            {
                string TruyVan = @"exec sp_ForgotPassword @Email = '" + staff.Email + "'";
                SDA = new SqlDataAdapter(TruyVan, _Connection);
                data = new DataTable();
                SDA.Fill(data);
                if (SDA.Fill(data) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public DataTable Check(DTO_Staff staff)
        {
            using (Connection = new SqlConnection(_Connection))
            {
                string TruyVan = @"exec sp_ForgotPassword @Email = '" + staff.Email + "'";
                SDA = new SqlDataAdapter(TruyVan, _Connection);
                data = new DataTable();
                SDA.Fill(data);
                return data;
            }
        }

        public bool UpdatePassword(DTO_Staff staff)
        {
            using (Connection = new SqlConnection(_Connection))
            {
                string TruyVan = @"exec sp_UpdatePassword @Email = '" + staff.Email + "', @Password = '" + staff.Password + "'";
                SDA = new SqlDataAdapter(TruyVan, _Connection);
                data = new DataTable();
                SDA.Fill(data);
                return true;
            }
        }
    }
}
