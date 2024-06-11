using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace KaraokeICOOL
{
    public partial class frmHDDV : Form
    {
        private BLL_HDDV bllHDDV;
        //private BLL_DichVu bllDichVu;
        KaraokeICOOLEntities db = new KaraokeICOOLEntities();
        public frmHDDV()
        {
            InitializeComponent();
            bllHDDV = new BLL_HDDV();
            LoadData();
            LoadDichVu();
            btnxoa.Enabled = false;
            
            btnThemCTHDV.Enabled = false;
            btnXoaCTHDDV.Enabled = false;
            btnUpdateCTHDDV.Enabled = false;

        }
        private void LoadData()
        {
            dgv_HDDV.DataSource = db.HDDichVus
                    .Select(hddv => new { hddv.MaHDDV, hddv.TongTien })
                    .ToList();
        }
        private void LoadDichVu()
        {
            var dv= db.DsDichVu();
            dgv_dichvu.DataSource = dv;
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            string search = txtTenDV.Text;
            var data = db.func_FindDichVu(search);
            dgv_dichvu.DataSource = data;
        }
        private void LoadChiTietHoaDonDV(int ma)
        {
            var ct = db.SHOW_DsCtHdDVTheoIdHd(ma);
            dgv_CTHDDV.DataSource = ct;
        }

        private void dgv_HDDV_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0 && e.RowIndex < dgv_HDDV.Rows.Count)
            {
                int maHD = Convert.ToInt32(dgv_HDDV.Rows[e.RowIndex].Cells[0].Value); // Chuyển đổi giá trị sang int
                txtmaHD.Text = maHD.ToString(); // Cập nhật mã hóa đơn
                txtmaCTHDDV.Text = dgv_HDDV.Rows[e.RowIndex].Cells[0].Value.ToString(); // Mã CTHDDV không thay đổi
                txtTongTien.Text = dgv_HDDV.Rows[e.RowIndex].Cells[1].Value.ToString(); // Cập nhật tổng tiền

                LoadChiTietHoaDonDV(maHD); // Tải chi tiết hóa đơn dịch vụ cho mã hóa đơn vừa chọn
            }btnxoa.Enabled = true;
            
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            bllHDDV.addHD();
            LoadData();
        }

        private void btnxoa_Click(object sender, EventArgs e)
        {
            int ma;
            if (int.TryParse(txtmaHD.Text, out ma))
                {
                if (int.Parse(txtTongTien.Text) == 0)
                {
                
                    bllHDDV.deleteHD(ma);
                    LoadData();
                }
                else
                {
                    MessageBox.Show("Hoá đơn dịch vụ vẫn còn chi tiết, không thể xoá");
                }
            }  
            else { MessageBox.Show("Chưa chọn hoá đơn dịch vụ cần xoá"); }

        }

        private void btnThemCTHDV_Click(object sender, EventArgs e)
        {
            int maHDDV = int.Parse(txtmaCTHDDV.Text);
            int maDV = int.Parse(txtmaDV.Text);
            int sl = (int)(num_sl.Value);
            if (string.IsNullOrEmpty(txtmaCTHDDV.Text) || string.IsNullOrEmpty(txtmaDV.Text))
            {
                MessageBox.Show("Chưa nhập đủ dữ liệu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtTenDV.Focus();
                return;
            }
            if (sl == 0)
            {
                MessageBox.Show("Số lượng phải lơn hơn 0!!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                AddCTHDDV(maHDDV, maDV, sl);
                LoadData();

            }LoadChiTietHoaDonDV(maHDDV);
        }
        private void AddCTHDDV(int maHDDV, int maDV, int sl)
        {
            bllHDDV.AddCTHDDV(maHDDV, maDV, sl);
            MessageBox.Show("Thêm thành công!");
        }

        private void dgv_CTHDDV_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                int index = e.RowIndex;
                txtmaCTHDDV.Text = dgv_CTHDDV.Rows[index].Cells[0].Value.ToString();
                txtmaDV.Text = dgv_CTHDDV.Rows[index].Cells[1].Value.ToString();
                txtTenDV.Text = dgv_CTHDDV.Rows[index].Cells[2].Value.ToString();
                num_sl.Value = int.Parse(dgv_CTHDDV.Rows[index].Cells[3].Value.ToString());
                txtdonGia.Text = dgv_CTHDDV.Rows[index].Cells[4].Value.ToString();

            }

            
            btnUpdateCTHDDV.Enabled = true;
            btnXoaCTHDDV.Enabled = true;
        }

        private void dgv_dichvu_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                int index = e.RowIndex;
                txtmaDV.Text = dgv_dichvu.Rows[index].Cells[0].Value.ToString();
                txtTenDV.Text = dgv_dichvu.Rows[index].Cells[1].Value.ToString();
                txtdonGia.Text = dgv_dichvu.Rows[index].Cells[2].Value.ToString();
            }
            num_sl.Value = 0;
            btnThemCTHDV.Enabled = true;
        }

        private void btnXoaCTHDDV_Click(object sender, EventArgs e)
        {
            int maHDDV = int.Parse(txtmaCTHDDV.Text);
            int maDV = int.Parse(txtmaDV.Text);
            if (string.IsNullOrEmpty(txtmaCTHDDV.Text) || string.IsNullOrEmpty(txtmaDV.Text))
            {
                MessageBox.Show("Chưa nhập đủ dữ liệu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            bllHDDV.DeleteCTHDDV(maHDDV, maDV);
            MessageBox.Show("Xoá thành công!");
            LoadData();
            LoadChiTietHoaDonDV(maHDDV);
        }

        private void btnUpdateCTHDDV_Click(object sender, EventArgs e)
        {
            int maHDDV = int.Parse(txtmaCTHDDV.Text);
            int maDV = int.Parse(txtmaDV.Text);
            int sl = (int)num_sl.Value;
            if (string.IsNullOrEmpty(txtmaCTHDDV.Text) || string.IsNullOrEmpty(txtmaDV.Text))
            {
                MessageBox.Show("Chưa nhập đủ dữ liệu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            bllHDDV.UpdateCTHDDV(maHDDV, maDV, sl);
            MessageBox.Show("Cập nhật thành công!");
            LoadData();
            LoadChiTietHoaDonDV(maHDDV);
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            txtmaHD.Text = string.Empty;
            txtTongTien.Text = string.Empty;
        }

        private void btnResetCTHDDV_Click(object sender, EventArgs e)
        {
            txtTenDV.Text = string.Empty;
            num_sl.Value =0;
            txtdonGia.Text = string.Empty;
            txtmaCTHDDV.Text = string.Empty;
            txtmaDV.Text = string.Empty;
        }
    }
}
