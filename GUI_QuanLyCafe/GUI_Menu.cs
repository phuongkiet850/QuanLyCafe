using BUS_QuanLyCafe;
using DTO_QuanLyCafe;
using Guna.UI2.WinForms;
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
    public partial class Menu_frm : Form
    {
        public Menu_frm()
        {
            InitializeComponent();
        }

        DTO_Menu menu = new DTO_Menu();
        DTO_Bill bill = new DTO_Bill();
        DTO_Staff staff = new DTO_Staff();

        public static string NameItem;
        private void Menu_frm_Load(object sender, EventArgs e)
        {
            Name_lbl.Text = "Tên : " + Order_frm.NameTable;
            bill.IdTable = Order_frm.IdTable;
            LoadMenu("CF");
            //LoadBill();

            ListOrder_dgv.Rows.Clear();
            ListOrder_dgv.Columns.Clear();
            ListOrder_dgv.Columns.Add("Name", "Tên món");
            ListOrder_dgv.Columns.Add("Amount", "Số lượng");
            ListOrder_dgv.Columns.Add("Price", "Giá");
            ListOrder_dgv.Columns.Add("Note", "Ghi chú");
            ListOrder_dgv.Columns.Add("IdMenu", "Id Menu");
            ListOrder_dgv.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            ListOrder_dgv.Columns[0].Width = 180;
            ListOrder_dgv.Columns[3].Width = 200;
            ListOrder_dgv.Columns[1].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            ListOrder_dgv.Columns[2].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            ListOrder_dgv.Columns[4].Visible = false;
        }

        private void LoadMenu(string CategoryID)
        {
            try
            {
                Cafe_flp.Controls.Clear();
                Freeze_flp.Controls.Clear();
                Tea_flp.Controls.Clear();
                Food_flp.Controls.Clear();
                SoftDrink_flp.Controls.Clear();
                menu.CategoryID = CategoryID;
                for (int i = 0; i < BUS_Menu.Instance.ListMenu(menu).Rows.Count; i++)
                {
                    Guna2Button btn = new Guna2Button();
                    btn.Width = 270;
                    btn.Height = 80;
                    btn.Image = Image.FromFile(Application.StartupPath + BUS_Menu.Instance.ListMenu(menu).Rows[i][4].ToString());
                    btn.ImageSize = new Size(80, 80);
                    btn.ImageAlign = HorizontalAlignment.Left;
                    btn.TextAlign = HorizontalAlignment.Right;
                    float Price = (float)Convert.ToDouble(BUS_Menu.Instance.ListMenu(menu).Rows[i][2].ToString());
                    btn.Text = BUS_Menu.Instance.ListMenu(menu).Rows[i][1].ToString() + Environment.NewLine + String.Format("{0:0,0}", Price) + " VNĐ";
                    btn.Font = new Font("Time New Roman", 14);
                    btn.BorderColor = Color.Black;
                    btn.FillColor = Color.White;
                    btn.ForeColor = Color.Black;
                    btn.BorderThickness = 1;
                    btn.Tag = BUS_Menu.Instance.ListMenu(menu).Rows[i][0].ToString();
                    btn.Click += btn_Click;
                    if (CategoryID == "CF")
                    {
                        Cafe_flp.Controls.Add(btn);
                    }
                    else if (CategoryID == "FZ")
                    {
                        Freeze_flp.Controls.Add(btn);
                    }
                    else if (CategoryID == "TE")
                    {
                        Tea_flp.Controls.Add(btn);
                    }
                    else if (CategoryID == "FD")
                    {
                        Food_flp.Controls.Add(btn);
                    }
                    else if (CategoryID == "SD")
                    {
                        btn.ImageSize = new Size(70, 70);
                        SoftDrink_flp.Controls.Add(btn);
                    }
                }

                Guna2Button MenuManager_btn = new Guna2Button();
                MenuManager_btn.Width = 270;
                MenuManager_btn.Height = 80;
                MenuManager_btn.Image = Image.FromFile(Application.StartupPath + @"\Image\Icon\plus.PNG");
                MenuManager_btn.ImageSize = new Size(60, 60);
                MenuManager_btn.ImageAlign = HorizontalAlignment.Center;
                MenuManager_btn.BorderColor = Color.Black;
                MenuManager_btn.FillColor = Color.White;
                MenuManager_btn.ForeColor = Color.Black;
                MenuManager_btn.BorderThickness = 1;
                MenuManager_btn.Click += MenuManager_btn_Click;
                if (CategoryID == "CF")
                {
                    Cafe_flp.Controls.Add(MenuManager_btn);
                }
                else if (CategoryID == "FZ")
                {
                    Freeze_flp.Controls.Add(MenuManager_btn);
                }
                else if (CategoryID == "TE")
                {
                    Tea_flp.Controls.Add(MenuManager_btn);
                }
                else if (CategoryID == "FD")
                {
                    Food_flp.Controls.Add(MenuManager_btn);
                }
                else if (CategoryID == "SD")
                {
                    SoftDrink_flp.Controls.Add(MenuManager_btn);
                }
            }
            catch (Exception) { }
        }

        private void MenuManager_btn_Click(object sender, EventArgs e)
        {
            MenuManager_frm menuManager = new MenuManager_frm();
            menuManager.ShowDialog();
        }

        private void btn_Click(object sender, EventArgs e)
        {
            Detail_frm detail = new Detail_frm();
            Guna2Button btn = (Guna2Button)sender;
            bill.IdMenu = Convert.ToInt32(btn.Tag.ToString());
            NameItem = BUS_Bill.Instance.TagItem(bill).Rows[0][1].ToString();
            detail.ShowDialog();
            if (Detail_frm.Status == 1)
            {
                DataGridViewRow row = (DataGridViewRow)ListOrder_dgv.Rows[0].Clone();
                row.Cells[0].Value = BUS_Bill.Instance.TagItem(bill).Rows[0][1].ToString();
                row.Cells[1].Value = Detail_frm.Amount;
                row.Cells[2].Value = BUS_Bill.Instance.TagItem(bill).Rows[0][2].ToString();
                row.Cells[3].Value = Detail_frm.Note;
                row.Cells[4].Value = bill.IdMenu;
                ListOrder_dgv.Rows.Add(row);
            }
        }

        private void Menu_tc_Selected(object sender, TabControlEventArgs e)
        {
            string CategoryID = Menu_tc.SelectedTab.Name.ToString();
            LoadMenu(CategoryID);
        }

        private void Menu_frm_FormClosing(object sender, FormClosingEventArgs e)
        {
            Menu_tc.SelectedIndex = 0;
        }

        private void Delete_btn_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.ListOrder_dgv.SelectedRows.Count > 0)
                {
                    ListOrder_dgv.Rows.RemoveAt(this.ListOrder_dgv.SelectedRows[0].Index);
                }
            }
            catch (Exception) { }
        }

        private void Add_btn_Click(object sender, EventArgs e)
        {
            try
            {
                if (BUS_Bill.Instance.Table(bill).Rows[0][2].ToString() == "Trống")
                {
                    staff.Email = Login_frm.Email;
                    bill.IdStaff = BUS_Staff.Instance.Check(staff).Rows[0][0].ToString();
                    BUS_Bill.Instance.AddBill(bill);
                    for (int i = 0; i < ListOrder_dgv.Rows.Count - 1; i++)
                    {
                        bill.IdTable = Order_frm.IdTable;
                        bill.Amount = Convert.ToInt32(ListOrder_dgv.Rows[i].Cells[1].Value.ToString());
                        bill.Note = ListOrder_dgv.Rows[i].Cells[3].Value.ToString();
                        bill.IdMenu = Convert.ToInt32(ListOrder_dgv.Rows[i].Cells[4].Value.ToString());
                        BUS_Bill.Instance.AddDesertToBill(bill);
                    }
                    MessageBox.Show("Thêm thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.Close();
                }
                else
                {
                    for (int i = 0; i < ListOrder_dgv.Rows.Count - 1; i++)
                    {
                        bill.IdTable = Order_frm.IdTable;
                        bill.Amount = Convert.ToInt32(ListOrder_dgv.Rows[i].Cells[1].Value.ToString());
                        bill.Note = ListOrder_dgv.Rows[i].Cells[3].Value.ToString();
                        bill.IdMenu = Convert.ToInt32(ListOrder_dgv.Rows[i].Cells[4].Value.ToString());
                        BUS_Bill.Instance.AddDesertToBill(bill);
                    }
                    MessageBox.Show("Thêm thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.Close();
                } 
            }
            catch (Exception)
            {
                MessageBox.Show("Thêm thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
