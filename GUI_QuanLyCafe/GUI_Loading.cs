using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI_QuanLyCafe
{
    public partial class Loading_frm : Form
    {
        public Loading_frm()
        {
            InitializeComponent();
        }
        public static int Status = 0;
        
        private void timer1_Tick(object sender, EventArgs e)
        {
            if (Status == 1)
            {
                this.Hide();
            }
        }

        private void Loading_frm_Load(object sender, EventArgs e)
        {
            Thread thread = new Thread(() =>
            {
                Login_frm Login = new Login_frm();
                Login.ShowDialog();
            });
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
            this.Focus();
        }

        private void Loading_frm_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true;
        }
    }
}
