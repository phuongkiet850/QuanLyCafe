
namespace GUI_QuanLyCafe
{
    partial class MenuManager_frm
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.ds = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.FindBy_cbb = new System.Windows.Forms.ComboBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.Edit_ckb = new System.Windows.Forms.CheckBox();
            this.Edit_btn = new Guna.UI2.WinForms.Guna2Button();
            this.Add_btn = new Guna.UI2.WinForms.Guna2Button();
            this.Delete_btn = new Guna.UI2.WinForms.Guna2Button();
            this.TimKiem_txt = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.ResetFind_btn = new Guna.UI2.WinForms.Guna2Button();
            this.OpenFilePicture_btn = new Guna.UI2.WinForms.Guna2Button();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(12, 140);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(77, 21);
            this.label1.TabIndex = 0;
            this.label1.Text = "Tên món";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(12, 191);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(36, 21);
            this.label2.TabIndex = 1;
            this.label2.Text = "Giá";
            // 
            // ds
            // 
            this.ds.AutoSize = true;
            this.ds.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ds.Location = new System.Drawing.Point(12, 244);
            this.ds.Name = "ds";
            this.ds.Size = new System.Drawing.Size(86, 21);
            this.ds.TabIndex = 2;
            this.ds.Text = "Danh mục";
            // 
            // textBox1
            // 
            this.textBox1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.Location = new System.Drawing.Point(104, 137);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(271, 29);
            this.textBox1.TabIndex = 3;
            // 
            // textBox2
            // 
            this.textBox2.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox2.Location = new System.Drawing.Point(104, 188);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(271, 29);
            this.textBox2.TabIndex = 4;
            // 
            // comboBox1
            // 
            this.comboBox1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(104, 244);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(271, 29);
            this.comboBox1.TabIndex = 5;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(16, 426);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(618, 198);
            this.dataGridView1.TabIndex = 6;
            // 
            // FindBy_cbb
            // 
            this.FindBy_cbb.AutoCompleteCustomSource.AddRange(new string[] {
            "Nam\t",
            "Nữ ",
            "Khác"});
            this.FindBy_cbb.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource;
            this.FindBy_cbb.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FindBy_cbb.FormattingEnabled = true;
            this.FindBy_cbb.Items.AddRange(new object[] {
            "Tất cả",
            "Mã số",
            "Họ tên",
            "Giới tính",
            "Email",
            "Số điện thoại",
            "Địa chỉ",
            "Ngày sinh"});
            this.FindBy_cbb.Location = new System.Drawing.Point(381, 384);
            this.FindBy_cbb.Name = "FindBy_cbb";
            this.FindBy_cbb.Size = new System.Drawing.Size(123, 29);
            this.FindBy_cbb.TabIndex = 126;
            this.FindBy_cbb.TabStop = false;
            this.FindBy_cbb.Text = "Tất cả";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.Edit_ckb);
            this.groupBox1.Controls.Add(this.Edit_btn);
            this.groupBox1.Controls.Add(this.Add_btn);
            this.groupBox1.Controls.Add(this.Delete_btn);
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(16, 295);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(359, 68);
            this.groupBox1.TabIndex = 125;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Chỉnh sửa";
            // 
            // Edit_ckb
            // 
            this.Edit_ckb.AutoSize = true;
            this.Edit_ckb.Location = new System.Drawing.Point(92, 4);
            this.Edit_ckb.Name = "Edit_ckb";
            this.Edit_ckb.Size = new System.Drawing.Size(15, 14);
            this.Edit_ckb.TabIndex = 14;
            this.Edit_ckb.TabStop = false;
            this.Edit_ckb.UseVisualStyleBackColor = true;
            // 
            // Edit_btn
            // 
            this.Edit_btn.Animated = true;
            this.Edit_btn.BorderRadius = 10;
            this.Edit_btn.BorderThickness = 2;
            this.Edit_btn.CheckedState.Parent = this.Edit_btn;
            this.Edit_btn.CustomImages.Parent = this.Edit_btn;
            this.Edit_btn.Enabled = false;
            this.Edit_btn.FillColor = System.Drawing.Color.White;
            this.Edit_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Edit_btn.ForeColor = System.Drawing.Color.Black;
            this.Edit_btn.HoverState.Parent = this.Edit_btn;
            this.Edit_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.edit_icon;
            this.Edit_btn.Location = new System.Drawing.Point(249, 27);
            this.Edit_btn.Name = "Edit_btn";
            this.Edit_btn.ShadowDecoration.Parent = this.Edit_btn;
            this.Edit_btn.Size = new System.Drawing.Size(90, 30);
            this.Edit_btn.TabIndex = 164;
            this.Edit_btn.Text = "Sửa";
            // 
            // Add_btn
            // 
            this.Add_btn.Animated = true;
            this.Add_btn.BorderRadius = 10;
            this.Add_btn.BorderThickness = 2;
            this.Add_btn.CheckedState.Parent = this.Add_btn;
            this.Add_btn.CustomImages.Parent = this.Add_btn;
            this.Add_btn.Enabled = false;
            this.Add_btn.FillColor = System.Drawing.Color.White;
            this.Add_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Add_btn.ForeColor = System.Drawing.Color.Black;
            this.Add_btn.HoverState.Parent = this.Add_btn;
            this.Add_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.add_icon;
            this.Add_btn.Location = new System.Drawing.Point(17, 27);
            this.Add_btn.Name = "Add_btn";
            this.Add_btn.ShadowDecoration.Parent = this.Add_btn;
            this.Add_btn.Size = new System.Drawing.Size(90, 30);
            this.Add_btn.TabIndex = 162;
            this.Add_btn.Text = "Thêm";
            // 
            // Delete_btn
            // 
            this.Delete_btn.Animated = true;
            this.Delete_btn.BorderRadius = 10;
            this.Delete_btn.BorderThickness = 2;
            this.Delete_btn.CheckedState.Parent = this.Delete_btn;
            this.Delete_btn.CustomImages.Parent = this.Delete_btn;
            this.Delete_btn.Enabled = false;
            this.Delete_btn.FillColor = System.Drawing.Color.White;
            this.Delete_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Delete_btn.ForeColor = System.Drawing.Color.Black;
            this.Delete_btn.HoverState.Parent = this.Delete_btn;
            this.Delete_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.Actions_edit_delete_icon;
            this.Delete_btn.Location = new System.Drawing.Point(130, 27);
            this.Delete_btn.Name = "Delete_btn";
            this.Delete_btn.ShadowDecoration.Parent = this.Delete_btn;
            this.Delete_btn.Size = new System.Drawing.Size(90, 30);
            this.Delete_btn.TabIndex = 163;
            this.Delete_btn.Text = "Xóa";
            // 
            // TimKiem_txt
            // 
            this.TimKiem_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TimKiem_txt.Location = new System.Drawing.Point(104, 384);
            this.TimKiem_txt.Name = "TimKiem_txt";
            this.TimKiem_txt.Size = new System.Drawing.Size(271, 29);
            this.TimKiem_txt.TabIndex = 123;
            this.TimKiem_txt.TabStop = false;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(16, 387);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(82, 21);
            this.label9.TabIndex = 122;
            this.label9.Text = "Tìm kiếm";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(259, 42);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(236, 31);
            this.label3.TabIndex = 127;
            this.label3.Text = "QUẢN  LÝ MENU";
            // 
            // pictureBox1
            // 
            this.pictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.pictureBox1.Location = new System.Drawing.Point(437, 137);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(197, 226);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 7;
            this.pictureBox1.TabStop = false;
            // 
            // ResetFind_btn
            // 
            this.ResetFind_btn.Animated = true;
            this.ResetFind_btn.BorderRadius = 5;
            this.ResetFind_btn.BorderThickness = 1;
            this.ResetFind_btn.CheckedState.Parent = this.ResetFind_btn;
            this.ResetFind_btn.CustomImages.Parent = this.ResetFind_btn;
            this.ResetFind_btn.Enabled = false;
            this.ResetFind_btn.FillColor = System.Drawing.Color.White;
            this.ResetFind_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ResetFind_btn.ForeColor = System.Drawing.Color.Black;
            this.ResetFind_btn.HoverState.Parent = this.ResetFind_btn;
            this.ResetFind_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.Refreshicon;
            this.ResetFind_btn.Location = new System.Drawing.Point(510, 384);
            this.ResetFind_btn.Name = "ResetFind_btn";
            this.ResetFind_btn.ShadowDecoration.Parent = this.ResetFind_btn;
            this.ResetFind_btn.Size = new System.Drawing.Size(32, 29);
            this.ResetFind_btn.TabIndex = 166;
            // 
            // OpenFilePicture_btn
            // 
            this.OpenFilePicture_btn.Animated = true;
            this.OpenFilePicture_btn.BorderRadius = 5;
            this.OpenFilePicture_btn.BorderThickness = 1;
            this.OpenFilePicture_btn.CheckedState.Parent = this.OpenFilePicture_btn;
            this.OpenFilePicture_btn.CustomImages.Parent = this.OpenFilePicture_btn;
            this.OpenFilePicture_btn.Enabled = false;
            this.OpenFilePicture_btn.FillColor = System.Drawing.Color.White;
            this.OpenFilePicture_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.OpenFilePicture_btn.ForeColor = System.Drawing.Color.Black;
            this.OpenFilePicture_btn.HoverState.Parent = this.OpenFilePicture_btn;
            this.OpenFilePicture_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.folder1;
            this.OpenFilePicture_btn.Location = new System.Drawing.Point(393, 334);
            this.OpenFilePicture_btn.Name = "OpenFilePicture_btn";
            this.OpenFilePicture_btn.ShadowDecoration.Parent = this.OpenFilePicture_btn;
            this.OpenFilePicture_btn.Size = new System.Drawing.Size(38, 29);
            this.OpenFilePicture_btn.TabIndex = 165;
            this.OpenFilePicture_btn.Visible = false;
            // 
            // pictureBox2
            // 
            this.pictureBox2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.pictureBox2.Image = global::GUI_QuanLyCafe.Properties.Resources._1200px_Highlands_Coffee_logo_svg;
            this.pictureBox2.Location = new System.Drawing.Point(5, 5);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(172, 119);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 167;
            this.pictureBox2.TabStop = false;
            // 
            // MenuManager_frm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(647, 633);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.ResetFind_btn);
            this.Controls.Add(this.OpenFilePicture_btn);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.FindBy_cbb);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.TimKiem_txt);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.ds);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "MenuManager_frm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Quản lý Menu";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label ds;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.ComboBox FindBy_cbb;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.CheckBox Edit_ckb;
        private System.Windows.Forms.TextBox TimKiem_txt;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label3;
        private Guna.UI2.WinForms.Guna2Button Edit_btn;
        private Guna.UI2.WinForms.Guna2Button Add_btn;
        private Guna.UI2.WinForms.Guna2Button Delete_btn;
        private Guna.UI2.WinForms.Guna2Button ResetFind_btn;
        private Guna.UI2.WinForms.Guna2Button OpenFilePicture_btn;
        private System.Windows.Forms.PictureBox pictureBox2;
    }
}