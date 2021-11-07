
namespace GUI_QuanLyCafe
{
    partial class Login_frm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.InstanceName_cbb = new System.Windows.Forms.ComboBox();
            this.ServerName_cbb = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.ForgotPassword_lblk = new System.Windows.Forms.LinkLabel();
            this.Memo_ckb = new System.Windows.Forms.CheckBox();
            this.LoadBar = new Guna.UI2.WinForms.Guna2ProgressBar();
            this.ShowHide_ckb = new System.Windows.Forms.CheckBox();
            this.Password_txt = new System.Windows.Forms.TextBox();
            this.Email_txt = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.Login_grb = new System.Windows.Forms.GroupBox();
            this.Login_btn = new Guna.UI2.WinForms.Guna2Button();
            this.label4 = new System.Windows.Forms.Label();
            this.Shift_cbb = new System.Windows.Forms.ComboBox();
            this.Show_ptb = new System.Windows.Forms.PictureBox();
            this.Hide_ptb = new System.Windows.Forms.PictureBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.Login_grb.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Show_ptb)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.Hide_ptb)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // InstanceName_cbb
            // 
            this.InstanceName_cbb.Enabled = false;
            this.InstanceName_cbb.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.InstanceName_cbb.FormattingEnabled = true;
            this.InstanceName_cbb.Location = new System.Drawing.Point(148, 86);
            this.InstanceName_cbb.Name = "InstanceName_cbb";
            this.InstanceName_cbb.Size = new System.Drawing.Size(311, 29);
            this.InstanceName_cbb.TabIndex = 12;
            this.InstanceName_cbb.SelectedValueChanged += new System.EventHandler(this.InstanceName_cbb_SelectedValueChanged);
            // 
            // ServerName_cbb
            // 
            this.ServerName_cbb.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ServerName_cbb.FormattingEnabled = true;
            this.ServerName_cbb.Location = new System.Drawing.Point(148, 41);
            this.ServerName_cbb.Name = "ServerName_cbb";
            this.ServerName_cbb.Size = new System.Drawing.Size(311, 29);
            this.ServerName_cbb.TabIndex = 11;
            this.ServerName_cbb.SelectedIndexChanged += new System.EventHandler(this.ServerName_cbb_SelectedIndexChanged);
            this.ServerName_cbb.KeyDown += new System.Windows.Forms.KeyEventHandler(this.ServerName_cbb_KeyDown);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(53, 44);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(89, 21);
            this.label3.TabIndex = 10;
            this.label3.Text = "Tên server";
            // 
            // ForgotPassword_lblk
            // 
            this.ForgotPassword_lblk.AutoSize = true;
            this.ForgotPassword_lblk.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ForgotPassword_lblk.Location = new System.Drawing.Point(53, 306);
            this.ForgotPassword_lblk.Name = "ForgotPassword_lblk";
            this.ForgotPassword_lblk.Size = new System.Drawing.Size(135, 21);
            this.ForgotPassword_lblk.TabIndex = 5;
            this.ForgotPassword_lblk.TabStop = true;
            this.ForgotPassword_lblk.Text = "Quên mật khẩu ?";
            this.ForgotPassword_lblk.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.ForgotPassword_lblk_LinkClicked);
            // 
            // Memo_ckb
            // 
            this.Memo_ckb.AutoSize = true;
            this.Memo_ckb.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Memo_ckb.Location = new System.Drawing.Point(57, 269);
            this.Memo_ckb.Name = "Memo_ckb";
            this.Memo_ckb.Size = new System.Drawing.Size(171, 25);
            this.Memo_ckb.TabIndex = 3;
            this.Memo_ckb.Text = "Ghi nhớ đăng nhập";
            this.Memo_ckb.UseVisualStyleBackColor = true;
            // 
            // LoadBar
            // 
            this.LoadBar.BorderRadius = 10;
            this.LoadBar.FillColor = System.Drawing.Color.LightGray;
            this.LoadBar.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.LoadBar.ForeColor = System.Drawing.Color.White;
            this.LoadBar.GradientMode = System.Drawing.Drawing2D.LinearGradientMode.Horizontal;
            this.LoadBar.Location = new System.Drawing.Point(160, 483);
            this.LoadBar.Name = "LoadBar";
            this.LoadBar.ProgressColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(0)))), ((int)(((byte)(0)))));
            this.LoadBar.ProgressColor2 = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(64)))), ((int)(((byte)(0)))));
            this.LoadBar.ShadowDecoration.Parent = this.LoadBar;
            this.LoadBar.ShowPercentage = true;
            this.LoadBar.Size = new System.Drawing.Size(309, 25);
            this.LoadBar.TabIndex = 9;
            this.LoadBar.TabStop = false;
            this.LoadBar.TextRenderingHint = System.Drawing.Text.TextRenderingHint.SystemDefault;
            this.LoadBar.Visible = false;
            // 
            // ShowHide_ckb
            // 
            this.ShowHide_ckb.AutoSize = true;
            this.ShowHide_ckb.BackColor = System.Drawing.Color.Transparent;
            this.ShowHide_ckb.ForeColor = System.Drawing.SystemColors.ControlText;
            this.ShowHide_ckb.ImageAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.ShowHide_ckb.Location = new System.Drawing.Point(465, 217);
            this.ShowHide_ckb.Name = "ShowHide_ckb";
            this.ShowHide_ckb.Size = new System.Drawing.Size(54, 27);
            this.ShowHide_ckb.TabIndex = 8;
            this.ShowHide_ckb.TabStop = false;
            this.ShowHide_ckb.Text = "     ";
            this.ShowHide_ckb.UseVisualStyleBackColor = false;
            this.ShowHide_ckb.CheckedChanged += new System.EventHandler(this.ShowHide_ckb_CheckedChanged);
            // 
            // Password_txt
            // 
            this.Password_txt.BackColor = System.Drawing.SystemColors.Window;
            this.Password_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Password_txt.Location = new System.Drawing.Point(148, 215);
            this.Password_txt.Name = "Password_txt";
            this.Password_txt.Size = new System.Drawing.Size(311, 29);
            this.Password_txt.TabIndex = 2;
            this.Password_txt.UseSystemPasswordChar = true;
            // 
            // Email_txt
            // 
            this.Email_txt.BackColor = System.Drawing.SystemColors.Window;
            this.Email_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Email_txt.Location = new System.Drawing.Point(148, 168);
            this.Email_txt.Name = "Email_txt";
            this.Email_txt.Size = new System.Drawing.Size(311, 29);
            this.Email_txt.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(53, 171);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(51, 21);
            this.label1.TabIndex = 0;
            this.label1.Text = "Email";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(53, 215);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(79, 21);
            this.label2.TabIndex = 0;
            this.label2.Text = "Mật khẩu";
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Interval = 800;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // Login_grb
            // 
            this.Login_grb.BackColor = System.Drawing.Color.Transparent;
            this.Login_grb.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.Login_grb.Controls.Add(this.Login_btn);
            this.Login_grb.Controls.Add(this.label4);
            this.Login_grb.Controls.Add(this.Shift_cbb);
            this.Login_grb.Controls.Add(this.InstanceName_cbb);
            this.Login_grb.Controls.Add(this.ServerName_cbb);
            this.Login_grb.Controls.Add(this.label3);
            this.Login_grb.Controls.Add(this.ForgotPassword_lblk);
            this.Login_grb.Controls.Add(this.Memo_ckb);
            this.Login_grb.Controls.Add(this.Show_ptb);
            this.Login_grb.Controls.Add(this.Hide_ptb);
            this.Login_grb.Controls.Add(this.ShowHide_ckb);
            this.Login_grb.Controls.Add(this.Password_txt);
            this.Login_grb.Controls.Add(this.Email_txt);
            this.Login_grb.Controls.Add(this.label1);
            this.Login_grb.Controls.Add(this.label2);
            this.Login_grb.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Login_grb.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.Login_grb.Location = new System.Drawing.Point(27, 127);
            this.Login_grb.Name = "Login_grb";
            this.Login_grb.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.Login_grb.Size = new System.Drawing.Size(555, 344);
            this.Login_grb.TabIndex = 7;
            this.Login_grb.TabStop = false;
            this.Login_grb.Text = "Đăng nhập";
            // 
            // Login_btn
            // 
            this.Login_btn.BorderRadius = 10;
            this.Login_btn.BorderThickness = 2;
            this.Login_btn.CheckedState.Parent = this.Login_btn;
            this.Login_btn.CustomImages.Parent = this.Login_btn;
            this.Login_btn.FillColor = System.Drawing.Color.White;
            this.Login_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Login_btn.ForeColor = System.Drawing.Color.Black;
            this.Login_btn.HoverState.Parent = this.Login_btn;
            this.Login_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.Login_in_icon;
            this.Login_btn.ImageAlign = System.Windows.Forms.HorizontalAlignment.Left;
            this.Login_btn.Location = new System.Drawing.Point(324, 259);
            this.Login_btn.Name = "Login_btn";
            this.Login_btn.ShadowDecoration.Parent = this.Login_btn;
            this.Login_btn.Size = new System.Drawing.Size(135, 50);
            this.Login_btn.TabIndex = 39;
            this.Login_btn.Text = "Đăng nhập";
            this.Login_btn.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.Login_btn.Click += new System.EventHandler(this.Login_btn_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(53, 129);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(78, 23);
            this.label4.TabIndex = 14;
            this.label4.Text = "Chọn ca";
            // 
            // Shift_cbb
            // 
            this.Shift_cbb.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Shift_cbb.FormattingEnabled = true;
            this.Shift_cbb.Items.AddRange(new object[] {
            "Ca sáng (6h30 ➜14h30)",
            "Ca tối (14h30 ➜ 23h30)"});
            this.Shift_cbb.Location = new System.Drawing.Point(148, 126);
            this.Shift_cbb.Margin = new System.Windows.Forms.Padding(5);
            this.Shift_cbb.Name = "Shift_cbb";
            this.Shift_cbb.Size = new System.Drawing.Size(311, 29);
            this.Shift_cbb.TabIndex = 13;
            this.Shift_cbb.Text = "None";
            this.Shift_cbb.SelectedIndexChanged += new System.EventHandler(this.Shift_cbb_SelectedIndexChanged);
            this.Shift_cbb.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Shift_cbb_KeyDown);
            // 
            // Show_ptb
            // 
            this.Show_ptb.Image = global::GUI_QuanLyCafe.Properties.Resources.eye;
            this.Show_ptb.Location = new System.Drawing.Point(488, 213);
            this.Show_ptb.Name = "Show_ptb";
            this.Show_ptb.Size = new System.Drawing.Size(40, 31);
            this.Show_ptb.TabIndex = 9;
            this.Show_ptb.TabStop = false;
            this.Show_ptb.Visible = false;
            // 
            // Hide_ptb
            // 
            this.Hide_ptb.Image = global::GUI_QuanLyCafe.Properties.Resources.invisible;
            this.Hide_ptb.Location = new System.Drawing.Point(488, 213);
            this.Hide_ptb.Name = "Hide_ptb";
            this.Hide_ptb.Size = new System.Drawing.Size(40, 31);
            this.Hide_ptb.TabIndex = 9;
            this.Hide_ptb.TabStop = false;
            // 
            // pictureBox2
            // 
            this.pictureBox2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.pictureBox2.Image = global::GUI_QuanLyCafe.Properties.Resources._1200px_Highlands_Coffee_logo_svg;
            this.pictureBox2.Location = new System.Drawing.Point(222, 12);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(172, 119);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 152;
            this.pictureBox2.TabStop = false;
            // 
            // Login_frm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(608, 520);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.LoadBar);
            this.Controls.Add(this.Login_grb);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.Name = "Login_frm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Đăng nhập";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Login_frm_FormClosing);
            this.Load += new System.EventHandler(this.Login_frm_Load);
            this.Login_grb.ResumeLayout(false);
            this.Login_grb.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Show_ptb)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.Hide_ptb)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.ComboBox InstanceName_cbb;
        private System.Windows.Forms.ComboBox ServerName_cbb;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.LinkLabel ForgotPassword_lblk;
        private System.Windows.Forms.CheckBox Memo_ckb;
        private System.Windows.Forms.PictureBox Show_ptb;
        private System.Windows.Forms.PictureBox Hide_ptb;
        private Guna.UI2.WinForms.Guna2ProgressBar LoadBar;
        private System.Windows.Forms.CheckBox ShowHide_ckb;
        private System.Windows.Forms.TextBox Password_txt;
        private System.Windows.Forms.TextBox Email_txt;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.GroupBox Login_grb;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox Shift_cbb;
        private Guna.UI2.WinForms.Guna2Button Login_btn;
        private System.Windows.Forms.PictureBox pictureBox2;
    }
}