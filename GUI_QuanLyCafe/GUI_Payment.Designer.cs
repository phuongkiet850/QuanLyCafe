
namespace GUI_QuanLyCafe
{
    partial class Payment_frm
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
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.panel1 = new System.Windows.Forms.Panel();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.label4 = new System.Windows.Forms.Label();
            this.NameStafff_lbl = new System.Windows.Forms.Label();
            this.CheckIn_lbl = new System.Windows.Forms.Label();
            this.NameTable_lbl = new System.Windows.Forms.Label();
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.label2 = new System.Windows.Forms.Label();
            this.Bill_lv = new System.Windows.Forms.ListView();
            this.panel2 = new System.Windows.Forms.Panel();
            this.button1 = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.Voucher_lbl = new System.Windows.Forms.Label();
            this.TotalOrder_lbl = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.Total_lbl = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // columnHeader3
            // 
            this.columnHeader3.Text = "Đơn giá";
            this.columnHeader3.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader3.Width = 124;
            // 
            // columnHeader1
            // 
            this.columnHeader1.Text = "Tên món";
            this.columnHeader1.Width = 190;
            // 
            // columnHeader4
            // 
            this.columnHeader4.Text = "Thành tiền";
            this.columnHeader4.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader4.Width = 139;
            // 
            // panel1
            // 
            this.panel1.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.pictureBox2);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.NameStafff_lbl);
            this.panel1.Controls.Add(this.CheckIn_lbl);
            this.panel1.Controls.Add(this.NameTable_lbl);
            this.panel1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel1.Location = new System.Drawing.Point(11, 63);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(553, 153);
            this.panel1.TabIndex = 167;
            // 
            // pictureBox2
            // 
            this.pictureBox2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.pictureBox2.Image = global::GUI_QuanLyCafe.Properties.Resources._1200px_Highlands_Coffee_logo_svg;
            this.pictureBox2.Location = new System.Drawing.Point(375, 13);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(172, 119);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 153;
            this.pictureBox2.TabStop = false;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(1, 82);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(66, 21);
            this.label4.TabIndex = 152;
            this.label4.Text = "Giờ ra :";
            // 
            // NameStafff_lbl
            // 
            this.NameStafff_lbl.AutoSize = true;
            this.NameStafff_lbl.Location = new System.Drawing.Point(1, 118);
            this.NameStafff_lbl.Name = "NameStafff_lbl";
            this.NameStafff_lbl.Size = new System.Drawing.Size(89, 21);
            this.NameStafff_lbl.TabIndex = 2;
            this.NameStafff_lbl.Text = "Thu ngân :";
            // 
            // CheckIn_lbl
            // 
            this.CheckIn_lbl.AutoSize = true;
            this.CheckIn_lbl.Location = new System.Drawing.Point(1, 49);
            this.CheckIn_lbl.Name = "CheckIn_lbl";
            this.CheckIn_lbl.Size = new System.Drawing.Size(79, 21);
            this.CheckIn_lbl.TabIndex = 1;
            this.CheckIn_lbl.Text = "Giờ vào :";
            // 
            // NameTable_lbl
            // 
            this.NameTable_lbl.AutoSize = true;
            this.NameTable_lbl.Location = new System.Drawing.Point(1, 13);
            this.NameTable_lbl.Name = "NameTable_lbl";
            this.NameTable_lbl.Size = new System.Drawing.Size(48, 21);
            this.NameTable_lbl.TabIndex = 0;
            this.NameTable_lbl.Text = "Tên :";
            // 
            // columnHeader2
            // 
            this.columnHeader2.Text = "Số lượng";
            this.columnHeader2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.columnHeader2.Width = 100;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(168, 19);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(198, 31);
            this.label2.TabIndex = 165;
            this.label2.Text = "THANH TOÁN";
            // 
            // Bill_lv
            // 
            this.Bill_lv.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)));
            this.Bill_lv.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Bill_lv.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader3,
            this.columnHeader4});
            this.Bill_lv.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Bill_lv.HideSelection = false;
            this.Bill_lv.Location = new System.Drawing.Point(11, 215);
            this.Bill_lv.Name = "Bill_lv";
            this.Bill_lv.Size = new System.Drawing.Size(553, 424);
            this.Bill_lv.TabIndex = 166;
            this.Bill_lv.UseCompatibleStateImageBehavior = false;
            this.Bill_lv.View = System.Windows.Forms.View.Details;
            // 
            // panel2
            // 
            this.panel2.Anchor = System.Windows.Forms.AnchorStyles.Bottom;
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel2.Controls.Add(this.button1);
            this.panel2.Controls.Add(this.label5);
            this.panel2.Controls.Add(this.comboBox2);
            this.panel2.Controls.Add(this.Voucher_lbl);
            this.panel2.Controls.Add(this.TotalOrder_lbl);
            this.panel2.Controls.Add(this.label3);
            this.panel2.Controls.Add(this.Total_lbl);
            this.panel2.Controls.Add(this.comboBox1);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel2.Location = new System.Drawing.Point(11, 638);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(553, 192);
            this.panel2.TabIndex = 169;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(425, 150);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(123, 34);
            this.button1.TabIndex = 20;
            this.button1.Text = "Thanh toán";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(147, 81);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(35, 21);
            this.label5.TabIndex = 19;
            this.label5.Text = "% :";
            // 
            // comboBox2
            // 
            this.comboBox2.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.comboBox2.FormattingEnabled = true;
            this.comboBox2.Location = new System.Drawing.Point(88, 76);
            this.comboBox2.Margin = new System.Windows.Forms.Padding(5);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(58, 31);
            this.comboBox2.TabIndex = 18;
            this.comboBox2.Text = "0";
            // 
            // Voucher_lbl
            // 
            this.Voucher_lbl.AutoSize = true;
            this.Voucher_lbl.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Voucher_lbl.ForeColor = System.Drawing.Color.Black;
            this.Voucher_lbl.Location = new System.Drawing.Point(1, 79);
            this.Voucher_lbl.Name = "Voucher_lbl";
            this.Voucher_lbl.Size = new System.Drawing.Size(86, 23);
            this.Voucher_lbl.TabIndex = 17;
            this.Voucher_lbl.Text = "Giảm giá";
            // 
            // TotalOrder_lbl
            // 
            this.TotalOrder_lbl.AutoSize = true;
            this.TotalOrder_lbl.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TotalOrder_lbl.ForeColor = System.Drawing.Color.Black;
            this.TotalOrder_lbl.Location = new System.Drawing.Point(1, 9);
            this.TotalOrder_lbl.Name = "TotalOrder_lbl";
            this.TotalOrder_lbl.Size = new System.Drawing.Size(141, 23);
            this.TotalOrder_lbl.TabIndex = 16;
            this.TotalOrder_lbl.Text = "Tổng hóa đơn : ";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Black;
            this.label3.Location = new System.Drawing.Point(1, 44);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(163, 23);
            this.label3.TabIndex = 15;
            this.label3.Text = "Thuế VAT (10%) :";
            // 
            // Total_lbl
            // 
            this.Total_lbl.AutoSize = true;
            this.Total_lbl.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Total_lbl.ForeColor = System.Drawing.Color.Red;
            this.Total_lbl.Location = new System.Drawing.Point(1, 155);
            this.Total_lbl.Name = "Total_lbl";
            this.Total_lbl.Size = new System.Drawing.Size(146, 23);
            this.Total_lbl.TabIndex = 14;
            this.Total_lbl.Text = "Số tiền phải trả :";
            // 
            // comboBox1
            // 
            this.comboBox1.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(215, 112);
            this.comboBox1.Margin = new System.Windows.Forms.Padding(5);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(190, 31);
            this.comboBox1.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(1, 115);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(206, 23);
            this.label1.TabIndex = 1;
            this.label1.Text = "Phương thức thanh toán";
            // 
            // Payment_frm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(10F, 21F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(576, 840);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.Bill_lv);
            this.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(5);
            this.Name = "Payment_frm";
            this.Text = "Thanh toán";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label NameStafff_lbl;
        private System.Windows.Forms.Label CheckIn_lbl;
        private System.Windows.Forms.Label NameTable_lbl;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ListView Bill_lv;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.ComboBox comboBox2;
        private System.Windows.Forms.Label Voucher_lbl;
        private System.Windows.Forms.Label TotalOrder_lbl;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label Total_lbl;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.PictureBox pictureBox2;
    }
}