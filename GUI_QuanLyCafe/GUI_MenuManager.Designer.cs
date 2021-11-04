
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
            this.TimKiem_txt = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.Add_btn = new System.Windows.Forms.Button();
            this.Delete_btn = new System.Windows.Forms.Button();
            this.Edit_btn = new System.Windows.Forms.Button();
            this.ResetFind_btn = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
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
            this.groupBox1.Controls.Add(this.Add_btn);
            this.groupBox1.Controls.Add(this.Delete_btn);
            this.groupBox1.Controls.Add(this.Edit_btn);
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
            // pictureBox2
            // 
            this.pictureBox2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.pictureBox2.Image = global::GUI_QuanLyCafe.Properties.Resources._1200px_Highlands_Coffee_logo_svg;
            this.pictureBox2.Location = new System.Drawing.Point(12, 6);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(187, 115);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 151;
            this.pictureBox2.TabStop = false;
            // 
            // Add_btn
            // 
            this.Add_btn.Enabled = false;
            this.Add_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Add_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.add_icon;
            this.Add_btn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.Add_btn.Location = new System.Drawing.Point(24, 24);
            this.Add_btn.Name = "Add_btn";
            this.Add_btn.Size = new System.Drawing.Size(88, 32);
            this.Add_btn.TabIndex = 7;
            this.Add_btn.TabStop = false;
            this.Add_btn.Text = "Thêm";
            this.Add_btn.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.Add_btn.UseVisualStyleBackColor = true;
            // 
            // Delete_btn
            // 
            this.Delete_btn.Enabled = false;
            this.Delete_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Delete_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.Actions_edit_delete_icon;
            this.Delete_btn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.Delete_btn.Location = new System.Drawing.Point(149, 24);
            this.Delete_btn.Name = "Delete_btn";
            this.Delete_btn.Size = new System.Drawing.Size(75, 32);
            this.Delete_btn.TabIndex = 8;
            this.Delete_btn.TabStop = false;
            this.Delete_btn.Text = "Xóa";
            this.Delete_btn.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.Delete_btn.UseVisualStyleBackColor = true;
            // 
            // Edit_btn
            // 
            this.Edit_btn.Enabled = false;
            this.Edit_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Edit_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.edit_icon;
            this.Edit_btn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.Edit_btn.Location = new System.Drawing.Point(258, 24);
            this.Edit_btn.Name = "Edit_btn";
            this.Edit_btn.Size = new System.Drawing.Size(75, 32);
            this.Edit_btn.TabIndex = 9;
            this.Edit_btn.TabStop = false;
            this.Edit_btn.Text = "Sửa";
            this.Edit_btn.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.Edit_btn.UseVisualStyleBackColor = true;
            // 
            // ResetFind_btn
            // 
            this.ResetFind_btn.FlatAppearance.BorderSize = 0;
            this.ResetFind_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ResetFind_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.Refreshicon;
            this.ResetFind_btn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.ResetFind_btn.Location = new System.Drawing.Point(510, 383);
            this.ResetFind_btn.Name = "ResetFind_btn";
            this.ResetFind_btn.Size = new System.Drawing.Size(32, 32);
            this.ResetFind_btn.TabIndex = 124;
            this.ResetFind_btn.TabStop = false;
            this.ResetFind_btn.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.ResetFind_btn.UseVisualStyleBackColor = true;
            // 
            // button1
            // 
            this.button1.Image = global::GUI_QuanLyCafe.Properties.Resources.folder;
            this.button1.Location = new System.Drawing.Point(395, 328);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(36, 35);
            this.button1.TabIndex = 8;
            this.button1.UseVisualStyleBackColor = true;
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
            // MenuManager_frm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(647, 633);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.FindBy_cbb);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.ResetFind_btn);
            this.Controls.Add(this.TimKiem_txt);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.button1);
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
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
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
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ComboBox FindBy_cbb;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.CheckBox Edit_ckb;
        private System.Windows.Forms.Button Add_btn;
        private System.Windows.Forms.Button Delete_btn;
        private System.Windows.Forms.Button Edit_btn;
        private System.Windows.Forms.Button ResetFind_btn;
        private System.Windows.Forms.TextBox TimKiem_txt;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.PictureBox pictureBox2;
    }
}