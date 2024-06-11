using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Resources;
using System.Security.Cryptography;
using KaraokeICOOL;
using KaraokeICOOL.Resources;


namespace KaraokeICOOL

{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();

            lb_CurrentUserName.Text = "Van Anh";

            showFrm(new frmThongKe());
        }
        public void closeForm()
        {
            foreach (Form frm in this.MdiChildren)
            {
                frm.Close();
            }

        }
        public void showFrm(Form frm)
        {
            this.IsMdiContainer = true;
            frm.MdiParent = this;
            frm.Dock = DockStyle.Fill;
            frm.TopLevel = false;
            frm.Show();
        }
        
        private void sbtn_DangXuat_Click(object sender, EventArgs e)
        {
            //NguoiDungHienTai.CurentUser.nguoiDung = new NguoiDung();
            //frmDangNhap frm = new frmDangNhap();
            //frm.Show();
            //this.Hide();
        }

        private void sbtn_ThanhToanHD_Click(object sender, EventArgs e)
        {
            closeForm();
            showFrm(new frmThanhToan());
        }

        private void sbtn_HDDV_Click(object sender, EventArgs e)
        {
            closeForm();
            showFrm(new frmHDDV());
        }

		private void sbtn_PhieuDat_Click(object sender, EventArgs e)
		{
            closeForm();
            showFrm(new frmPhieuDat());
		}

        private void sbtn_Dashboard_Click(object sender, EventArgs e)
        {
            closeForm();
            showFrm(new frmThongKe());
        }

        private void frmMain_Load(object sender, EventArgs e)
        {

        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            closeForm();
            showFrm(new frmThanhToan());
        }
    }
}
