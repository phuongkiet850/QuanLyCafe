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
    public partial class ListTable_frm : Form
    {
        public ListTable_frm()
        {
            InitializeComponent();
        }
        DTO_Bill bill = new DTO_Bill();
        DTO_Staff staff = new DTO_Staff();
        public int OldIdTable;
        public int OldIdBill;
        public int NewIdTable;
        public int NewIdBill;
        public string NameFood;

        private void DetachTable_frm_Load(object sender, EventArgs e)
        {
            this.ActiveControl = label1;

            LoadTable();
            LoadBill();

            OldIdTable = Order_frm.IdTable;
            bill.IdTable = OldIdTable;
            OldIdBill = Convert.ToInt32(BUS_Bill.Instance.DetailBill(bill).Rows[0][8].ToString());
        }

        void LoadTable()
        {
            Table_flp.Controls.Clear();
            for (int i = 0; i < BUS_Table.Instance.ListTable().Rows.Count; i++)
            {
                Button btn = new Button();
                btn.Width = 90;
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

        private void btn_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            NewIdTable = Convert.ToInt32(btn.Tag.ToString());
            bill.IdTable = NewIdTable;
            NameTable2_lbl.Text = "Tên : " + BUS_Bill.Instance.Table(bill).Rows[0][1].ToString();
            ListOrder2_dgv.DataSource = BUS_Bill.Instance.BillTable_DGV(bill);
            ListOrder2_dgv.Columns[0].Visible = false;
            Switch_btn.Enabled = true;
            Merge_btn.Enabled = true;
            Detach_btn.Enabled = true;
        }

        void LoadBill()
        {
            NameTable1_lbl.Text = "Tên : " + Order_frm.NameTable;
            bill.IdTable = Order_frm.IdTable;
            ListOrder1_dgv.DataSource = BUS_Bill.Instance.BillTable_DGV(bill);
            ListOrder1_dgv.Columns[0].Visible = false;
        }

        private void Switch_btn_Click(object sender, EventArgs e)
        {
            if (BUS_Bill.Instance.Table(bill).Rows[0][0].ToString() == Order_frm.IdTable.ToString())
            {
                MessageBox.Show("Bạn đang ở bàn này (" + Order_frm.NameTable + ")", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (BUS_Bill.Instance.Table(bill).Rows[0][2].ToString() == "Trống")
            {
                try
                {
                    var dlr = MessageBox.Show("Bạn có muốn chuyển từ " + Order_frm.NameTable.ToLower() + " sang " + BUS_Bill.Instance.Table(bill).Rows[0][1].ToString().ToLower() + " không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                    if (dlr == DialogResult.Yes)
                    {
                        MessageBox.Show("Chuyển bàn thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        BUS_Bill.Instance.Switch(NewIdTable, OldIdTable);
                        this.Close();
                    }
                }
                catch (Exception)
                {
                    MessageBox.Show("Chuyển bàn thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Bàn này đã có người, không thể chuyển bàn", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Merge_btn_Click(object sender, EventArgs e)
        {
            if (BUS_Bill.Instance.Table(bill).Rows[0][0].ToString() == Order_frm.IdTable.ToString())
            {
                MessageBox.Show("Bạn đang ở bàn này (" + Order_frm.NameTable + ")", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if(BUS_Bill.Instance.Table(bill).Rows[0][2].ToString() == "Có người")
            {
                try
                {
                    var dlr = MessageBox.Show(BUS_Bill.Instance.Table(bill).Rows[0][1].ToString() + " này đã có người, bạn có muốn gộp bàn không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                    if (dlr == DialogResult.Yes)
                    {
                        NewIdBill = Convert.ToInt32(BUS_Bill.Instance.DetailBill(bill).Rows[0][8].ToString());
                        BUS_Bill.Instance.Merge(NewIdTable, OldIdTable, NewIdBill, OldIdBill);
                        MessageBox.Show("Gộp bàn thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        this.Close();
                    }
                }
                catch (Exception)
                {
                    MessageBox.Show("Gộp bàn thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Bàn này chưa có người, không thể gộp bàn", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Detach_btn_Click(object sender, EventArgs e)
        {
            try
            {
                if (bill.IdDetailBill == 0)
                {
                    MessageBox.Show("Bạn chưa chọn món cần tách", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else if (ListOrder1_dgv.Rows.Count == 2)
                {
                    MessageBox.Show("Số món không đủ để tách bàn", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else if(BUS_Bill.Instance.Table(bill).Rows[0][0].ToString() == Order_frm.IdTable.ToString())
                {
                    MessageBox.Show("Bạn đang ở bàn này (" + Order_frm.NameTable + ")", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    var dlr = MessageBox.Show("Bạn có muốn tách " + NameFood + " từ " + Order_frm.NameTable.ToLower() + " sang " + BUS_Bill.Instance.Table(bill).Rows[0][1].ToString().ToLower() + " không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                    if (dlr == DialogResult.Yes)
                    {
                        if (BUS_Bill.Instance.Table(bill).Rows[0][2].ToString() == "Trống")
                        {
                            staff.Email = Login_frm.Email;
                            bill.IdStaff = BUS_Staff.Instance.Check(staff).Rows[0][0].ToString();
                            BUS_Bill.Instance.AddBill(bill);

                            BUS_Bill.Instance.Detach(bill);
                            MessageBox.Show("Tách bàn thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            LoadTable();
                            LoadBill();
                            bill.IdTable = Convert.ToInt32(NameTable2_lbl.Text.Substring(10));
                            ListOrder2_dgv.DataSource = BUS_Bill.Instance.BillTable_DGV(bill);
                            ListOrder2_dgv.Columns[0].Visible = false;
                            bill.IdDetailBill = 0;

                        }
                        else
                        {
                            BUS_Bill.Instance.Detach(bill);
                            MessageBox.Show("Tách bàn thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            LoadTable();
                            LoadBill();
                            bill.IdTable = Convert.ToInt32(NameTable2_lbl.Text.Substring(10));
                            ListOrder2_dgv.DataSource = BUS_Bill.Instance.BillTable_DGV(bill);
                            ListOrder2_dgv.Columns[0].Visible = false;
                            bill.IdDetailBill = 0;

                        }
                    }
                }
            }
            catch (Exception) { }
        }

        private void ListOrder1_dgv_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow row = ListOrder1_dgv.Rows[e.RowIndex];
            bill.IdDetailBill = Convert.ToInt32(row.Cells[0].Value.ToString());
            NameFood = row.Cells[1].Value.ToString();
        }

        private void Delete_btn_Click(object sender, EventArgs e)
        {
            try
            {
                if (bill.IdDetailBill == 0)
                {
                    MessageBox.Show("Bạn chưa chọn món cần tách", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    Confirm_frm confirm = new Confirm_frm();
                    confirm.ShowDialog();
                    if (Confirm_frm.Result == 1)
                    {
                        var dlr = MessageBox.Show("Bạn có muốn xóa " + NameFood + " của " + Order_frm.NameTable.ToLower() + " không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                        if (dlr == DialogResult.Yes)
                        {
                            bill.IdTable = Order_frm.IdTable;
                            BUS_Bill.Instance.Delete(bill);
                            LoadTable();
                            LoadBill();
                            bill.IdTable = Convert.ToInt32(NameTable2_lbl.Text.Substring(10));
                            ListOrder2_dgv.DataSource = BUS_Bill.Instance.BillTable_DGV(bill);
                            ListOrder2_dgv.Columns[0].Visible = false;
                            bill.IdDetailBill = 0;
                            MessageBox.Show("Xóa " + NameFood + " thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                    }
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Xóa " + NameFood + " thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
