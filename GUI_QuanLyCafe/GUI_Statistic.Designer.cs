
namespace GUI_QuanLyCafe
{
    partial class Statistic_frm
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            this.Statistic_dgv = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.Value1_date = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.Shift_cbb = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.Choose_cbb = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.Total_txt = new System.Windows.Forms.TextBox();
            this.Value2_date = new System.Windows.Forms.DateTimePicker();
            this.Staff_cbb = new System.Windows.Forms.ComboBox();
            this.label7 = new System.Windows.Forms.Label();
            this.Find_btn = new Guna.UI2.WinForms.Guna2Button();
            this.Pdf_btn = new Guna.UI2.WinForms.Guna2Button();
            this.Excel_btn = new Guna.UI2.WinForms.Guna2Button();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.Value1_cbb = new System.Windows.Forms.ComboBox();
            this.Value2_cbb = new System.Windows.Forms.ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.Statistic_dgv)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // Statistic_dgv
            // 
            this.Statistic_dgv.AllowUserToDeleteRows = false;
            this.Statistic_dgv.AllowUserToResizeColumns = false;
            this.Statistic_dgv.AllowUserToResizeRows = false;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(224)))), ((int)(((byte)(192)))));
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.InactiveCaptionText;
            this.Statistic_dgv.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.Statistic_dgv.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.Statistic_dgv.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.Statistic_dgv.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.Statistic_dgv.BackgroundColor = System.Drawing.Color.White;
            this.Statistic_dgv.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SunkenVertical;
            this.Statistic_dgv.ClipboardCopyMode = System.Windows.Forms.DataGridViewClipboardCopyMode.Disable;
            this.Statistic_dgv.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.Statistic_dgv.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.Statistic_dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(224)))), ((int)(((byte)(192)))));
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.InactiveCaptionText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.Statistic_dgv.DefaultCellStyle = dataGridViewCellStyle3;
            this.Statistic_dgv.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.Statistic_dgv.Location = new System.Drawing.Point(38, 263);
            this.Statistic_dgv.MultiSelect = false;
            this.Statistic_dgv.Name = "Statistic_dgv";
            this.Statistic_dgv.ReadOnly = true;
            this.Statistic_dgv.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle4.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle4.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.Color.Transparent;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle4.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.Statistic_dgv.RowHeadersDefaultCellStyle = dataGridViewCellStyle4;
            this.Statistic_dgv.RowHeadersVisible = false;
            this.Statistic_dgv.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridViewCellStyle5.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Statistic_dgv.RowsDefaultCellStyle = dataGridViewCellStyle5;
            this.Statistic_dgv.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.Statistic_dgv.ShowCellErrors = false;
            this.Statistic_dgv.ShowCellToolTips = false;
            this.Statistic_dgv.ShowEditingIcon = false;
            this.Statistic_dgv.ShowRowErrors = false;
            this.Statistic_dgv.Size = new System.Drawing.Size(1136, 280);
            this.Statistic_dgv.TabIndex = 29;
            this.Statistic_dgv.CellDoubleClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.Statistic_dgv_CellDoubleClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(34, 149);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(33, 23);
            this.label1.TabIndex = 30;
            this.label1.Text = "Từ";
            // 
            // Value1_date
            // 
            this.Value1_date.CustomFormat = "dd/MM/yyyy";
            this.Value1_date.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Value1_date.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.Value1_date.Location = new System.Drawing.Point(73, 145);
            this.Value1_date.Name = "Value1_date";
            this.Value1_date.Size = new System.Drawing.Size(151, 32);
            this.Value1_date.TabIndex = 31;
            this.Value1_date.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Value1_date_KeyDown);
            this.Value1_date.Leave += new System.EventHandler(this.Value1_date_Leave);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(249, 149);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 23);
            this.label2.TabIndex = 32;
            this.label2.Text = "Đến";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(34, 209);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(33, 23);
            this.label3.TabIndex = 34;
            this.label3.Text = "Ca";
            // 
            // Shift_cbb
            // 
            this.Shift_cbb.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Shift_cbb.FormattingEnabled = true;
            this.Shift_cbb.Items.AddRange(new object[] {
            "None",
            "Ca sáng",
            "Ca tối"});
            this.Shift_cbb.Location = new System.Drawing.Point(73, 206);
            this.Shift_cbb.Name = "Shift_cbb";
            this.Shift_cbb.Size = new System.Drawing.Size(151, 31);
            this.Shift_cbb.TabIndex = 35;
            this.Shift_cbb.Text = "None";
            this.Shift_cbb.SelectedValueChanged += new System.EventHandler(this.Shift_cbb_SelectedValueChanged);
            this.Shift_cbb.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Shift_cbb_KeyDown);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(249, 209);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(55, 23);
            this.label4.TabIndex = 36;
            this.label4.Text = "Chọn";
            // 
            // label5
            // 
            this.label5.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Times New Roman", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(552, 35);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(210, 36);
            this.label5.TabIndex = 37;
            this.label5.Text = "DOANH THU";
            // 
            // Choose_cbb
            // 
            this.Choose_cbb.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Choose_cbb.FormattingEnabled = true;
            this.Choose_cbb.Items.AddRange(new object[] {
            "Ngày",
            "Tháng",
            "Năm"});
            this.Choose_cbb.Location = new System.Drawing.Point(310, 206);
            this.Choose_cbb.Name = "Choose_cbb";
            this.Choose_cbb.Size = new System.Drawing.Size(151, 31);
            this.Choose_cbb.TabIndex = 38;
            this.Choose_cbb.Text = "Ngày";
            this.Choose_cbb.SelectedValueChanged += new System.EventHandler(this.Choose_cbb_SelectedValueChanged);
            this.Choose_cbb.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Choose_cbb_KeyDown);
            // 
            // label6
            // 
            this.label6.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(829, 206);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(140, 23);
            this.label6.TabIndex = 39;
            this.label6.Text = "Tổng doanh thu";
            // 
            // Total_txt
            // 
            this.Total_txt.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.Total_txt.BackColor = System.Drawing.Color.White;
            this.Total_txt.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Total_txt.ForeColor = System.Drawing.Color.Red;
            this.Total_txt.Location = new System.Drawing.Point(975, 203);
            this.Total_txt.Name = "Total_txt";
            this.Total_txt.ReadOnly = true;
            this.Total_txt.Size = new System.Drawing.Size(199, 32);
            this.Total_txt.TabIndex = 40;
            // 
            // Value2_date
            // 
            this.Value2_date.CustomFormat = "dd/MM/yyyy";
            this.Value2_date.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Value2_date.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.Value2_date.Location = new System.Drawing.Point(310, 145);
            this.Value2_date.Name = "Value2_date";
            this.Value2_date.Size = new System.Drawing.Size(151, 32);
            this.Value2_date.TabIndex = 153;
            this.Value2_date.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Value2_date_KeyDown);
            // 
            // Staff_cbb
            // 
            this.Staff_cbb.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Staff_cbb.FormattingEnabled = true;
            this.Staff_cbb.Items.AddRange(new object[] {
            "None",
            "Ngày",
            "Tuần",
            "Tháng",
            "Năm"});
            this.Staff_cbb.Location = new System.Drawing.Point(592, 146);
            this.Staff_cbb.Name = "Staff_cbb";
            this.Staff_cbb.Size = new System.Drawing.Size(234, 31);
            this.Staff_cbb.TabIndex = 155;
            this.Staff_cbb.Text = "Tất cả";
            this.Staff_cbb.SelectedValueChanged += new System.EventHandler(this.Staff_cbb_SelectedValueChanged);
            this.Staff_cbb.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Staff_cbb_KeyDown);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(492, 149);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(94, 23);
            this.label7.TabIndex = 154;
            this.label7.Text = "Nhân viên";
            // 
            // Find_btn
            // 
            this.Find_btn.Animated = true;
            this.Find_btn.AutoRoundedCorners = true;
            this.Find_btn.BorderRadius = 21;
            this.Find_btn.BorderThickness = 1;
            this.Find_btn.CheckedState.Parent = this.Find_btn;
            this.Find_btn.CustomImages.Parent = this.Find_btn;
            this.Find_btn.FillColor = System.Drawing.Color.White;
            this.Find_btn.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.Find_btn.ForeColor = System.Drawing.Color.White;
            this.Find_btn.HoverState.Parent = this.Find_btn;
            this.Find_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.research;
            this.Find_btn.ImageSize = new System.Drawing.Size(30, 30);
            this.Find_btn.Location = new System.Drawing.Point(715, 200);
            this.Find_btn.Name = "Find_btn";
            this.Find_btn.ShadowDecoration.Parent = this.Find_btn;
            this.Find_btn.Size = new System.Drawing.Size(44, 44);
            this.Find_btn.TabIndex = 158;
            this.Find_btn.Click += new System.EventHandler(this.Find_btn_Click);
            // 
            // Pdf_btn
            // 
            this.Pdf_btn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.Pdf_btn.Animated = true;
            this.Pdf_btn.CheckedState.Parent = this.Pdf_btn;
            this.Pdf_btn.CustomImages.Parent = this.Pdf_btn;
            this.Pdf_btn.FillColor = System.Drawing.Color.White;
            this.Pdf_btn.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.Pdf_btn.ForeColor = System.Drawing.Color.White;
            this.Pdf_btn.HoverState.Parent = this.Pdf_btn;
            this.Pdf_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.pdf;
            this.Pdf_btn.ImageSize = new System.Drawing.Size(30, 30);
            this.Pdf_btn.Location = new System.Drawing.Point(1067, 555);
            this.Pdf_btn.Name = "Pdf_btn";
            this.Pdf_btn.ShadowDecoration.Parent = this.Pdf_btn;
            this.Pdf_btn.Size = new System.Drawing.Size(44, 44);
            this.Pdf_btn.TabIndex = 157;
            this.Pdf_btn.Click += new System.EventHandler(this.Pdf_btn_Click);
            // 
            // Excel_btn
            // 
            this.Excel_btn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.Excel_btn.Animated = true;
            this.Excel_btn.CheckedState.Parent = this.Excel_btn;
            this.Excel_btn.CustomImages.Parent = this.Excel_btn;
            this.Excel_btn.FillColor = System.Drawing.Color.White;
            this.Excel_btn.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.Excel_btn.ForeColor = System.Drawing.Color.White;
            this.Excel_btn.HoverState.Parent = this.Excel_btn;
            this.Excel_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.excel;
            this.Excel_btn.ImageSize = new System.Drawing.Size(30, 30);
            this.Excel_btn.Location = new System.Drawing.Point(1130, 555);
            this.Excel_btn.Name = "Excel_btn";
            this.Excel_btn.ShadowDecoration.Parent = this.Excel_btn;
            this.Excel_btn.Size = new System.Drawing.Size(44, 44);
            this.Excel_btn.TabIndex = 156;
            this.Excel_btn.Click += new System.EventHandler(this.Excel_btn_Click);
            // 
            // pictureBox2
            // 
            this.pictureBox2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.pictureBox2.Image = global::GUI_QuanLyCafe.Properties.Resources._1200px_Highlands_Coffee_logo_svg;
            this.pictureBox2.Location = new System.Drawing.Point(5, 5);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(172, 119);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 152;
            this.pictureBox2.TabStop = false;
            // 
            // Value1_cbb
            // 
            this.Value1_cbb.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Value1_cbb.FormattingEnabled = true;
            this.Value1_cbb.Location = new System.Drawing.Point(469, 206);
            this.Value1_cbb.Name = "Value1_cbb";
            this.Value1_cbb.Size = new System.Drawing.Size(65, 31);
            this.Value1_cbb.TabIndex = 159;
            this.Value1_cbb.Visible = false;
            this.Value1_cbb.SelectedValueChanged += new System.EventHandler(this.Value_cbb_SelectedValueChanged);
            this.Value1_cbb.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Value_cbb_KeyDown);
            // 
            // Value2_cbb
            // 
            this.Value2_cbb.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Value2_cbb.FormattingEnabled = true;
            this.Value2_cbb.Location = new System.Drawing.Point(540, 206);
            this.Value2_cbb.Name = "Value2_cbb";
            this.Value2_cbb.Size = new System.Drawing.Size(151, 31);
            this.Value2_cbb.TabIndex = 160;
            this.Value2_cbb.Visible = false;
            this.Value2_cbb.SelectedValueChanged += new System.EventHandler(this.Value2_cbb_SelectedValueChanged);
            this.Value2_cbb.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Value2_cbb_KeyDown);
            // 
            // Statistic_frm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(1209, 611);
            this.Controls.Add(this.Value2_cbb);
            this.Controls.Add(this.Value1_cbb);
            this.Controls.Add(this.Find_btn);
            this.Controls.Add(this.Pdf_btn);
            this.Controls.Add(this.Excel_btn);
            this.Controls.Add(this.Staff_cbb);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.Value2_date);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.Total_txt);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.Choose_cbb);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.Shift_cbb);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.Value1_date);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Statistic_dgv);
            this.MinimumSize = new System.Drawing.Size(1225, 650);
            this.Name = "Statistic_frm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Thống kê";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.Statistic_frm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Statistic_dgv)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.DataGridView Statistic_dgv;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DateTimePicker Value1_date;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox Shift_cbb;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox Choose_cbb;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox Total_txt;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.DateTimePicker Value2_date;
        private System.Windows.Forms.ComboBox Staff_cbb;
        private System.Windows.Forms.Label label7;
        private Guna.UI2.WinForms.Guna2Button Excel_btn;
        private Guna.UI2.WinForms.Guna2Button Pdf_btn;
        private Guna.UI2.WinForms.Guna2Button Find_btn;
        private System.Windows.Forms.ComboBox Value1_cbb;
        private System.Windows.Forms.ComboBox Value2_cbb;
    }
}