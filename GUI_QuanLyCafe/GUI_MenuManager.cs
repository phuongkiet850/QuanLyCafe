using BUS_QuanLyCafe;
using DTO_QuanLyCafe;
using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace GUI_QuanLyCafe
{
    public partial class MenuManager_frm : Form
    {
        public MenuManager_frm()
        {
            InitializeComponent();
        }


        DTO_Menu menu = new DTO_Menu();

        private void MenuManager_frm_Load(object sender, EventArgs e)
        {
            this.ActiveControl = label1;
            ListCategory();
            ListMenu();
        }

        private void ListMenu()
        {
            Name_txt.Text = BUS_Menu.Instance.ListMenu_DGV().Rows[0][0].ToString();
            NameTemp_txt.Text = BUS_Menu.Instance.ListMenu_DGV().Rows[0][0].ToString();
            float value = (float)double.Parse(BUS_Menu.Instance.ListMenu_DGV().Rows[0][1].ToString());
            Price_txt.Text = String.Format("{0:0,0}", value);
            Category_cbb.Text = BUS_Menu.Instance.ListMenu_DGV().Rows[0][2].ToString();
            Picture_ptb.Image = Image.FromFile(Application.StartupPath + BUS_Menu.Instance.ListMenu_DGV().Rows[0][4].ToString());
            PathPicture_txt.Text = BUS_Menu.Instance.ListMenu_DGV().Rows[0][4].ToString();

            MenuList_dgv.DataSource = BUS_Menu.Instance.ListMenu_DGV();
            MenuList_dgv.Columns[3].Visible = false;
            MenuList_dgv.Columns[4].Visible = false;
            MenuList_dgv.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            MenuList_dgv.Columns[1].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            MenuList_dgv.Columns[0].Width = 380;
        }

        private void ListCategory()
        {
            Category_cbb.DataSource = BUS_Menu.Instance.ListCategory();
            Category_cbb.DisplayMember = "NameCategory";
            Category_cbb.ValueMember = "IDCategory";

            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[] { new DataColumn("IDCategory", typeof(string)), new DataColumn("NameCategory", typeof(string)) });

            for (int i = 0; i < BUS_Menu.Instance.ListCategory().Rows.Count; i++)
            {
                dt.Rows.Add(BUS_Menu.Instance.ListCategory().Rows[i][0].ToString(), BUS_Menu.Instance.ListCategory().Rows[i][1].ToString());
            }

            DataRow row = dt.NewRow();
            row[0] = "ALL";
            row[1] = "Tất cả";
            dt.Rows.InsertAt(row, 0);

            FindBy_cbb.DataSource = dt;
            FindBy_cbb.DisplayMember = "NameCategory";
            FindBy_cbb.ValueMember = "IDCategory";
        }

        private void Edit_ckb_CheckedChanged(object sender, EventArgs e)
        {
            if (Edit_ckb.Checked == true)
            {
                //text
                Price_txt.ReadOnly = false;
                Name_txt.ReadOnly = false;

                //compoBox
                Category_cbb.Enabled = true;

                //btn
                Delete_btn.Enabled = true;
                Edit_btn.Enabled = true;
                CreateID_btn.Enabled = true;
                OpenFilePicture_btn.Enabled = true;
                OpenFilePicture_btn.Visible = true;

            }
            else
            {
                //text
                Price_txt.ReadOnly = true;
                Name_txt.ReadOnly = true;
                Find_txt.ReadOnly = false;


                //comboBox
                Category_cbb.Enabled = false;
                FindBy_cbb.Enabled = true;

                //btn
                Add_btn.Enabled = false;
                Delete_btn.Enabled = false;
                Edit_btn.Enabled = false;
                CreateID_btn.Enabled = false;
                OpenFilePicture_btn.Visible = false;
                ResetFind_btn.Enabled = true;

                //datagridview
                MenuList_dgv.Enabled = true;


            }
        }

        private void GetText()
        {
            menu.Name = Name_txt.Text.Trim();
            menu.Price = (float)Convert.ToDouble(Price_txt.Text.Trim());
            menu.CategoryID = Category_cbb.SelectedValue.ToString().Trim();
            menu.Picture = PathPicture_txt.Text;
        }

        private void ResetText()
        {
            Name_txt.Text = "";
            Price_txt.Text = ""; 
            Category_cbb.SelectedIndex = 0;
            Picture_ptb.Image = Image.FromFile(Application.StartupPath + @"\Image\Icon\questionmark.PNG");
            PathPicture_txt.Text = @"\Image\Icon\questionmark.PNG";
        }

        private void MenuList_dgv_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                DataGridViewRow row = MenuList_dgv.Rows[e.RowIndex];
                Name_txt.Text = row.Cells[0].Value.ToString();
                NameTemp_txt.Text = row.Cells[0].Value.ToString();
                float value = (float)double.Parse(row.Cells[1].Value.ToString());
                Price_txt.Text = String.Format("{0:0,0}", value);
                Category_cbb.Text = row.Cells[2].Value.ToString();
                menu.IdMenu = Convert.ToInt32(row.Cells[3].Value.ToString());
                PathPicture_txt.Text = row.Cells[4].Value.ToString();
                Picture_ptb.Image = Image.FromFile(Application.StartupPath + row.Cells[4].Value.ToString());
            }
            catch (Exception) { }
        }

        private void Price_txt_Leave(object sender, EventArgs e)
        {
            float value = (float)double.Parse(Price_txt.Text);
            Price_txt.Text = String.Format("{0:0,0}", value);
        }

        private void OpenFilePicture_btn_Click(object sender, EventArgs e)
        {
            OpenFileDialog FD = new OpenFileDialog();
            FD.Title = "Chọn file hình";
            FD.Filter = "Image files | *.jpg; *.jpeg; *.jpe; *.jfif; *.png";

            if (FD.ShowDialog() == DialogResult.OK)
            {
                PathPicture_txt.Text = @"\" + FD.FileName.ToString().Substring(FD.FileName.ToString().LastIndexOf("Image"));
                Picture_ptb.Image = Image.FromFile(Application.StartupPath + PathPicture_txt.Text);
            }
        }

        private void Add_btn_Click(object sender, EventArgs e)
        {
            try
            {
                int result = 0;
                for (int i = 0; i < MenuList_dgv.Rows.Count; i++)
                {
                    if (Name_txt.Text.Trim() == MenuList_dgv.Rows[i].Cells[0].Value.ToString())
                    {
                        result = 1;
                        MessageBox.Show("Món này đã tồn tại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }

                if (result == 0)
                {
                    GetText();
                    BUS_Menu.Instance.AddMenu(menu);

                    Find_txt.ReadOnly = false;
                    FindBy_cbb.Enabled = true;
                    ResetFind_btn.Enabled = true;
                    Edit_ckb.Enabled = true;
                    MenuList_dgv.Enabled = true;
                    CreateID_btn.Enabled = true;
                    Add_btn.Enabled = false;
                    Edit_btn.Enabled = true;

                    menu.CategoryID = FindBy_cbb.SelectedValue.ToString();
                    MenuList_dgv.DataSource = BUS_Menu.Instance.FindMenu_Category(Find_txt.Text = "", menu);

                    MessageBox.Show("Thêm món thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Thêm món thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void Edit_btn_Click(object sender, EventArgs e)
        {
            try
            {
                int result = 0;
                for (int i = 0; i < MenuList_dgv.Rows.Count; i++)
                {
                    if (Name_txt.Text.Trim() == MenuList_dgv.Rows[i].Cells[0].Value.ToString() && Name_txt.Text.Trim() != NameTemp_txt.Text)
                    {
                        result = 1;
                        MessageBox.Show("Món này đã tồn tại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                if(result == 0)
                {
                    GetText();
                    BUS_Menu.Instance.UpdateMenu(menu);
                    Edit_ckb.Checked = false;

                    menu.CategoryID = FindBy_cbb.SelectedValue.ToString();
                    MenuList_dgv.DataSource = BUS_Menu.Instance.FindMenu_Category(Find_txt.Text = "", menu);
                    MessageBox.Show("Sửa món thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

            }
            catch (Exception)
            {
                MessageBox.Show("Sửa món thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void Delete_btn_Click(object sender, EventArgs e)
        {
            try
            {
                var dlr = MessageBox.Show("Bạn chắc muốn xóa món này không", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                if (dlr == DialogResult.Yes)
                {
                    BUS_Menu.Instance.DeleteMenu(menu);
                    ResetText();

                    Edit_ckb.Enabled = true;
                    Edit_ckb.Checked = false;

                    menu.CategoryID = FindBy_cbb.SelectedValue.ToString();
                    MenuList_dgv.DataSource = BUS_Menu.Instance.FindMenu_Category(Find_txt.Text = "", menu);

                    MessageBox.Show("Xóa món khỏi menu thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Xóa món khỏi menu thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void CreateID_btn_Click(object sender, EventArgs e)
        {
            var dlr = MessageBox.Show("Nhấn YES để tạo vùng lưu tự động", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
            if (dlr == DialogResult.Yes)
            {
                Find_txt.Text = "";
                ResetText();

                menu.IdMenu = 0;
                CreateID_btn.Enabled = false;
                Edit_ckb.Enabled = false;
                Edit_btn.Enabled = false;
                Delete_btn.Enabled = true;
                Find_txt.ReadOnly = true;
                ResetFind_btn.Enabled = false;
                FindBy_cbb.Enabled = false;
                MenuList_dgv.Enabled = false;


                Add_btn.Enabled = true;
                this.ActiveControl = Name_txt;
            }
        }

        private void Category_cbb_KeyDown(object sender, KeyEventArgs e)
        {
            e.SuppressKeyPress = true;
        }

        private void FindBy_cbb_KeyDown(object sender, KeyEventArgs e)
        {
            e.SuppressKeyPress = true;
        }

        private void Category_cbb_SelectedValueChanged(object sender, EventArgs e)
        {
            this.ActiveControl = label1;
        }

        private void FindBy_cbb_SelectedValueChanged(object sender, EventArgs e)
        {
            Find_txt_TextChanged(sender, e);
            this.ActiveControl = label1;
        }

        private void Find_txt_TextChanged(object sender, EventArgs e)
        {
            try
            {
                ResetText();
                if (FindBy_cbb.SelectedValue == "ALL")
                {
                    MenuList_dgv.DataSource = BUS_Menu.Instance.FindMenu_All(Find_txt.Text.Trim());
                }
                else
                {
                    menu.CategoryID = FindBy_cbb.SelectedValue.ToString();
                    MenuList_dgv.DataSource = BUS_Menu.Instance.FindMenu_Category(Find_txt.Text.Trim(), menu);
                }
                this.ActiveControl = Find_txt;
            }
            catch (Exception) { }
        }

        private void ResetFind_btn_Click(object sender, EventArgs e)
        {
            Find_txt.Text = "";
            FindBy_cbb.SelectedIndex = 0;
        }
    }
}
