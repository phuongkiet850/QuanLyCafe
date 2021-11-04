using DAL_QuanLyCafe;
using DTO_QuanLyCafe;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS_QuanLyCafe
{
    public class BUS_Menu
    {
        private static BUS_Menu instance;

        public static BUS_Menu Instance
        {
            get { if (instance == null) instance = new BUS_Menu(); return BUS_Menu.instance; }
            private set { BUS_Menu.instance = value; }
        }

        public DataTable ListMenu(DTO_Menu menu)
        {
            return DAL_Menu.Instance.ListMenu(menu);
        }
    }
}
