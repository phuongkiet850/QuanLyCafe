
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI_QuanLyCafe
{
    public partial class Detail_frm : Form
    {
        public Detail_frm()
        {
            InitializeComponent();
        }

        public static int Status;
        public static int Amount;
        public static string Note;
        private void Addd_btn_Click(object sender, EventArgs e)
        {
            Status = 1;
            Amount = Convert.ToInt32(Amount_nud.Value.ToString());
            Note = Note_txt.Text;
            this.Close();
        }

        private void Detail_frm_FormClosing(object sender, FormClosingEventArgs e)
        {
            Note_txt.Text = "";
            Amount_nud.Value = 0;
            e.Cancel = false;
        }

        private void Detail_frm_Load(object sender, EventArgs e)
        {
            Name_txt.Text = Menu_frm.NameItem;
        }
    }
}
