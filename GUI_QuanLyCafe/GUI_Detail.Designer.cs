
namespace GUI_QuanLyCafe
{
    partial class Detail_frm
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
            this.Amount_nud = new System.Windows.Forms.NumericUpDown();
            this.label2 = new System.Windows.Forms.Label();
            this.Note_txt = new System.Windows.Forms.TextBox();
            this.Addd_btn = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.Name_txt = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.Amount_nud)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(23, 65);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(78, 21);
            this.label1.TabIndex = 0;
            this.label1.Text = "Số lượng";
            // 
            // Amount_nud
            // 
            this.Amount_nud.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Amount_nud.Location = new System.Drawing.Point(107, 63);
            this.Amount_nud.Name = "Amount_nud";
            this.Amount_nud.Size = new System.Drawing.Size(50, 29);
            this.Amount_nud.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(23, 113);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(69, 21);
            this.label2.TabIndex = 2;
            this.label2.Text = "Ghi chú";
            // 
            // Note_txt
            // 
            this.Note_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Note_txt.Location = new System.Drawing.Point(107, 113);
            this.Note_txt.Multiline = true;
            this.Note_txt.Name = "Note_txt";
            this.Note_txt.Size = new System.Drawing.Size(259, 110);
            this.Note_txt.TabIndex = 3;
            // 
            // Addd_btn
            // 
            this.Addd_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Addd_btn.Location = new System.Drawing.Point(276, 239);
            this.Addd_btn.Name = "Addd_btn";
            this.Addd_btn.Size = new System.Drawing.Size(90, 38);
            this.Addd_btn.TabIndex = 4;
            this.Addd_btn.Text = "Thêm";
            this.Addd_btn.UseVisualStyleBackColor = true;
            this.Addd_btn.Click += new System.EventHandler(this.Addd_btn_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(23, 18);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(39, 21);
            this.label3.TabIndex = 5;
            this.label3.Text = "Tên";
            // 
            // Name_txt
            // 
            this.Name_txt.Enabled = false;
            this.Name_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name_txt.Location = new System.Drawing.Point(107, 18);
            this.Name_txt.Name = "Name_txt";
            this.Name_txt.Size = new System.Drawing.Size(259, 29);
            this.Name_txt.TabIndex = 6;
            // 
            // Detail_frm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(393, 295);
            this.Controls.Add(this.Name_txt);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.Addd_btn);
            this.Controls.Add(this.Note_txt);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.Amount_nud);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Detail_frm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Detail";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Detail_frm_FormClosing);
            this.Load += new System.EventHandler(this.Detail_frm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Amount_nud)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown Amount_nud;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox Note_txt;
        private System.Windows.Forms.Button Addd_btn;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox Name_txt;
    }
}