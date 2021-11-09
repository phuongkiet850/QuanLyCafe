﻿using BUS_QuanLyCafe;
using DTO_QuanLyCafe;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI_QuanLyCafe
{
    public partial class Order_frm : Form
    {
        public static string NameTable;
        public static int IdTable;
        public Order_frm()
        {
            InitializeComponent();
        }

        DTO_Bill bill = new DTO_Bill();
        Menu_frm menu = new Menu_frm();
        private void Order_frm_Load(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Maximized;
            Loading_frm.Status = 2;
            this.ActiveControl = label1;
            LoadTable();
            if (Confirm_frm.Result != 1)
            {
                Manage_tsmi.Visible = false;
                Statistic_tsmi.Visible = false;
            }
            this.Focus();
        }
        
        void LoadTable()
        {
            Table_flp.Controls.Clear();
            for (int i = 0; i < BUS_Table.Instance.ListTable().Rows.Count; i++)
            {
                Button btn = new Button();
                btn.Width = 100;
                btn.Height = 90;
                btn.Text = BUS_Table.Instance.ListTable().Rows[i][1].ToString() + Environment.NewLine + BUS_Table.Instance.ListTable().Rows[i][2].ToString();
                btn.Click += btn_Click;
                btn.Tag = BUS_Table.Instance.ListTable().Rows[i][0].ToString();
                if (BUS_Table.Instance.ListTable().Rows[i][2].ToString() == "Trống")
                {
                    btn.BackColor = Color.White;
                }
                else
                {
                    btn.BackColor = Color.AntiqueWhite;
                }
                Table_flp.Controls.Add(btn);
            }
        }

        void ShowBill(int Id)
        {
            try
            {
                bill.IdTable = Id;
                if (BUS_Bill.Instance.DetailBill(bill).Rows.Count > 0)
                {
                    Bill_lv.Items.Clear();
                    NameTable_lbl.Text = "Tên : " + BUS_Bill.Instance.Table(bill).Rows[0][1].ToString();
                    CheckIn_lbl.Text = "Giờ vào : " + DateTime.Parse(BUS_Bill.Instance.DetailBill(bill).Rows[0][4].ToString()).ToString("ddd dd/MM/yyyy HH:mm:ss");
                    float total = 0;
                    for (int i = 0; i < BUS_Bill.Instance.DetailBill(bill).Rows.Count; i++)
                    {
                        ListViewItem item = new ListViewItem(BUS_Bill.Instance.DetailBill(bill).Rows[i][0].ToString() + " " + BUS_Bill.Instance.DetailBill(bill).Rows[i][6].ToString());
                        item.SubItems.Add(BUS_Bill.Instance.DetailBill(bill).Rows[i][1].ToString());
                        item.SubItems.Add(BUS_Bill.Instance.DetailBill(bill).Rows[i][2].ToString());
                        item.SubItems.Add(BUS_Bill.Instance.DetailBill(bill).Rows[i][3].ToString());
                        Bill_lv.Items.Add(item);
                        total = total + (float)Convert.ToDouble(BUS_Bill.Instance.DetailBill(bill).Rows[i][3].ToString());
                    }
                    float TotalVAT = total + (total * 10 / 100);
                    Total_lbl.Text = "Số tiền phải trả : " + String.Format("{0:0,0}", TotalVAT) + " VNĐ";
                    VAT_lbl.Text = "Thuế VAT (10%) : " + String.Format("{0:0,0}", TotalVAT) + " VNĐ";
                    TotalOrder_lbl.Text = "Tổng hóa đơn: " + String.Format("{0:0,0}", total) + " VNĐ";
                    NameStafff_lbl.Text = "Thu ngân : " + BUS_Bill.Instance.DetailBill(bill).Rows[0][7].ToString();
                }
                else
                {
                    ResetBill();
                }
                
            }
            catch (Exception) { }
        }

        private void ResetBill()
        {
            Bill_lv.Items.Clear();
            NameTable_lbl.Text = "Tên : " + BUS_Bill.Instance.Table(bill).Rows[0][1].ToString();
            IdTable = bill.IdTable;
            Total_lbl.Text = "Số tiền phải trả :";
            TotalOrder_lbl.Text = "Tổng hóa đơn :";
            VAT_lbl.Text = "Thuế VAT (10%) : ";
            NameStafff_lbl.Text = "Thu ngân : ";
            CheckIn_lbl.Text = "Giờ vào : ";
        }

        private void btn_Click(object sender, EventArgs e)
        {
            Bill_lv.Items.Clear();
            Button btn = (Button)sender;
            bill.IdTable = Convert.ToInt32(btn.Tag.ToString());
            IdTable = bill.IdTable; 
            if (BUS_Bill.Instance.Table(bill).Rows[0][2].ToString() == "Trống")
            {
                ResetBill();
                Add_btn.Enabled = false;
                Edit_btn.Enabled = false;
                Delete_btn.Enabled = false;
                Payment_btn.Enabled = false;
                NameTable = BUS_Bill.Instance.Table(bill).Rows[0][1].ToString();
                menu.ShowDialog();
                if (BUS_Bill.Instance.Table(bill).Rows[0][2].ToString() != "Trống")
                {
                    Add_btn.Enabled = true;
                }
                LoadTable();
                ShowBill(Convert.ToInt32(NameTable_lbl.Text.Substring(10)));
            }
            else
            {
                Add_btn.Enabled = true;
                Edit_btn.Enabled = true;
                Delete_btn.Enabled = true;
                Payment_btn.Enabled = true;
                ShowBill(IdTable);
            }
        }

        private void Add_btn_Click(object sender, EventArgs e)
        {
            NameTable = BUS_Bill.Instance.Table(bill).Rows[0][1].ToString();
            IdTable = Convert.ToInt32(BUS_Bill.Instance.Table(bill).Rows[0][0].ToString());
            menu.ShowDialog();
            LoadTable();
            ShowBill(Convert.ToInt32(NameTable_lbl.Text.Substring(10)));

        }

        private void Order_frm_FormClosing(object sender, FormClosingEventArgs e)
        {
            var dlr = MessageBox.Show("Bạn chắc muốn thoát", "Đóng chương trình", MessageBoxButtons.YesNo, MessageBoxIcon.Information);

            if (dlr == DialogResult.Yes)
            {
                System.Environment.Exit(1);
            }
            else
            {
                e.Cancel = true;
            }
        }

        private void LogOut_MenuItem_Click(object sender, EventArgs e)
        {
            var dlr = MessageBox.Show("Bạn chắc muốn đăng xuất", "Đăng xuất chương trình", MessageBoxButtons.YesNo, MessageBoxIcon.Information);

            if (dlr == DialogResult.Yes)
            {
                Process.Start(Application.ExecutablePath);
                Process.GetCurrentProcess().Kill();
            }
        }

        private void ChangePassword_MenuItem_Click(object sender, EventArgs e)
        {
            ChangePassword_frm changePassword = new ChangePassword_frm();
            changePassword.ShowDialog();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Time_lbl.Text = Login_frm.Shift + DateTime.Now.ToString("  ddd dd/MM/yyyy HH:mm:ss");
            if (DateTime.Parse(DateTime.Now.TimeOfDay.ToString()) > DateTime.Parse(Login_frm.TimeMax))
            {
                timer1.Stop();
                MessageBox.Show("Ca làm việc của bạn đã kết thúc (" + Login_frm.TimeMin + " ➜ " + Login_frm.TimeMax + ")", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Process.Start(Application.ExecutablePath);
                Process.GetCurrentProcess().Kill();
                this.BringToFront();
                this.WindowState = FormWindowState.Normal;
            }
        }

        private void Payment_btn_Click(object sender, EventArgs e)
        {
            NameTable = NameTable_lbl.Text;
            Payment_frm payment = new Payment_frm();
            payment.ShowDialog();

            LoadTable();
            ResetBill();
        }

        private void Delete_btn_Click(object sender, EventArgs e)
        {
            try
            {
                if (Confirm_frm.Result == 1)
                {
                    var dlr = MessageBox.Show("Bạn có muốn xóa hóa đơn của bàn này không (" + BUS_Bill.Instance.Table(bill).Rows[0][1].ToString() + ") ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                    if (dlr == DialogResult.Yes)
                    {
                        bill.IdBill = Convert.ToInt32(BUS_Bill.Instance.DetailBill(bill).Rows[0][8].ToString());
                        bill.IdTable = IdTable;
                        BUS_Bill.Instance.DeleteBill(bill);
                        LoadTable();
                        ResetBill();
                        MessageBox.Show("Xóa hóa đơn thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                else
                {
                    Confirm_frm confirm = new Confirm_frm();
                    confirm.ShowDialog();
                    if (Confirm_frm.Result == 1)
                    {
                        var dlr = MessageBox.Show("Bạn có muốn xóa hóa đơn của bàn này không (" + BUS_Bill.Instance.Table(bill).Rows[0][1].ToString() + ") ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                        if (dlr == DialogResult.Yes)
                        {
                            bill.IdBill = Convert.ToInt32(BUS_Bill.Instance.DetailBill(bill).Rows[0][8].ToString());
                            bill.IdTable = IdTable;
                            BUS_Bill.Instance.DeleteBill(bill);
                            LoadTable();
                            ResetBill();
                            MessageBox.Show("Xóa hóa đơn thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                    }
                    Confirm_frm.Result = 0;
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Xóa hóa đơn thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Staff_MenuItem_Click(object sender, EventArgs e)
        {
            Staff_frm staff = new Staff_frm();
            staff.ShowDialog();
        }

        private void Material_MenuItem_Click(object sender, EventArgs e)
        {
            Material_frm material = new Material_frm();
            material.ShowDialog();
        }

        private void Voucher_MenuItem_Click(object sender, EventArgs e)
        {
            Voucher_frm voucher = new Voucher_frm();
            voucher.ShowDialog();
        }

        private void Edit_btn_Click(object sender, EventArgs e)
        {
            NameTable = BUS_Bill.Instance.Table(bill).Rows[0][1].ToString();
            ListTable_frm listTable = new ListTable_frm();
            listTable.ShowDialog();
            LoadTable();
            ShowBill(Convert.ToInt32(NameTable_lbl.Text.Substring(10)));
        }

        private void MergeBill()
        {
            for (int i = 0; i < Bill_lv.Items.Count; i++)
            {
                
            }
        }
    }
}
