using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO_QuanLyCafe
{
    public class DTO_Bill
    {
        private int idBill;
        private int idTable;
        private int idDetailBill;
        private int idMenu;
        private int amount;
        private DateTime checkIn;
        private string idVoucher;
        private string idPayment;
        private string idStaff;

        public int IdBill { get => idBill; set => idBill = value; }

        public int IdTable { get => idTable; set => idTable = value; }

        public int IdDetailBill { get => idDetailBill; set => idDetailBill = value; }

        public int IdMenu { get => idMenu; set => idMenu = value; }

        public int Amount { get => amount; set => amount = value; }

        public DateTime CheckIn { get => checkIn; set => checkIn = value; }

        public string IdVoucher { get => idVoucher; set => idVoucher = value; }

        public string IdPayment { get => idPayment; set => idPayment = value; }

        public string IdStaff { get => idStaff; set => idStaff = value; }
    }
}
