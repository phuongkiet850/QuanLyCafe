using BUS_QuanLyCafe;
using DTO_QuanLyCafe;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI_QuanLyCafe
{
    public partial class Payment_frm : Form
    {
        public Payment_frm()
        {
            InitializeComponent();
        }
        public float TotalVAT;
        public float total;
        DTO_Bill bill = new DTO_Bill();
        private void Payment_frm_Load(object sender, EventArgs e)
        {
            this.ActiveControl = label1;
            ShowVoucher();
            ShowPayment();
            ShowBill(); 
        }

        void ShowBill()
        {
            try
            {
                GetText();
                CheckIn_lbl.Text = "Giờ vào : " + DateTime.Parse(BUS_Bill.Instance.DetailBill(bill).Rows[0][4].ToString()).ToString("ddd dd/MM/yyyy HH:mm:ss");
                Bill_lv.Items.Clear();
                total = 0;
                for (int i = 0; i < BUS_Bill.Instance.DetailBill(bill).Rows.Count; i++)
                {
                    ListViewItem item = new ListViewItem(BUS_Bill.Instance.DetailBill(bill).Rows[i][0].ToString() + " " + BUS_Bill.Instance.DetailBill(bill).Rows[i][6].ToString());
                    item.SubItems.Add(BUS_Bill.Instance.DetailBill(bill).Rows[i][1].ToString());
                    item.SubItems.Add(BUS_Bill.Instance.DetailBill(bill).Rows[i][2].ToString());
                    item.SubItems.Add(BUS_Bill.Instance.DetailBill(bill).Rows[i][3].ToString());
                    Bill_lv.Items.Add(item);
                    total = total + (float)Convert.ToDouble(BUS_Bill.Instance.DetailBill(bill).Rows[i][3].ToString());
                }

                TotalOrder_lbl.Text = "Tổng hóa đơn: " + String.Format("{0:0,0}", total) + " VNĐ";

                float TotalSale = total - (total * bill.PercentVoucher / 100);
                Voucher_lbl.Text = "(" + bill.PercentVoucher + "%): " + String.Format("{0:0,0}", TotalSale) + " VNĐ";

                TotalVAT = TotalSale + (TotalSale * 10 / 100);
                VAT_lbl.Text = "Thuế VAT (10%) : " + String.Format("{0:0,0}", TotalVAT) + " VNĐ";

                Total_lbl.Text = "Số tiền phải trả : " + String.Format("{0:0,0}", TotalVAT) + " VNĐ";
                
                NameStafff_lbl.Text = "Thu ngân : " + BUS_Bill.Instance.DetailBill(bill).Rows[0][7].ToString();
                DateEnd_lbl.Text = "Giờ ra : " + DateTime.Now.ToString("ddd dd/MM/yyyy HH:mm:ss");
                NameTable_lbl.Text = Order_frm.NameTable;
            }
            catch (Exception) { }
        }

        void ShowPayment()
        {
            try
            {
                Payment_cbb.DataSource = BUS_Bill.Instance.ListPayMent();
                Payment_cbb.DisplayMember = "Method";
                Payment_cbb.ValueMember = "IdPayment";
            }
            catch (Exception) { }
        }

        void ShowVoucher()
        {
            try
            {
                Voucher_cbb.DataSource = BUS_Bill.Instance.ListVoucher();
                Voucher_cbb.DisplayMember = "NameVoucher";
                Voucher_cbb.ValueMember = "PercentVoucher";
            }
            catch (Exception) { }
        }

        private void Voucher_cbb_SelectedValueChanged(object sender, EventArgs e)
        {
            try
            {
                bill.PercentVoucher = (float)Convert.ToDouble(Voucher_cbb.SelectedValue.ToString());
                ShowBill();
                this.ActiveControl = label1;
            }
            catch (Exception) { }
        }

        private void Payment_cbb_SelectedValueChanged(object sender, EventArgs e)
        {
            this.ActiveControl = label1;
        }

        private void Voucher_cbb_KeyDown(object sender, KeyEventArgs e)
        {
            e.SuppressKeyPress = true;
        }

        private void Payment_cbb_KeyDown(object sender, KeyEventArgs e)
        {
            e.SuppressKeyPress = true;
        }
        private void GetText()
        {
            try
            {
                bill.IdTable = Order_frm.IdTable;
                bill.IdBill = Convert.ToInt32(BUS_Bill.Instance.DetailBill(bill).Rows[0][9].ToString());
                bill.ToTal = TotalVAT;
                bill.Shift = Login_frm.Shift.Trim();
                bill.NameStaff = BUS_Bill.Instance.DetailBill(bill).Rows[0][7].ToString().Trim();
                bill.CheckOut = DateTime.Parse(DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss"));
                bill.CheckIn = DateTime.Parse(DateTime.Parse(BUS_Bill.Instance.DetailBill(bill).Rows[0][4].ToString()).ToString("dd/MM/yyyy HH:mm:ss"));
                bill.Method = Payment_cbb.Text.Trim();
            }
            catch (Exception) { }
        }

        private void Payment_btn_Click(object sender, EventArgs e)
        {
            try
            {
                GetText();
                BUS_Bill.Instance.AddStatistic(bill);

                for (int i = 0; i < BUS_Bill.Instance.DetailBill(bill).Rows.Count; i++)
                {
                    bill.NameMenu = (BUS_Bill.Instance.DetailBill(bill).Rows[i][0].ToString() + " " + BUS_Bill.Instance.DetailBill(bill).Rows[i][6].ToString()).Trim();
                    bill.Amount = Convert.ToInt32(BUS_Bill.Instance.DetailBill(bill).Rows[i][1].ToString());
                    BUS_Bill.Instance.AddDetailStatistic(bill);
                }

                BUS_Bill.Instance.DeleteBill(bill);

                MessageBox.Show("Thanh toán thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                this.Close();
            }
            catch (Exception)
            {
                MessageBox.Show("Thanh toán thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
