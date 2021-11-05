
namespace GUI_QuanLyCafe
{
    partial class Voucher_frm
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.TimKiem_txt = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.Edit_ckb = new System.Windows.Forms.CheckBox();
            this.Delete_btn = new Guna.UI2.WinForms.Guna2Button();
            this.Edit_btn = new Guna.UI2.WinForms.Guna2Button();
            this.Add_btn = new Guna.UI2.WinForms.Guna2Button();
            this.DanhSachKM_dgv = new System.Windows.Forms.DataGridView();
            this.MaKM_lbl = new System.Windows.Forms.Label();
            this.MaKM_txt = new System.Windows.Forms.TextBox();
            this.PhanTramKM_lbl = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.TenKM_txt = new System.Windows.Forms.TextBox();
            this.PhanTramKM_txt = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.CreateID_btn = new Guna.UI2.WinForms.Guna2Button();
            this.TenKM_lbl = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.Log_Menu = new System.Windows.Forms.MenuStrip();
            this.Log_MenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ResetFind_btn = new Guna.UI2.WinForms.Guna2Button();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DanhSachKM_dgv)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.Log_Menu.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // TimKiem_txt
            // 
            this.TimKiem_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TimKiem_txt.Location = new System.Drawing.Point(537, 133);
            this.TimKiem_txt.Name = "TimKiem_txt";
            this.TimKiem_txt.Size = new System.Drawing.Size(355, 29);
            this.TimKiem_txt.TabIndex = 120;
            this.TimKiem_txt.TabStop = false;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(449, 136);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(82, 21);
            this.label9.TabIndex = 119;
            this.label9.Text = "Tìm kiếm";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.Edit_ckb);
            this.groupBox2.Controls.Add(this.Delete_btn);
            this.groupBox2.Controls.Add(this.Edit_btn);
            this.groupBox2.Controls.Add(this.Add_btn);
            this.groupBox2.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox2.Location = new System.Drawing.Point(12, 333);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(422, 93);
            this.groupBox2.TabIndex = 118;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Chỉnh sửa";
            // 
            // Edit_ckb
            // 
            this.Edit_ckb.AutoSize = true;
            this.Edit_ckb.Location = new System.Drawing.Point(92, 4);
            this.Edit_ckb.Name = "Edit_ckb";
            this.Edit_ckb.Size = new System.Drawing.Size(15, 14);
            this.Edit_ckb.TabIndex = 14;
            this.Edit_ckb.UseVisualStyleBackColor = true;
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
            this.Delete_btn.Location = new System.Drawing.Point(171, 35);
            this.Delete_btn.Name = "Delete_btn";
            this.Delete_btn.ShadowDecoration.Parent = this.Delete_btn;
            this.Delete_btn.Size = new System.Drawing.Size(90, 40);
            this.Delete_btn.TabIndex = 169;
            this.Delete_btn.Text = "Xóa";
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
            this.Edit_btn.Location = new System.Drawing.Point(298, 35);
            this.Edit_btn.Name = "Edit_btn";
            this.Edit_btn.ShadowDecoration.Parent = this.Edit_btn;
            this.Edit_btn.Size = new System.Drawing.Size(90, 40);
            this.Edit_btn.TabIndex = 170;
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
            this.Add_btn.Location = new System.Drawing.Point(36, 35);
            this.Add_btn.Name = "Add_btn";
            this.Add_btn.ShadowDecoration.Parent = this.Add_btn;
            this.Add_btn.Size = new System.Drawing.Size(90, 40);
            this.Add_btn.TabIndex = 168;
            this.Add_btn.Text = "Thêm";
            // 
            // DanhSachKM_dgv
            // 
            this.DanhSachKM_dgv.AllowUserToAddRows = false;
            this.DanhSachKM_dgv.AllowUserToDeleteRows = false;
            this.DanhSachKM_dgv.AllowUserToResizeColumns = false;
            this.DanhSachKM_dgv.AllowUserToResizeRows = false;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DanhSachKM_dgv.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.DanhSachKM_dgv.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.DanhSachKM_dgv.ColumnHeadersHeight = 40;
            this.DanhSachKM_dgv.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.DanhSachKM_dgv.Location = new System.Drawing.Point(453, 172);
            this.DanhSachKM_dgv.Name = "DanhSachKM_dgv";
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DanhSachKM_dgv.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.DanhSachKM_dgv.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.DanhSachKM_dgv.Size = new System.Drawing.Size(477, 254);
            this.DanhSachKM_dgv.TabIndex = 117;
            this.DanhSachKM_dgv.TabStop = false;
            // 
            // MaKM_lbl
            // 
            this.MaKM_lbl.AutoSize = true;
            this.MaKM_lbl.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MaKM_lbl.Location = new System.Drawing.Point(26, 39);
            this.MaKM_lbl.Name = "MaKM_lbl";
            this.MaKM_lbl.Size = new System.Drawing.Size(123, 21);
            this.MaKM_lbl.TabIndex = 71;
            this.MaKM_lbl.Text = "Mã khuyến mãi";
            // 
            // MaKM_txt
            // 
            this.MaKM_txt.CausesValidation = false;
            this.MaKM_txt.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
            this.MaKM_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MaKM_txt.Location = new System.Drawing.Point(206, 36);
            this.MaKM_txt.Name = "MaKM_txt";
            this.MaKM_txt.ReadOnly = true;
            this.MaKM_txt.Size = new System.Drawing.Size(160, 29);
            this.MaKM_txt.TabIndex = 1;
            // 
            // PhanTramKM_lbl
            // 
            this.PhanTramKM_lbl.AutoSize = true;
            this.PhanTramKM_lbl.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.PhanTramKM_lbl.Location = new System.Drawing.Point(26, 134);
            this.PhanTramKM_lbl.Name = "PhanTramKM_lbl";
            this.PhanTramKM_lbl.Size = new System.Drawing.Size(174, 21);
            this.PhanTramKM_lbl.TabIndex = 69;
            this.PhanTramKM_lbl.Text = "Phần trăm khuyến mãi";
            // 
            // textBox1
            // 
            this.textBox1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.Location = new System.Drawing.Point(363, 131);
            this.textBox1.Name = "textBox1";
            this.textBox1.ReadOnly = true;
            this.textBox1.Size = new System.Drawing.Size(38, 29);
            this.textBox1.TabIndex = 74;
            this.textBox1.TabStop = false;
            this.textBox1.Text = "%";
            this.textBox1.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // TenKM_txt
            // 
            this.TenKM_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TenKM_txt.Location = new System.Drawing.Point(206, 83);
            this.TenKM_txt.Name = "TenKM_txt";
            this.TenKM_txt.ReadOnly = true;
            this.TenKM_txt.Size = new System.Drawing.Size(195, 29);
            this.TenKM_txt.TabIndex = 2;
            // 
            // PhanTramKM_txt
            // 
            this.PhanTramKM_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.PhanTramKM_txt.Location = new System.Drawing.Point(206, 131);
            this.PhanTramKM_txt.Name = "PhanTramKM_txt";
            this.PhanTramKM_txt.ReadOnly = true;
            this.PhanTramKM_txt.Size = new System.Drawing.Size(159, 29);
            this.PhanTramKM_txt.TabIndex = 3;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.CreateID_btn);
            this.groupBox1.Controls.Add(this.textBox1);
            this.groupBox1.Controls.Add(this.TenKM_txt);
            this.groupBox1.Controls.Add(this.PhanTramKM_txt);
            this.groupBox1.Controls.Add(this.MaKM_txt);
            this.groupBox1.Controls.Add(this.PhanTramKM_lbl);
            this.groupBox1.Controls.Add(this.TenKM_lbl);
            this.groupBox1.Controls.Add(this.MaKM_lbl);
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(12, 133);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(422, 181);
            this.groupBox1.TabIndex = 116;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin khuyến mãi";
            // 
            // CreateID_btn
            // 
            this.CreateID_btn.Animated = true;
            this.CreateID_btn.BorderThickness = 1;
            this.CreateID_btn.CheckedState.Parent = this.CreateID_btn;
            this.CreateID_btn.CustomImages.Parent = this.CreateID_btn;
            this.CreateID_btn.Enabled = false;
            this.CreateID_btn.FillColor = System.Drawing.Color.White;
            this.CreateID_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CreateID_btn.ForeColor = System.Drawing.Color.Black;
            this.CreateID_btn.HoverState.Parent = this.CreateID_btn;
            this.CreateID_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.id;
            this.CreateID_btn.Location = new System.Drawing.Point(365, 36);
            this.CreateID_btn.Name = "CreateID_btn";
            this.CreateID_btn.ShadowDecoration.Parent = this.CreateID_btn;
            this.CreateID_btn.Size = new System.Drawing.Size(36, 29);
            this.CreateID_btn.TabIndex = 173;
            // 
            // TenKM_lbl
            // 
            this.TenKM_lbl.AutoSize = true;
            this.TenKM_lbl.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TenKM_lbl.Location = new System.Drawing.Point(25, 86);
            this.TenKM_lbl.Name = "TenKM_lbl";
            this.TenKM_lbl.Size = new System.Drawing.Size(128, 21);
            this.TenKM_lbl.TabIndex = 68;
            this.TenKM_lbl.Text = "Tên khuyến mãi";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Times New Roman", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(334, 48);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(364, 31);
            this.label12.TabIndex = 115;
            this.label12.Text = "DANH SÁCH KHUYẾN MÃI";
            // 
            // Log_Menu
            // 
            this.Log_Menu.BackColor = System.Drawing.Color.Transparent;
            this.Log_Menu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.Log_MenuItem});
            this.Log_Menu.Location = new System.Drawing.Point(0, 0);
            this.Log_Menu.Name = "Log_Menu";
            this.Log_Menu.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.Log_Menu.Size = new System.Drawing.Size(942, 40);
            this.Log_Menu.TabIndex = 122;
            this.Log_Menu.Text = "menuStrip1";
            // 
            // Log_MenuItem
            // 
            this.Log_MenuItem.Image = global::GUI_QuanLyCafe.Properties.Resources.log_format;
            this.Log_MenuItem.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.Log_MenuItem.Name = "Log_MenuItem";
            this.Log_MenuItem.Size = new System.Drawing.Size(44, 36);
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
            this.ResetFind_btn.Location = new System.Drawing.Point(898, 133);
            this.ResetFind_btn.Name = "ResetFind_btn";
            this.ResetFind_btn.ShadowDecoration.Parent = this.ResetFind_btn;
            this.ResetFind_btn.Size = new System.Drawing.Size(32, 29);
            this.ResetFind_btn.TabIndex = 172;
            // 
            // pictureBox2
            // 
            this.pictureBox2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.pictureBox2.Image = global::GUI_QuanLyCafe.Properties.Resources._1200px_Highlands_Coffee_logo_svg;
            this.pictureBox2.Location = new System.Drawing.Point(5, 5);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(172, 119);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 173;
            this.pictureBox2.TabStop = false;
            // 
            // Voucher_frm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(942, 433);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.Log_Menu);
            this.Controls.Add(this.TimKiem_txt);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.ResetFind_btn);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.DanhSachKM_dgv);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label12);
            this.Name = "Voucher_frm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "GUI_Voucher";
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DanhSachKM_dgv)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.Log_Menu.ResumeLayout(false);
            this.Log_Menu.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.MenuStrip Log_Menu;
        private System.Windows.Forms.ToolStripMenuItem Log_MenuItem;
        private System.Windows.Forms.TextBox TimKiem_txt;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.CheckBox Edit_ckb;
        private System.Windows.Forms.DataGridView DanhSachKM_dgv;
        private System.Windows.Forms.Label MaKM_lbl;
        private System.Windows.Forms.TextBox MaKM_txt;
        private System.Windows.Forms.Label PhanTramKM_lbl;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox TenKM_txt;
        private System.Windows.Forms.TextBox PhanTramKM_txt;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label TenKM_lbl;
        private System.Windows.Forms.Label label12;
        private Guna.UI2.WinForms.Guna2Button Delete_btn;
        private Guna.UI2.WinForms.Guna2Button Edit_btn;
        private Guna.UI2.WinForms.Guna2Button Add_btn;
        private Guna.UI2.WinForms.Guna2Button CreateID_btn;
        private Guna.UI2.WinForms.Guna2Button ResetFind_btn;
        private System.Windows.Forms.PictureBox pictureBox2;
    }
}