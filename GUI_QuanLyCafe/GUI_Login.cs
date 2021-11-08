using BUS_QuanLyCafe;
using DTO_QuanLyCafe;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Sql;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI_QuanLyCafe
{
    public partial class Login_frm : Form
    {
        public Login_frm()
        {
            InitializeComponent();
        }
        DTO_Connection conn = new DTO_Connection();
        DTO_Staff staff = new DTO_Staff();
        public static string TimeMin;
        public static string TimeMax;
        public static string Shift;
        public static string Email;

        private void Login_frm_Load(object sender, EventArgs e)
        {
            this.ActiveControl = label1;
            Connect();
            ReadSetting();
            Thread.Sleep(1000);
            this.Focus();
        }

        private void ReadSetting()
        {
            if (Properties.Settings.Default.Memo == "true")
            {
                Email_txt.Text = Properties.Settings.Default.Email;
                Password_txt.Text = Properties.Settings.Default.Password;
                ServerName_cbb.Text = Properties.Settings.Default.ServerName;
                InstanceName_cbb.Text = Properties.Settings.Default.InstanceName;
                Memo_ckb.Checked = true;
            }
            else
            {
                Email_txt.Text = Properties.Settings.Default.Email;
                Password_txt.Text = "";
                this.ActiveControl = Password_txt;
                Memo_ckb.Checked = false;
            }
        }

        private void SaveSettings()
        {
            if (Memo_ckb.Checked)
            {
                Properties.Settings.Default.Email = this.Email_txt.Text;
                Properties.Settings.Default.Password = this.Password_txt.Text;
                Properties.Settings.Default.ServerName = this.ServerName_cbb.Text;
                Properties.Settings.Default.InstanceName = this.InstanceName_cbb.Text;
                Properties.Settings.Default.Memo = "true";
                Properties.Settings.Default.Save();
            }
            else
            {
                Properties.Settings.Default.Email = this.Email_txt.Text;
                Properties.Settings.Default.Password = "";
                Properties.Settings.Default.Memo = "false";
                Properties.Settings.Default.Save();
            }
        }

        private void Connect()
        {
            SqlDataSourceEnumerator instance = SqlDataSourceEnumerator.Instance;
            DataTable tb = instance.GetDataSources();
            Loading_frm.Status = 1;
            ServerName_cbb.DataSource = tb;
            InstanceName_cbb.DataSource = tb;
            ServerName_cbb.DisplayMember = "ServerName";
            InstanceName_cbb.DisplayMember = "InstanceName";
        }

        private void ShowHide_ckb_CheckedChanged(object sender, EventArgs e)
        {
            if (ShowHide_ckb.Checked == true)
            {
                Show_ptb.Show();
                Hide_ptb.Hide();
                Password_txt.UseSystemPasswordChar = false;
            }
            else
            {
                Show_ptb.Hide();
                Hide_ptb.Show();
                Password_txt.UseSystemPasswordChar = true;
            }
        }

        private void Login_btn_Click(object sender, EventArgs e)
        {
            try
            {
                if (Email_txt.Text == "")
                {
                    MessageBox.Show("Đăng nhập không thành công, email không được để trống ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    this.ActiveControl = Email_txt;
                }
                else if (Password_txt.Text == "")
                {
                    MessageBox.Show("Đăng nhập không thành công, mật khẩu không được để trống ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    this.ActiveControl = Password_txt;
                }
                else
                {
                    if (Shift_cbb.Text == "None")
                    {
                        MessageBox.Show("Đăng nhập không thành công, bạn chưa chọn ca làm việc ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else
                    {
                        if (DateTime.Parse(DateTime.Now.TimeOfDay.ToString()) > DateTime.Parse(TimeMax))
                        {
                            MessageBox.Show("Đăng nhập không thành công, ca làm việc của bạn chọn đã kết thúc", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                        else if (DateTime.Parse(DateTime.Now.TimeOfDay.ToString()) < DateTime.Parse(TimeMin))
                        {
                            MessageBox.Show("Đăng nhập không thành công, ca làm việc của bạn chọn chưa bắt đầu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                        else
                        {
                            string ServerName = conn.ServerName + @"\" + conn.InstanceName;
                            string connectionString = string.Format("Data Source= {0} ;Initial Catalog=QuanLyCafe; Integrated Security = True", ServerName);

                            DTO_Connection setting = new DTO_Connection();
                            setting.SaveConnectionString("Data", connectionString);

                            FileInfo file = new FileInfo(Application.StartupPath + @"\Data\Data.bat");
                            if (file.Exists) { Thread.Sleep(2000); }
                            else
                            {
                                using (StreamWriter sw = file.CreateText())
                                {
                                    sw.WriteLine("SQLCMD -E -S " + ServerName + " -i " + '"' + Application.StartupPath + @"\data\Data.sql" + '"');

                                }
                                BUS_Staff.Instance.ExcuteScript();
                                Thread.Sleep(3000);
                            }

                            SqlHelper helper = new SqlHelper(connectionString);
                            if (helper.IsConnection)
                            {
                                staff.Email = Email_txt.Text;
                                staff.Password = BUS_Staff.Instance.Encryption(Password_txt.Text);
                                if (BUS_Staff.Instance.AcceptLogin(staff) == true && BUS_Staff.Instance.Check(staff).Rows[0][10].ToString() == "Hoạt động")
                                {
                                    if (BUS_Staff.Instance.Check(staff).Rows[0][7].ToString() != "Phục vụ")
                                    {
                                        if (BUS_Staff.Instance.Check(staff).Rows[0][7].ToString() == "Quản lý")
                                        {
                                            Confirm_frm.Result = 1;
                                        }
                                        else
                                        {
                                            Confirm_frm.Result = 0;
                                        }
                                        Login_btn.Enabled = false;
                                        SaveSettings();
                                        LoadBar.Visible = true;
                                        timer1_Tick(sender, e);
                                    }
                                    else
                                    {
                                        MessageBox.Show("Đăng nhập không thành công, tài khoản của bạn không hợp lệ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                    }


                                }
                                else if (BUS_Staff.Instance.AcceptLogin(staff) == true && BUS_Staff.Instance.Check(staff).Rows[0][10].ToString() == "Không hoạt động")
                                {
                                    MessageBox.Show("Đăng nhập không thành công, tài khoản của bạn đã bị vô hiệu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                }
                                else
                                {
                                    MessageBox.Show("Đăng nhập không thành công, kiểm tra lại email hoặc mật khẩu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                }
                            }
                        }


                        //////////////////////////////////////////////////////////////

                        //    string ServerName = conn.ServerName + @"\" + conn.InstanceName;
                        //    string connectionString = string.Format("Data Source= {0} ;Initial Catalog=QuanLyCafe; Integrated Security = True", ServerName);

                        //    DTO_Connection setting = new DTO_Connection();
                        //    setting.SaveConnectionString("Data", connectionString);

                        //    FileInfo file = new FileInfo(Application.StartupPath + @"\Data\Data.bat");
                        //    if (file.Exists) { Thread.Sleep(2000); }
                        //    else
                        //    {
                        //        using (StreamWriter sw = file.CreateText())
                        //        {
                        //            sw.WriteLine("SQLCMD -E -S " + ServerName + " -i " + '"' + Application.StartupPath + @"\data\Data.sql" + '"');

                        //        }
                        //        BUS_Staff.Instance.ExcuteScript();
                        //        Thread.Sleep(3000);
                        //    }

                        //    SqlHelper helper = new SqlHelper(connectionString);
                        //    if (helper.IsConnection)
                        //    {
                        //        staff.Email = Email_txt.Text;
                        //        staff.Password = BUS_Staff.Instance.Encryption(Password_txt.Text);
                        //        if (BUS_Staff.Instance.AcceptLogin(staff) == true && BUS_Staff.Instance.Check(staff).Rows[0][10].ToString() == "Hoạt động")
                        //        {
                        //            if (BUS_Staff.Instance.Check(staff).Rows[0][7].ToString() == "Quản lý")
                        //            {
                        //                Confirm_frm.Result = 1;
                        //            }
                        //            else
                        //            {
                        //                Confirm_frm.Result = 0;
                        //            }
                        //            Login_btn.Enabled = false;
                        //            SaveSettings();
                        //            LoadBar.Visible = true;
                        //            timer1_Tick(sender, e);

                        //        }
                        //        else if (BUS_Staff.Instance.AcceptLogin(staff) == true && BUS_Staff.Instance.Check(staff).Rows[0][10].ToString() == "Không hoạt động")
                        //        {
                        //            MessageBox.Show("Đăng nhập không thành công , tài khoản của bạn đã bị vô hiệu ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        //        }
                        //        else
                        //        {
                        //            MessageBox.Show("Đăng nhập không thành công , kiểm tra lại email hoặc mật  khẩu ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        //        }
                        //    }
                    }
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Không kết nối được với Server, xin vui lòng thử lại sau", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            this.LoadBar.Increment(12);
            LoadBar.Maximum = 100;

            if (LoadBar.Visible == true)
            {
                timer1.Start();
                Login_grb.Enabled = false;
                if (LoadBar.Value == LoadBar.Maximum)
                {
                    timer1.Stop();
                    Email = Email_txt.Text;
                    LoadBar.Visible = false;
                    this.Hide();
                    Order_frm order = new Order_frm();
                    order.ShowDialog();
                }
                Login_btn.Text += ".";
                if (Login_btn.Text.Length >= 6)
                {
                    Login_btn.Text = ".";
                }
            }
            else
            {
                timer1.Stop();
            }
        }

        private void Login_frm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (LoadBar.Visible == true)
            {
                e.Cancel = true;
            }
            else if (LoadBar.Visible != true && Loading_frm.Status == 1)
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
        }

        private void ServerName_cbb_SelectedIndexChanged(object sender, EventArgs e)
        {
            conn.ServerName = ServerName_cbb.Text;
            this.ActiveControl = label1;
        }

        private void InstanceName_cbb_SelectedValueChanged(object sender, EventArgs e)
        {
            conn.InstanceName = InstanceName_cbb.Text;
            this.ActiveControl = label1;
        }

        private void ForgotPassword_lblk_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            ForgotPassword_frm forgotPassword = new ForgotPassword_frm();
            forgotPassword.ShowDialog();
        }

        private void Shift_cbb_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Shift_cbb.SelectedIndex == 0)
            {
                TimeMin = "06:30:00";
                TimeMax = "14:30:00";
                Shift = "Ca sáng";
            }
            else if (Shift_cbb.SelectedIndex == 1)
            {
                TimeMin = "14:30:00";
                TimeMax = "23:30:00";
                Shift = "Ca tối";
            }
            this.ActiveControl = label1;
        }

        private void ServerName_cbb_KeyDown(object sender, KeyEventArgs e)
        {
            e.SuppressKeyPress = true;
        }

        private void Shift_cbb_KeyDown(object sender, KeyEventArgs e)
        {
            e.SuppressKeyPress = true;
        }
    }
}
