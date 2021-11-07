﻿using BUS_QuanLyCafe;
using DTO_QuanLyCafe;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI_QuanLyCafe
{
    public partial class Staff_frm : Form
    {
        public Staff_frm()
        {
            InitializeComponent();
            Control.CheckForIllegalCrossThreadCalls = false;
        }

        DTO_Staff staff = new DTO_Staff();

        private void Staff_frm_Load(object sender, EventArgs e)
        {
            this.ActiveControl = label1;
            ListProfileStaff();
            FomatDategridView();
        }

        private void ListProfileStaff()
        {
            try
            {
                IdStafff_txt.Text = BUS_Staff.Instance.ListProfileStaff().Rows[0][0].ToString();
                NameStaff_txt.Text = BUS_Staff.Instance.ListProfileStaff().Rows[0][1].ToString();
                Adress_txt.Text = BUS_Staff.Instance.ListProfileStaff().Rows[0][2].ToString();
                PhoneNumber_txt.Text = BUS_Staff.Instance.ListProfileStaff().Rows[0][3].ToString();
                Email_txt.Text = BUS_Staff.Instance.ListProfileStaff().Rows[0][4].ToString();
                Gender_cbb.Text = BUS_Staff.Instance.ListProfileStaff().Rows[0][5].ToString();
                BirthDay_date.Text = BUS_Staff.Instance.ListProfileStaff().Rows[0][6].ToString();
                Role_cbb.Text = BUS_Staff.Instance.ListProfileStaff().Rows[0][7].ToString();
                PathPicture_txt.Text = BUS_Staff.Instance.ListProfileStaff().Rows[0][9].ToString();
                Picture_ptb.Image = Image.FromFile(Application.StartupPath + BUS_Staff.Instance.ListProfileStaff().Rows[0][9].ToString());
                Status_txt.Text = BUS_Staff.Instance.ListProfileStaff().Rows[0][10].ToString();
            }
            catch (Exception) { }
        }

        private void FomatDategridView()
        {
            ListStaff_dgv.DataSource = BUS_Staff.Instance.ListProfileStaff_DGV();
            ListStaff_dgv.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            ListStaff_dgv.ColumnHeadersDefaultCellStyle.Font = new Font("Times New Roman", 14, FontStyle.Regular);
            ListStaff_dgv.Columns[2].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            ListStaff_dgv.Columns[4].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            ListStaff_dgv.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            ListStaff_dgv.Columns[3].Width = 150;
            ListStaff_dgv.Columns[4].Width = 150;
        }

        private void Edit_ckb_CheckedChanged(object sender, EventArgs e)
        {
            if (Edit_ckb.Checked == true)
            {
                //text
                NameStaff_txt.ReadOnly = false;
                PhoneNumber_txt.ReadOnly = false;
                Adress_txt.ReadOnly = false;

                //compoBox
                Gender_cbb.Enabled = true;
                Role_cbb.Enabled = true;


                //date
                BirthDay_date.Enabled = true;

                //btn
                CreateID_btn.Enabled = true;
                Delete_btn.Enabled = true;
                Edit_btn.Enabled = true;
                OpenFilePicture_btn.Visible = true;
            }
            else
            {
                //text
                NameStaff_txt.ReadOnly = true;
                PhoneNumber_txt.ReadOnly = true;
                Adress_txt.ReadOnly = true;
                Find_txt.ReadOnly = false;

                //compoBox
                Gender_cbb.Enabled = false;
                Role_cbb.Enabled = false;
                FindBy_cbb.Enabled = true;

                //date
                BirthDay_date.Enabled = false;

                //btn
                CreateID_btn.Enabled = false;
                Add_btn.Enabled = false;
                Delete_btn.Enabled = false;
                Edit_btn.Enabled = false;
                OpenFilePicture_btn.Visible = false;
                ResetFind_btn.Enabled = true;

                //datagridview
                ListStaff_dgv.Enabled = true;
                //

                NameStaff_lbl.ForeColor = Color.Black;
                Email_lbl.ForeColor = Color.Black;
                Gender_lbl.ForeColor = Color.Black;
                Role_lbl.ForeColor = Color.Black;
                PhoneNumber_lbl.ForeColor = Color.Black;
                Email_lbl.ForeColor = Color.Black;
                Address_lbl.ForeColor = Color.Black;

            }
        }
        private void ResetText()
        {
            IdStafff_txt.Text = "";
            NameStaff_txt.Text = "";
            PhoneNumber_txt.Text = "";
            Email_txt.Text = "";
            Adress_txt.Text = "";
            Status_txt.Text = "Không hoạt động";
            Role_cbb.SelectedIndex = -1;
            Gender_cbb.SelectedIndex = -1;
            BirthDay_date.Value = DateTime.Now;
            PathPicture_txt.Text = @"\Image\Icon\unknown1.PNG";
            Picture_ptb.Image = Image.FromFile(Application.StartupPath + @"\Image\Icon\unknown1.PNG");

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

        private void ResetFind_btn_Click(object sender, EventArgs e)
        {
            Find_txt.Text = "";
            FindBy_cbb.Text = "Tất cả";
            ListProfileStaff();
        }

        private void Staff_frm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (CreateID_btn.Enabled == false && Edit_ckb.Checked == true)
            {
                e.Cancel = true;
            }
            else
            {
                Edit_ckb.Checked = false;
                ResetFind_btn_Click(sender, e);
            }
        }
        private void GetText()
        {
            staff.IDStaff = IdStafff_txt.Text.Trim();
            staff.NameStaff = NameStaff_txt.Text.Trim();
            staff.Address = Adress_txt.Text.Trim();
            staff.PhoneNumber = PhoneNumber_txt.Text.Trim();
            staff.Email = Email_txt.Text.Trim();
            staff.Genedr = Gender_cbb.Text.Trim();
            staff.Birthday = DateTime.ParseExact(BirthDay_date.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            staff.Role = Role_cbb.Text.Trim();
            staff.Picture = PathPicture_txt.Text.Trim();
            staff.Status = Status_txt.Text.Trim();
        }

        private void Add_btn_Click(object sender, EventArgs e)
        {
            try
            {
                GetText();
                if (BUS_Staff.Instance.ForgotPassword(staff) == true)
                {
                    MessageBox.Show("Email này đã được tạo", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    this.ActiveControl = Email_txt;
                }
                else
                {
                    Add_btn.Text = ".....";
                    Add_btn.Enabled = false;
                    if (Role_cbb.Text != "Phục vụ")
                    {
                        AutoCreatePassword();
                    }
                    else
                    {
                        InsertProfileNV();

                        MessageBox.Show("Thêm nhân viên thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        Email_txt.ReadOnly = true;
                        CreateID_btn.Enabled = true;
                        Edit_ckb.Enabled = true;
                        Find_txt.ReadOnly = false;
                        ResetFind_btn.Enabled = true;
                        FindBy_cbb.Enabled = true;
                        Add_btn.Enabled = false;
                        ListStaff_dgv.Enabled = true;
                        Add_btn.Text = "Thêm";
                    }
                }
            }
            catch (Exception)
            {
                Add_btn.Text = "Thêm";
                MessageBox.Show("Thêm nhân viên thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void CreateID_btn_Click(object sender, EventArgs e)
        {
            var dlr = MessageBox.Show("Nhấn YES để tạo vùng lưu tự động ", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
            if (dlr == DialogResult.Yes)
            {
                ResetText();
                Find_txt.Text = "";
                Status_txt.Text = "Hoạt động";
                IdStafff_txt.Text = BUS_Staff.Instance.SelectIdStaff().Rows[0][0].ToString();

                FomatDategridView();
                Email_txt.ReadOnly = false;
                CreateID_btn.Enabled = false;
                Edit_ckb.Enabled = false;
                Edit_btn.Enabled = false;
                Delete_btn.Enabled = true;
                Find_txt.ReadOnly = true;
                FindBy_cbb.Enabled = false;
                ResetFind_btn.Enabled = false;
                ListStaff_dgv.Enabled = false;
                VerificationText();

                this.ActiveControl = NameStaff_txt;
            }
        }

        private void AutoCreatePassword()
        {
            try
            {
                Thread thread = new Thread(() =>
                {
                    string NewPassword = BUS_Staff.Instance.VerificationPassowrd();
                    string Encryption = BUS_Staff.Instance.Encryption(NewPassword);
                    staff.Password = Encryption;
                    SendMailPassword(Email_txt.Text, NewPassword);
                });
                thread.Start();
            }
            catch (Exception)
            {
                MessageBox.Show("Có lỗi xảy ra trong quá trình tạo mã", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void InsertProfileNV()
        {
            GetText();
            BUS_Staff.Instance.InsertProfileStaff(staff);
            Edit_btn.Enabled = true;
            ListStaff_dgv.Enabled = true;
            FomatDategridView();
        }

        private void SendMailPassword(string Email, string MatKhau)
        {
            try
            {
                SmtpClient Client = new SmtpClient("smtp.gmail.com", 587);
                Client.EnableSsl = true;
                Client.Credentials = new NetworkCredential("kiettpps12245@gmail.com", "KKirtzz01");
                MailMessage Msg = new MailMessage();
                Msg.From = new MailAddress("kiettpps12245@gmail.com");
                Msg.To.Add(Email);
                Msg.Subject = "Bạn đã sử dụng tính năng tạo mật khẩu tự động";
                Msg.Body = "Chào anh/chị, mật khẩu để truy cập vào phần mềm của email " + Email_txt.Text + " là " + MatKhau;
                Client.Send(Msg);
                MessageBox.Show("Đã gửi mật khẩu mới về email của bạn, vui lòng kiểm tra lại email", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                InsertProfileNV();

                MessageBox.Show("Thêm nhân viên thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                Email_txt.ReadOnly = true;
                CreateID_btn.Enabled = true;
                Edit_ckb.Enabled = true;
                Find_txt.ReadOnly = false;
                ResetFind_btn.Enabled = true;
                FindBy_cbb.Enabled = true;
                Add_btn.Enabled = false;
                ListStaff_dgv.Enabled = true;
                Add_btn.Text = "Thêm";
            }
            catch (Exception)
            {
                Add_btn.Text = "Thêm";
                Add_btn.Enabled = true;
                MessageBox.Show("Email này không tồn tại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Edit_btn_Click(object sender, EventArgs e)
        {
            try
            {
                if (Email_txt.Text == "admin" && CreateID_btn.Enabled == true)
                {
                    MessageBox.Show("Bạn không thế sửa tài khoản admin được", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    GetText();
                    BUS_Staff.Instance.UpdateProfileStaff(staff);
                    FomatDategridView();


                    Edit_ckb.Checked = false;
                    MessageBox.Show("Sửa nhân viên thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Sửa nhân viên thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void VerificationText()
        {
            if (Edit_ckb.Checked == true)
            {
                IsNumeric(NameStaff_txt.Text, NameStaff_txt, NameStaff_lbl);
                IsPhoneNum(PhoneNumber_txt.Text, PhoneNumber_txt, PhoneNumber_lbl);
                IsEmail(Email_txt.Text, Email_lbl);
                if (Adress_txt.Text != "")
                {
                    Address_lbl.ForeColor = Color.Black;
                }
                else
                {
                    Address_lbl.ForeColor = Color.Red;
                }

                if (Gender_cbb.SelectedIndex == -1)
                {
                    Gender_lbl.ForeColor = Color.Red;
                }
                else
                {
                    Gender_lbl.ForeColor = Color.Black;
                }

                if (Role_cbb.SelectedIndex == -1)
                {
                    Role_lbl.ForeColor = Color.Red;
                }
                else
                {
                    Role_lbl.ForeColor = Color.Black;
                }

                if (NameStaff_lbl.ForeColor == Color.Black && Email_lbl.ForeColor == Color.Black && Gender_lbl.ForeColor == Color.Black && Role_lbl.ForeColor == Color.Black && PhoneNumber_lbl.ForeColor == Color.Black && Email_lbl.ForeColor == Color.Black && Address_lbl.ForeColor == Color.Black)
                {
                    if (CreateID_btn.Enabled == false)
                    {
                        Add_btn.Enabled = true;
                    }
                    else
                    {
                        Edit_btn.Enabled = true;
                    }
                }
                else
                {
                    Edit_btn.Enabled = false;
                    Add_btn.Enabled = false;
                }
            }
        }

        private void IsNumeric(string txt, TextBox control, Control ctl)
        {
            if (txt == "")
            {
                ctl.ForeColor = Color.Red;
            }
            else
            {
                foreach (char c in txt)
                {
                    if (c < '0' || c > '9')
                    {
                        ctl.ForeColor = Color.Black;
                    }
                    else
                    {
                        control.Text = txt.Substring(0, txt.Length - 1);
                        control.SelectionStart = txt.Length;
                    }
                }
            }
        }

        private void IsPhoneNum(string txt, TextBox control, Control ctl)
        {
            if (txt == "")
            {
                ctl.ForeColor = Color.Red;
            }
            else
            {
                Regex regex = new Regex(@"^[-+]?[0-9]*.?[0-9]+$");

                if (regex.IsMatch(txt))
                {
                    if (txt.Length != 10)
                    {
                        ctl.ForeColor = Color.Red;
                    }
                    else
                    {
                        ctl.ForeColor = Color.Black;
                    }
                }
                else
                {
                    control.Text = txt.Substring(0, txt.Length - 1);
                    control.SelectionStart = txt.Length;
                }
            }
        }

        private void IsEmail(string txt, Control ctl)
        {
            if (CreateID_btn.Enabled == false)
            {
                if (txt == "")
                {
                    ctl.ForeColor = Color.Red;
                }
                else
                {
                    Regex regex = new Regex(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
                  @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                  @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
                    if (regex.IsMatch(txt))
                    {
                        ctl.ForeColor = Color.Black;
                    }
                    else
                    {
                        ctl.ForeColor = Color.Red;
                    }
                }
            }
        }

        private void Delete_btn_Click(object sender, EventArgs e)
        {
            try
            {
                if (Email_txt.Text == "admin" && CreateID_btn.Enabled == true)
                {
                    MessageBox.Show("Bạn không thế xóa tài khoản admin được", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else if (Email_txt.Text == Login_frm.Email && CreateID_btn.Enabled == true)
                {
                    MessageBox.Show("Bạn không thế xóa tài khoản đang đăng nhập", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    var dlr = MessageBox.Show("Bạn chắc muốn xóa nhân viên này không", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
                    if (dlr == DialogResult.Yes)
                    {
                        GetText();
                        BUS_Staff.Instance.DeleteProfileStaff(staff);
                        if (CreateID_btn.Enabled == false)
                        {
                            //save log
                            
                            //
                        }
                        else
                        {
                            GetText();
                            if (BUS_Staff.Instance.ForgotPassword(staff) == false)
                            {
                                //save log
                               
                                //
                                MessageBox.Show("Xóa nhân viên thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            }
                            else
                            {
                                //save log
                                
                                //
                                MessageBox.Show("Vô hiệu hóa tài khoản thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            }
                        }

                        Edit_ckb.Checked = false;
                        Edit_ckb.Enabled = true;
                        FomatDategridView();
                    }
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Xóa nhân viên thất bại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ListStaff_dgv_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                DataGridViewRow row = ListStaff_dgv.Rows[e.RowIndex];
                staff.IDStaff = row.Cells[0].Value.ToString();
                IdStafff_txt.Text = BUS_Staff.Instance.SelectIdStaff_DGV(staff).Rows[0][0].ToString();
                NameStaff_txt.Text = BUS_Staff.Instance.SelectIdStaff_DGV(staff).Rows[0][1].ToString();
                Adress_txt.Text = BUS_Staff.Instance.SelectIdStaff_DGV(staff).Rows[0][2].ToString();
                PhoneNumber_txt.Text = BUS_Staff.Instance.SelectIdStaff_DGV(staff).Rows[0][3].ToString();
                Email_txt.Text = BUS_Staff.Instance.SelectIdStaff_DGV(staff).Rows[0][4].ToString();
                Gender_cbb.Text = BUS_Staff.Instance.SelectIdStaff_DGV(staff).Rows[0][5].ToString();
                BirthDay_date.Text = BUS_Staff.Instance.SelectIdStaff_DGV(staff).Rows[0][6].ToString();
                Role_cbb.Text = BUS_Staff.Instance.SelectIdStaff_DGV(staff).Rows[0][7].ToString();
                PathPicture_txt.Text = BUS_Staff.Instance.SelectIdStaff_DGV(staff).Rows[0][9].ToString();
                Picture_ptb.Image = Image.FromFile(Application.StartupPath + BUS_Staff.Instance.SelectIdStaff_DGV(staff).Rows[0][9].ToString());
                Status_txt.Text = BUS_Staff.Instance.SelectIdStaff_DGV(staff).Rows[0][10].ToString();
            }
            catch (Exception) { }
        }

        private void Find_txt_TextChanged(object sender, EventArgs e)
        {
            try
            {
                ResetText();
                NameStaff_lbl.ForeColor = Color.Black;
                Email_lbl.ForeColor = Color.Black;
                Gender_lbl.ForeColor = Color.Black;
                Role_lbl.ForeColor = Color.Black;
                PhoneNumber_lbl.ForeColor = Color.Black;
                Email_lbl.ForeColor = Color.Black;
                Address_lbl.ForeColor = Color.Black;
                this.ActiveControl = Find_txt;
                if (FindBy_cbb.Text == "Tất cả")
                {
                    string FormatDate = Find_txt.Text.Replace("-", "/");
                    ListStaff_dgv.DataSource = BUS_Staff.Instance.FindProfileStaff_All(FormatDate);
                }
                else if (FindBy_cbb.Text == "Mã số")
                {
                    ListStaff_dgv.DataSource = BUS_Staff.Instance.FindProfileStaff_FindBy(Find_txt.Text, "IdStaff");
                }
                else if (FindBy_cbb.Text == "Họ tên")
                {
                    ListStaff_dgv.DataSource = BUS_Staff.Instance.FindProfileStaff_FindBy(Find_txt.Text, "NameStaff");
                }
                else if (FindBy_cbb.Text == "Vai trò")
                {
                    ListStaff_dgv.DataSource = BUS_Staff.Instance.FindProfileStaff_FindBy(Find_txt.Text, "Role");
                }
                else if (FindBy_cbb.Text == "Giới tính")
                {
                    ListStaff_dgv.DataSource = BUS_Staff.Instance.FindProfileStaff_FindBy(Find_txt.Text, "Gender");
                }
                else if (FindBy_cbb.Text == "Email")
                {
                    ListStaff_dgv.DataSource = BUS_Staff.Instance.FindProfileStaff_FindBy(Find_txt.Text, "Email");
                }
                else if (FindBy_cbb.Text == "Số điện thoại")
                {
                    ListStaff_dgv.DataSource = BUS_Staff.Instance.FindProfileStaff_FindBy(Find_txt.Text, "PhoneNumber");
                }
                else if (FindBy_cbb.Text == "Địa chỉ")
                {
                    ListStaff_dgv.DataSource = BUS_Staff.Instance.FindProfileStaff_FindBy(Find_txt.Text, "Address");
                }
                else
                {
                    string FormatDate = Find_txt.Text.Replace("-", "/");
                    ListStaff_dgv.DataSource = BUS_Staff.Instance.FindProfileStaff_FindBy(FormatDate, "BirthDay");
                }

            }
            catch (Exception) { }
        }

        private void FindBy_cbb_SelectedValueChanged(object sender, EventArgs e)
        {
            Find_txt.Text = "";
            this.ActiveControl = label1;
        }

        private void NameStaff_txt_TextChanged(object sender, EventArgs e)
        {
            VerificationText();
        }

        private void PhoneNumber_txt_TextChanged(object sender, EventArgs e)
        {
            VerificationText();
        }

        private void Email_txt_TextChanged(object sender, EventArgs e)
        {
            VerificationText();
        }

        private void Adress_txt_TextChanged(object sender, EventArgs e)
        {
            VerificationText();
        }

        private void Gender_cbb_SelectedValueChanged(object sender, EventArgs e)
        {
            VerificationText();
            this.ActiveControl = label1;
        }

        private void Role_cbb_SelectedValueChanged(object sender, EventArgs e)
        {
            VerificationText();
            this.ActiveControl = label1;
        }

        private void PathPicture_txt_TextChanged(object sender, EventArgs e)
        {
            VerificationText();
        }
    }
}
