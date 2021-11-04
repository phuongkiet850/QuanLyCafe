
namespace GUI_QuanLyCafe
{
    partial class Staff_frm
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
            this.Log_MenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.Edit_ckb = new System.Windows.Forms.CheckBox();
            this.Email_lbl = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.Log_Menu = new System.Windows.Forms.MenuStrip();
            this.TinhTrang_txt = new System.Windows.Forms.TextBox();
            this.FindBy_cbb = new System.Windows.Forms.ComboBox();
            this.label11 = new System.Windows.Forms.Label();
            this.DanhSachNhanVien_dgv = new System.Windows.Forms.DataGridView();
            this.PathHinh_txt = new System.Windows.Forms.TextBox();
            this.NgaySinh_date = new System.Windows.Forms.DateTimePicker();
            this.NgaySinh_lbl = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.Add_btn = new System.Windows.Forms.Button();
            this.Delete_btn = new System.Windows.Forms.Button();
            this.Edit_btn = new System.Windows.Forms.Button();
            this.VaiTro_cbb = new System.Windows.Forms.ComboBox();
            this.GioiTinh_cbb = new System.Windows.Forms.ComboBox();
            this.DiaChi_txt = new System.Windows.Forms.TextBox();
            this.Email_txt = new System.Windows.Forms.TextBox();
            this.TimKiem_txt = new System.Windows.Forms.TextBox();
            this.HoTen_txt = new System.Windows.Forms.TextBox();
            this.SDT_txt = new System.Windows.Forms.TextBox();
            this.MaNV_txt = new System.Windows.Forms.TextBox();
            this.VaiTro_lbl = new System.Windows.Forms.Label();
            this.DiaChi_lbl = new System.Windows.Forms.Label();
            this.GioiTinh_lbl = new System.Windows.Forms.Label();
            this.SDT_lbl = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.HoTen_lbl = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.CreateID_btn = new System.Windows.Forms.Button();
            this.Hinh_ptb = new System.Windows.Forms.PictureBox();
            this.OpenFilePicture_btn = new System.Windows.Forms.Button();
            this.ResetFind_btn = new System.Windows.Forms.Button();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.Log_Menu.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DanhSachNhanVien_dgv)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Hinh_ptb)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.SuspendLayout();
            // 
            // Log_MenuItem
            // 
            this.Log_MenuItem.Image = global::GUI_QuanLyCafe.Properties.Resources.log_format;
            this.Log_MenuItem.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.Log_MenuItem.Name = "Log_MenuItem";
            this.Log_MenuItem.Size = new System.Drawing.Size(44, 36);
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
            // Email_lbl
            // 
            this.Email_lbl.AutoSize = true;
            this.Email_lbl.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Email_lbl.Location = new System.Drawing.Point(360, 236);
            this.Email_lbl.Name = "Email_lbl";
            this.Email_lbl.Size = new System.Drawing.Size(51, 21);
            this.Email_lbl.TabIndex = 146;
            this.Email_lbl.Text = "Email";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 20.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(338, 36);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(337, 31);
            this.label1.TabIndex = 144;
            this.label1.Text = "DANH SÁCH NHÂN VIÊN";
            // 
            // Log_Menu
            // 
            this.Log_Menu.BackColor = System.Drawing.Color.Transparent;
            this.Log_Menu.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.Log_MenuItem});
            this.Log_Menu.Location = new System.Drawing.Point(0, 0);
            this.Log_Menu.Name = "Log_Menu";
            this.Log_Menu.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.Log_Menu.Size = new System.Drawing.Size(955, 40);
            this.Log_Menu.TabIndex = 143;
            this.Log_Menu.Text = "menuStrip1";
            // 
            // TinhTrang_txt
            // 
            this.TinhTrang_txt.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.TinhTrang_txt.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.HistoryList;
            this.TinhTrang_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TinhTrang_txt.Location = new System.Drawing.Point(453, 183);
            this.TinhTrang_txt.Name = "TinhTrang_txt";
            this.TinhTrang_txt.ReadOnly = true;
            this.TinhTrang_txt.Size = new System.Drawing.Size(207, 29);
            this.TinhTrang_txt.TabIndex = 131;
            this.TinhTrang_txt.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
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
            "Vai trò",
            "Giới tính",
            "Email",
            "Số điện thoại",
            "Địa chỉ",
            "Ngày sinh"});
            this.FindBy_cbb.Location = new System.Drawing.Point(361, 424);
            this.FindBy_cbb.Name = "FindBy_cbb";
            this.FindBy_cbb.Size = new System.Drawing.Size(130, 29);
            this.FindBy_cbb.TabIndex = 141;
            this.FindBy_cbb.TabStop = false;
            this.FindBy_cbb.Text = "Tất cả";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(357, 186);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(88, 21);
            this.label11.TabIndex = 142;
            this.label11.Text = "Tình trạng";
            // 
            // DanhSachNhanVien_dgv
            // 
            this.DanhSachNhanVien_dgv.AllowUserToAddRows = false;
            this.DanhSachNhanVien_dgv.AllowUserToDeleteRows = false;
            this.DanhSachNhanVien_dgv.AllowUserToOrderColumns = true;
            this.DanhSachNhanVien_dgv.AllowUserToResizeColumns = false;
            this.DanhSachNhanVien_dgv.AllowUserToResizeRows = false;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DanhSachNhanVien_dgv.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            this.DanhSachNhanVien_dgv.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.DanhSachNhanVien_dgv.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.DanhSachNhanVien_dgv.ColumnHeadersHeight = 40;
            this.DanhSachNhanVien_dgv.EditMode = System.Windows.Forms.DataGridViewEditMode.EditProgrammatically;
            this.DanhSachNhanVien_dgv.Location = new System.Drawing.Point(19, 467);
            this.DanhSachNhanVien_dgv.Name = "DanhSachNhanVien_dgv";
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DanhSachNhanVien_dgv.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.DanhSachNhanVien_dgv.RowTemplate.DefaultCellStyle.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DanhSachNhanVien_dgv.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.DanhSachNhanVien_dgv.Size = new System.Drawing.Size(920, 293);
            this.DanhSachNhanVien_dgv.TabIndex = 129;
            this.DanhSachNhanVien_dgv.TabStop = false;
            // 
            // PathHinh_txt
            // 
            this.PathHinh_txt.Enabled = false;
            this.PathHinh_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.PathHinh_txt.Location = new System.Drawing.Point(563, 424);
            this.PathHinh_txt.Name = "PathHinh_txt";
            this.PathHinh_txt.ReadOnly = true;
            this.PathHinh_txt.Size = new System.Drawing.Size(50, 29);
            this.PathHinh_txt.TabIndex = 139;
            this.PathHinh_txt.TabStop = false;
            this.PathHinh_txt.Visible = false;
            // 
            // NgaySinh_date
            // 
            this.NgaySinh_date.CustomFormat = "dd/MM/yyyy";
            this.NgaySinh_date.Enabled = false;
            this.NgaySinh_date.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.NgaySinh_date.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.NgaySinh_date.Location = new System.Drawing.Point(453, 135);
            this.NgaySinh_date.Name = "NgaySinh_date";
            this.NgaySinh_date.Size = new System.Drawing.Size(206, 29);
            this.NgaySinh_date.TabIndex = 130;
            // 
            // NgaySinh_lbl
            // 
            this.NgaySinh_lbl.AutoSize = true;
            this.NgaySinh_lbl.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.NgaySinh_lbl.Location = new System.Drawing.Point(360, 141);
            this.NgaySinh_lbl.Name = "NgaySinh_lbl";
            this.NgaySinh_lbl.Size = new System.Drawing.Size(84, 21);
            this.NgaySinh_lbl.TabIndex = 137;
            this.NgaySinh_lbl.Text = "Ngày sinh";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.Edit_ckb);
            this.groupBox1.Controls.Add(this.Add_btn);
            this.groupBox1.Controls.Add(this.Delete_btn);
            this.groupBox1.Controls.Add(this.Edit_btn);
            this.groupBox1.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(17, 324);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(331, 82);
            this.groupBox1.TabIndex = 136;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Chỉnh sửa";
            // 
            // Add_btn
            // 
            this.Add_btn.Enabled = false;
            this.Add_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Add_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.add_icon1;
            this.Add_btn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.Add_btn.Location = new System.Drawing.Point(30, 33);
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
            this.Delete_btn.Location = new System.Drawing.Point(139, 33);
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
            this.Edit_btn.Location = new System.Drawing.Point(231, 33);
            this.Edit_btn.Name = "Edit_btn";
            this.Edit_btn.Size = new System.Drawing.Size(75, 32);
            this.Edit_btn.TabIndex = 9;
            this.Edit_btn.TabStop = false;
            this.Edit_btn.Text = "Sửa";
            this.Edit_btn.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.Edit_btn.UseVisualStyleBackColor = true;
            // 
            // VaiTro_cbb
            // 
            this.VaiTro_cbb.Enabled = false;
            this.VaiTro_cbb.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.VaiTro_cbb.FormattingEnabled = true;
            this.VaiTro_cbb.Items.AddRange(new object[] {
            "Nhân viên",
            "Quản trị viên"});
            this.VaiTro_cbb.Location = new System.Drawing.Point(226, 233);
            this.VaiTro_cbb.Name = "VaiTro_cbb";
            this.VaiTro_cbb.Size = new System.Drawing.Size(123, 29);
            this.VaiTro_cbb.TabIndex = 126;
            // 
            // GioiTinh_cbb
            // 
            this.GioiTinh_cbb.AutoCompleteCustomSource.AddRange(new string[] {
            "Nam\t",
            "Nữ ",
            "Khác"});
            this.GioiTinh_cbb.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.CustomSource;
            this.GioiTinh_cbb.Enabled = false;
            this.GioiTinh_cbb.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GioiTinh_cbb.FormattingEnabled = true;
            this.GioiTinh_cbb.Items.AddRange(new object[] {
            "Nam",
            "Nữ",
            "Khác"});
            this.GioiTinh_cbb.Location = new System.Drawing.Point(93, 233);
            this.GioiTinh_cbb.Name = "GioiTinh_cbb";
            this.GioiTinh_cbb.Size = new System.Drawing.Size(67, 29);
            this.GioiTinh_cbb.TabIndex = 125;
            // 
            // DiaChi_txt
            // 
            this.DiaChi_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DiaChi_txt.Location = new System.Drawing.Point(361, 324);
            this.DiaChi_txt.Multiline = true;
            this.DiaChi_txt.Name = "DiaChi_txt";
            this.DiaChi_txt.ReadOnly = true;
            this.DiaChi_txt.Size = new System.Drawing.Size(298, 82);
            this.DiaChi_txt.TabIndex = 133;
            // 
            // Email_txt
            // 
            this.Email_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Email_txt.Location = new System.Drawing.Point(417, 233);
            this.Email_txt.Name = "Email_txt";
            this.Email_txt.ReadOnly = true;
            this.Email_txt.Size = new System.Drawing.Size(242, 29);
            this.Email_txt.TabIndex = 132;
            // 
            // TimKiem_txt
            // 
            this.TimKiem_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TimKiem_txt.Location = new System.Drawing.Point(96, 424);
            this.TimKiem_txt.Name = "TimKiem_txt";
            this.TimKiem_txt.Size = new System.Drawing.Size(252, 29);
            this.TimKiem_txt.TabIndex = 134;
            this.TimKiem_txt.TabStop = false;
            // 
            // HoTen_txt
            // 
            this.HoTen_txt.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.HoTen_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.HoTen_txt.Location = new System.Drawing.Point(93, 183);
            this.HoTen_txt.Name = "HoTen_txt";
            this.HoTen_txt.ReadOnly = true;
            this.HoTen_txt.Size = new System.Drawing.Size(255, 29);
            this.HoTen_txt.TabIndex = 124;
            // 
            // SDT_txt
            // 
            this.SDT_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.SDT_txt.Location = new System.Drawing.Point(126, 283);
            this.SDT_txt.Name = "SDT_txt";
            this.SDT_txt.ReadOnly = true;
            this.SDT_txt.Size = new System.Drawing.Size(222, 29);
            this.SDT_txt.TabIndex = 128;
            // 
            // MaNV_txt
            // 
            this.MaNV_txt.CausesValidation = false;
            this.MaNV_txt.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MaNV_txt.Location = new System.Drawing.Point(93, 135);
            this.MaNV_txt.Name = "MaNV_txt";
            this.MaNV_txt.ReadOnly = true;
            this.MaNV_txt.Size = new System.Drawing.Size(211, 29);
            this.MaNV_txt.TabIndex = 122;
            // 
            // VaiTro_lbl
            // 
            this.VaiTro_lbl.AutoSize = true;
            this.VaiTro_lbl.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.VaiTro_lbl.Location = new System.Drawing.Point(167, 239);
            this.VaiTro_lbl.Name = "VaiTro_lbl";
            this.VaiTro_lbl.Size = new System.Drawing.Size(59, 21);
            this.VaiTro_lbl.TabIndex = 121;
            this.VaiTro_lbl.Text = "Vai trò";
            // 
            // DiaChi_lbl
            // 
            this.DiaChi_lbl.AutoSize = true;
            this.DiaChi_lbl.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DiaChi_lbl.Location = new System.Drawing.Point(360, 286);
            this.DiaChi_lbl.Name = "DiaChi_lbl";
            this.DiaChi_lbl.Size = new System.Drawing.Size(65, 21);
            this.DiaChi_lbl.TabIndex = 120;
            this.DiaChi_lbl.Text = "Địa chỉ";
            // 
            // GioiTinh_lbl
            // 
            this.GioiTinh_lbl.AutoSize = true;
            this.GioiTinh_lbl.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GioiTinh_lbl.Location = new System.Drawing.Point(15, 236);
            this.GioiTinh_lbl.Name = "GioiTinh_lbl";
            this.GioiTinh_lbl.Size = new System.Drawing.Size(76, 21);
            this.GioiTinh_lbl.TabIndex = 119;
            this.GioiTinh_lbl.Text = "Giới tính";
            // 
            // SDT_lbl
            // 
            this.SDT_lbl.AutoSize = true;
            this.SDT_lbl.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.SDT_lbl.Location = new System.Drawing.Point(15, 286);
            this.SDT_lbl.Name = "SDT_lbl";
            this.SDT_lbl.Size = new System.Drawing.Size(108, 21);
            this.SDT_lbl.TabIndex = 118;
            this.SDT_lbl.Text = "Số điện thoại";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(13, 427);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(82, 21);
            this.label9.TabIndex = 117;
            this.label9.Text = "Tìm kiếm";
            // 
            // HoTen_lbl
            // 
            this.HoTen_lbl.AutoSize = true;
            this.HoTen_lbl.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.HoTen_lbl.Location = new System.Drawing.Point(12, 186);
            this.HoTen_lbl.Name = "HoTen_lbl";
            this.HoTen_lbl.Size = new System.Drawing.Size(60, 21);
            this.HoTen_lbl.TabIndex = 116;
            this.HoTen_lbl.Text = "Họ tên";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(15, 138);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(57, 21);
            this.label2.TabIndex = 123;
            this.label2.Text = "Mã số";
            // 
            // CreateID_btn
            // 
            this.CreateID_btn.BackColor = System.Drawing.Color.Transparent;
            this.CreateID_btn.Enabled = false;
            this.CreateID_btn.FlatAppearance.BorderSize = 0;
            this.CreateID_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.CreateID_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.id;
            this.CreateID_btn.Location = new System.Drawing.Point(310, 133);
            this.CreateID_btn.Name = "CreateID_btn";
            this.CreateID_btn.Size = new System.Drawing.Size(38, 32);
            this.CreateID_btn.TabIndex = 140;
            this.CreateID_btn.TabStop = false;
            this.CreateID_btn.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.CreateID_btn.UseVisualStyleBackColor = false;
            // 
            // Hinh_ptb
            // 
            this.Hinh_ptb.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.Hinh_ptb.Location = new System.Drawing.Point(674, 135);
            this.Hinh_ptb.Name = "Hinh_ptb";
            this.Hinh_ptb.Size = new System.Drawing.Size(265, 321);
            this.Hinh_ptb.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.Hinh_ptb.TabIndex = 138;
            this.Hinh_ptb.TabStop = false;
            // 
            // OpenFilePicture_btn
            // 
            this.OpenFilePicture_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.OpenFilePicture_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.folder1;
            this.OpenFilePicture_btn.Location = new System.Drawing.Point(619, 421);
            this.OpenFilePicture_btn.Name = "OpenFilePicture_btn";
            this.OpenFilePicture_btn.Size = new System.Drawing.Size(39, 32);
            this.OpenFilePicture_btn.TabIndex = 127;
            this.OpenFilePicture_btn.TabStop = false;
            this.OpenFilePicture_btn.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.OpenFilePicture_btn.UseVisualStyleBackColor = true;
            this.OpenFilePicture_btn.Visible = false;
            // 
            // ResetFind_btn
            // 
            this.ResetFind_btn.FlatAppearance.BorderSize = 0;
            this.ResetFind_btn.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ResetFind_btn.Image = global::GUI_QuanLyCafe.Properties.Resources.Refreshicon;
            this.ResetFind_btn.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.ResetFind_btn.Location = new System.Drawing.Point(497, 421);
            this.ResetFind_btn.Name = "ResetFind_btn";
            this.ResetFind_btn.Size = new System.Drawing.Size(32, 32);
            this.ResetFind_btn.TabIndex = 135;
            this.ResetFind_btn.TabStop = false;
            this.ResetFind_btn.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.ResetFind_btn.UseVisualStyleBackColor = true;
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
            // Staff_frm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(955, 765);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.Email_lbl);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Log_Menu);
            this.Controls.Add(this.TinhTrang_txt);
            this.Controls.Add(this.FindBy_cbb);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.DanhSachNhanVien_dgv);
            this.Controls.Add(this.CreateID_btn);
            this.Controls.Add(this.PathHinh_txt);
            this.Controls.Add(this.Hinh_ptb);
            this.Controls.Add(this.NgaySinh_date);
            this.Controls.Add(this.NgaySinh_lbl);
            this.Controls.Add(this.OpenFilePicture_btn);
            this.Controls.Add(this.ResetFind_btn);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.VaiTro_cbb);
            this.Controls.Add(this.GioiTinh_cbb);
            this.Controls.Add(this.DiaChi_txt);
            this.Controls.Add(this.Email_txt);
            this.Controls.Add(this.TimKiem_txt);
            this.Controls.Add(this.HoTen_txt);
            this.Controls.Add(this.SDT_txt);
            this.Controls.Add(this.MaNV_txt);
            this.Controls.Add(this.VaiTro_lbl);
            this.Controls.Add(this.DiaChi_lbl);
            this.Controls.Add(this.GioiTinh_lbl);
            this.Controls.Add(this.SDT_lbl);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.HoTen_lbl);
            this.Controls.Add(this.label2);
            this.Name = "Staff_frm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Quản lý nhân viên";
            this.Log_Menu.ResumeLayout(false);
            this.Log_Menu.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.DanhSachNhanVien_dgv)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Hinh_ptb)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ToolStripMenuItem Log_MenuItem;
        private System.Windows.Forms.CheckBox Edit_ckb;
        private System.Windows.Forms.Button Add_btn;
        private System.Windows.Forms.Label Email_lbl;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.MenuStrip Log_Menu;
        private System.Windows.Forms.TextBox TinhTrang_txt;
        private System.Windows.Forms.ComboBox FindBy_cbb;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.DataGridView DanhSachNhanVien_dgv;
        private System.Windows.Forms.Button CreateID_btn;
        private System.Windows.Forms.TextBox PathHinh_txt;
        private System.Windows.Forms.PictureBox Hinh_ptb;
        private System.Windows.Forms.DateTimePicker NgaySinh_date;
        private System.Windows.Forms.Label NgaySinh_lbl;
        private System.Windows.Forms.Button OpenFilePicture_btn;
        private System.Windows.Forms.Button ResetFind_btn;
        private System.Windows.Forms.Button Delete_btn;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button Edit_btn;
        private System.Windows.Forms.ComboBox VaiTro_cbb;
        private System.Windows.Forms.ComboBox GioiTinh_cbb;
        private System.Windows.Forms.TextBox DiaChi_txt;
        private System.Windows.Forms.TextBox Email_txt;
        private System.Windows.Forms.TextBox TimKiem_txt;
        private System.Windows.Forms.TextBox HoTen_txt;
        private System.Windows.Forms.TextBox SDT_txt;
        private System.Windows.Forms.TextBox MaNV_txt;
        private System.Windows.Forms.Label VaiTro_lbl;
        private System.Windows.Forms.Label DiaChi_lbl;
        private System.Windows.Forms.Label GioiTinh_lbl;
        private System.Windows.Forms.Label SDT_lbl;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label HoTen_lbl;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.PictureBox pictureBox2;
    }
}