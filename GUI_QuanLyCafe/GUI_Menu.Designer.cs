
namespace GUI_QuanLyCafe
{
    partial class Menu_frm
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle10 = new System.Windows.Forms.DataGridViewCellStyle();
            this.Delete_btn = new System.Windows.Forms.Button();
            this.Menu_tc = new System.Windows.Forms.TabControl();
            this.CF = new System.Windows.Forms.TabPage();
            this.Cafe_flp = new System.Windows.Forms.FlowLayoutPanel();
            this.FZ = new System.Windows.Forms.TabPage();
            this.Freeze_flp = new System.Windows.Forms.FlowLayoutPanel();
            this.TE = new System.Windows.Forms.TabPage();
            this.Tea_flp = new System.Windows.Forms.FlowLayoutPanel();
            this.FD = new System.Windows.Forms.TabPage();
            this.Food_flp = new System.Windows.Forms.FlowLayoutPanel();
            this.SD = new System.Windows.Forms.TabPage();
            this.SoftDrink_flp = new System.Windows.Forms.FlowLayoutPanel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.Name_lbl = new System.Windows.Forms.Label();
            this.Add_btn = new System.Windows.Forms.Button();
            this.ListOrder_dgv = new System.Windows.Forms.DataGridView();
            this.Menu_tc.SuspendLayout();
            this.CF.SuspendLayout();
            this.FZ.SuspendLayout();
            this.TE.SuspendLayout();
            this.FD.SuspendLayout();
            this.SD.SuspendLayout();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ListOrder_dgv)).BeginInit();
            this.SuspendLayout();
            // 
            // Delete_btn
            // 
            this.Delete_btn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.Delete_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Delete_btn.Location = new System.Drawing.Point(1312, 591);
            this.Delete_btn.Name = "Delete_btn";
            this.Delete_btn.Size = new System.Drawing.Size(141, 63);
            this.Delete_btn.TabIndex = 29;
            this.Delete_btn.Text = "Xóa món";
            this.Delete_btn.UseVisualStyleBackColor = true;
            // 
            // Menu_tc
            // 
            this.Menu_tc.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.Menu_tc.Controls.Add(this.CF);
            this.Menu_tc.Controls.Add(this.FZ);
            this.Menu_tc.Controls.Add(this.TE);
            this.Menu_tc.Controls.Add(this.FD);
            this.Menu_tc.Controls.Add(this.SD);
            this.Menu_tc.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Menu_tc.Location = new System.Drawing.Point(5, 3);
            this.Menu_tc.Name = "Menu_tc";
            this.Menu_tc.SelectedIndex = 0;
            this.Menu_tc.Size = new System.Drawing.Size(867, 646);
            this.Menu_tc.TabIndex = 26;
            this.Menu_tc.Selected += new System.Windows.Forms.TabControlEventHandler(this.Menu_tc_Selected);
            // 
            // CF
            // 
            this.CF.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.CF.Controls.Add(this.Cafe_flp);
            this.CF.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CF.Location = new System.Drawing.Point(4, 32);
            this.CF.Name = "CF";
            this.CF.Padding = new System.Windows.Forms.Padding(3);
            this.CF.Size = new System.Drawing.Size(859, 610);
            this.CF.TabIndex = 0;
            this.CF.Text = "Cafe";
            this.CF.UseVisualStyleBackColor = true;
            // 
            // Cafe_flp
            // 
            this.Cafe_flp.AutoScroll = true;
            this.Cafe_flp.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Cafe_flp.Location = new System.Drawing.Point(3, 3);
            this.Cafe_flp.Name = "Cafe_flp";
            this.Cafe_flp.Size = new System.Drawing.Size(853, 604);
            this.Cafe_flp.TabIndex = 1;
            // 
            // FZ
            // 
            this.FZ.Controls.Add(this.Freeze_flp);
            this.FZ.Location = new System.Drawing.Point(4, 32);
            this.FZ.Name = "FZ";
            this.FZ.Padding = new System.Windows.Forms.Padding(3);
            this.FZ.Size = new System.Drawing.Size(859, 610);
            this.FZ.TabIndex = 1;
            this.FZ.Text = "Đá xay";
            this.FZ.UseVisualStyleBackColor = true;
            // 
            // Freeze_flp
            // 
            this.Freeze_flp.AutoScroll = true;
            this.Freeze_flp.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Freeze_flp.Location = new System.Drawing.Point(3, 3);
            this.Freeze_flp.Name = "Freeze_flp";
            this.Freeze_flp.Size = new System.Drawing.Size(853, 604);
            this.Freeze_flp.TabIndex = 2;
            // 
            // TE
            // 
            this.TE.Controls.Add(this.Tea_flp);
            this.TE.Location = new System.Drawing.Point(4, 32);
            this.TE.Name = "TE";
            this.TE.Padding = new System.Windows.Forms.Padding(3);
            this.TE.Size = new System.Drawing.Size(859, 610);
            this.TE.TabIndex = 2;
            this.TE.Text = "Trà";
            this.TE.UseVisualStyleBackColor = true;
            // 
            // Tea_flp
            // 
            this.Tea_flp.AutoScroll = true;
            this.Tea_flp.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Tea_flp.Location = new System.Drawing.Point(3, 3);
            this.Tea_flp.Name = "Tea_flp";
            this.Tea_flp.Size = new System.Drawing.Size(853, 604);
            this.Tea_flp.TabIndex = 2;
            // 
            // FD
            // 
            this.FD.Controls.Add(this.Food_flp);
            this.FD.Location = new System.Drawing.Point(4, 32);
            this.FD.Name = "FD";
            this.FD.Padding = new System.Windows.Forms.Padding(3);
            this.FD.Size = new System.Drawing.Size(859, 610);
            this.FD.TabIndex = 3;
            this.FD.Text = "Đồ ăn";
            this.FD.UseVisualStyleBackColor = true;
            // 
            // Food_flp
            // 
            this.Food_flp.AutoScroll = true;
            this.Food_flp.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Food_flp.Location = new System.Drawing.Point(3, 3);
            this.Food_flp.Name = "Food_flp";
            this.Food_flp.Size = new System.Drawing.Size(853, 604);
            this.Food_flp.TabIndex = 2;
            // 
            // SD
            // 
            this.SD.Controls.Add(this.SoftDrink_flp);
            this.SD.Location = new System.Drawing.Point(4, 32);
            this.SD.Name = "SD";
            this.SD.Padding = new System.Windows.Forms.Padding(3);
            this.SD.Size = new System.Drawing.Size(859, 610);
            this.SD.TabIndex = 4;
            this.SD.Text = "Nước giải khát";
            this.SD.UseVisualStyleBackColor = true;
            // 
            // SoftDrink_flp
            // 
            this.SoftDrink_flp.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.SoftDrink_flp.AutoScroll = true;
            this.SoftDrink_flp.Location = new System.Drawing.Point(3, 3);
            this.SoftDrink_flp.Name = "SoftDrink_flp";
            this.SoftDrink_flp.Size = new System.Drawing.Size(858, 600);
            this.SoftDrink_flp.TabIndex = 5;
            // 
            // panel1
            // 
            this.panel1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.pictureBox2);
            this.panel1.Controls.Add(this.Name_lbl);
            this.panel1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.panel1.Location = new System.Drawing.Point(878, 38);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(575, 128);
            this.panel1.TabIndex = 27;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(18, 17);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(173, 24);
            this.label1.TabIndex = 152;
            this.label1.Text = "HighLands Coffee";
            // 
            // pictureBox2
            // 
            this.pictureBox2.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.pictureBox2.Image = global::GUI_QuanLyCafe.Properties.Resources._1200px_Highlands_Coffee_logo_svg;
            this.pictureBox2.Location = new System.Drawing.Point(385, 5);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(187, 115);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 151;
            this.pictureBox2.TabStop = false;
            // 
            // Name_lbl
            // 
            this.Name_lbl.AutoSize = true;
            this.Name_lbl.Location = new System.Drawing.Point(18, 74);
            this.Name_lbl.Name = "Name_lbl";
            this.Name_lbl.Size = new System.Drawing.Size(48, 21);
            this.Name_lbl.TabIndex = 0;
            this.Name_lbl.Text = "Tên :";
            // 
            // Add_btn
            // 
            this.Add_btn.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.Add_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Add_btn.Location = new System.Drawing.Point(1163, 591);
            this.Add_btn.Name = "Add_btn";
            this.Add_btn.Size = new System.Drawing.Size(141, 63);
            this.Add_btn.TabIndex = 30;
            this.Add_btn.Text = "Thêm món";
            this.Add_btn.UseVisualStyleBackColor = true;
            // 
            // ListOrder_dgv
            // 
            this.ListOrder_dgv.AllowUserToResizeColumns = false;
            this.ListOrder_dgv.AllowUserToResizeRows = false;
            dataGridViewCellStyle6.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ListOrder_dgv.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle6;
            this.ListOrder_dgv.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ListOrder_dgv.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.ListOrder_dgv.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.ListOrder_dgv.BackgroundColor = System.Drawing.Color.White;
            this.ListOrder_dgv.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SunkenVertical;
            this.ListOrder_dgv.ClipboardCopyMode = System.Windows.Forms.DataGridViewClipboardCopyMode.Disable;
            this.ListOrder_dgv.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle7.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle7.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle7.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle7.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle7.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle7.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.ListOrder_dgv.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle7;
            this.ListOrder_dgv.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle8.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle8.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle8.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle8.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle8.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle8.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.ListOrder_dgv.DefaultCellStyle = dataGridViewCellStyle8;
            this.ListOrder_dgv.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.ListOrder_dgv.Location = new System.Drawing.Point(878, 165);
            this.ListOrder_dgv.MultiSelect = false;
            this.ListOrder_dgv.Name = "ListOrder_dgv";
            this.ListOrder_dgv.ReadOnly = true;
            this.ListOrder_dgv.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle9.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle9.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle9.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle9.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle9.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle9.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.ListOrder_dgv.RowHeadersDefaultCellStyle = dataGridViewCellStyle9;
            this.ListOrder_dgv.RowHeadersVisible = false;
            this.ListOrder_dgv.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.DisableResizing;
            dataGridViewCellStyle10.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ListOrder_dgv.RowsDefaultCellStyle = dataGridViewCellStyle10;
            this.ListOrder_dgv.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.ListOrder_dgv.ShowCellErrors = false;
            this.ListOrder_dgv.ShowCellToolTips = false;
            this.ListOrder_dgv.ShowEditingIcon = false;
            this.ListOrder_dgv.ShowRowErrors = false;
            this.ListOrder_dgv.Size = new System.Drawing.Size(575, 420);
            this.ListOrder_dgv.TabIndex = 28;
            // 
            // Menu_frm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(1458, 661);
            this.Controls.Add(this.Delete_btn);
            this.Controls.Add(this.Menu_tc);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.Add_btn);
            this.Controls.Add(this.ListOrder_dgv);
            this.MinimumSize = new System.Drawing.Size(1200, 700);
            this.Name = "Menu_frm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Menu";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Menu_frm_FormClosing);
            this.Load += new System.EventHandler(this.Menu_frm_Load);
            this.Menu_tc.ResumeLayout(false);
            this.CF.ResumeLayout(false);
            this.FZ.ResumeLayout(false);
            this.TE.ResumeLayout(false);
            this.FD.ResumeLayout(false);
            this.SD.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ListOrder_dgv)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button Delete_btn;
        private System.Windows.Forms.TabControl Menu_tc;
        private System.Windows.Forms.TabPage CF;
        private System.Windows.Forms.FlowLayoutPanel Cafe_flp;
        private System.Windows.Forms.TabPage FZ;
        private System.Windows.Forms.FlowLayoutPanel Freeze_flp;
        private System.Windows.Forms.TabPage TE;
        private System.Windows.Forms.FlowLayoutPanel Tea_flp;
        private System.Windows.Forms.TabPage FD;
        private System.Windows.Forms.FlowLayoutPanel Food_flp;
        private System.Windows.Forms.TabPage SD;
        private System.Windows.Forms.FlowLayoutPanel SoftDrink_flp;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label Name_lbl;
        private System.Windows.Forms.Button Add_btn;
        private System.Windows.Forms.DataGridView ListOrder_dgv;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Label label1;
    }
}