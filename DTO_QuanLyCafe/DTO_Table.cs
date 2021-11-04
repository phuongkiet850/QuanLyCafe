using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO_QuanLyCafe
{
    public class Table
    {
        private int iD;
        private string name;
        private string status;

        public int ID { get => iD; set => iD = value; }

        public string Name { get => name; set => name = value; }

        public string Status { get => status; set => status = value; }

        public Table(DataRow row)
        {
            this.ID = (int)row[0];
            this.Name = row[1].ToString();
            this.Status = row[2].ToString();
        }

    }
}
