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
    public partial class frmThanhToan : Form
    {
        private const decimal GiaTienGio = 45000m;
        private Timer timer;
        private int MANV = 1;
        public frmThanhToan()
        {
            InitializeComponent();
            InitializeTimer();
        }
        private void InitializeTimer()
        {
            timer = new Timer();
            timer.Interval = 1000;
            timer.Tick += Timer_Tick;
            timer.Start();
        }
        private void Timer_Tick(object sender, EventArgs e)
        {
            txtGioRa.Text = DateTime.Now.ToString("HH:mm:ss dd-MM-yyyy");
            txtNgayLap.Text = DateTime.Now.ToString("dd-MM-yyyy");
            txtTienGio.Text = TinhTienGio();

        }
        private void TinhTongTien()
        {
            int tienPhat = 0;
            int tienDichVu = 0;
            int tienGio = 0;

            if (int.TryParse(txtTienPhat.Text.Replace(",", ""), out int tienPhatParsed))
                tienPhat = tienPhatParsed;

            if (int.TryParse(txtTienDichVu.Text.Replace(",", ""), out int tienDichVuParsed))
                tienDichVu = tienDichVuParsed;

            if (int.TryParse(txtTienGio.Text.Replace(",", ""), out int tienGioParsed))
                tienGio = tienGioParsed;

            int tongTien = tienPhat + tienDichVu + tienGio;

            txtTongTien.Text = tongTien.ToString("N0");
        }
        private String TinhTienGio()
        {
            string format = "HH:mm:ss dd-MM-yyyy";

            if (DateTime.TryParseExact(txtGioVao.Text, format, null, System.Globalization.DateTimeStyles.None, out DateTime gioVao) &&
                DateTime.TryParseExact(txtGioRa.Text, format, null, System.Globalization.DateTimeStyles.None, out DateTime gioRa))
            {
                TimeSpan thoiGianSuDung = gioRa - gioVao;
                decimal tongTienGio = (decimal)thoiGianSuDung.TotalHours * GiaTienGio;
                TinhTongTien();
                return tongTienGio.ToString("N0");
            }
            else
            {
                TinhTongTien();
                return string.Empty;
            }
        }

        private void txtMaPD_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void txtMaPD_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Back || e.KeyCode == Keys.Delete)
            {
                e.SuppressKeyPress = false;
            }
        }
        BLL_HDDV bllHDDVInstance = new BLL_HDDV();
        private void txtMaPD_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtMaPD.Text))
            {
                if (int.TryParse(txtMaPD.Text, out int id))
                {
                    try
                    {
                        PhieuDat pd = BLL_PhieuDat.GetDetailById(id);
                        HoaDon hd = BLL_HoaDon.GetDetailByIdPhieuDat(id);
                        if (hd != null)
                        {
                            if (hd.MaHDDV != null)
                            {
                                int maHDDV = hd.MaHDDV ?? 0;
                                HDDichVu hddv = bllHDDVInstance.GetDetailById(maHDDV);
                                txtMaHDDV.Text = hddv.MaHDDV.ToString();
                                txtTTDV.Text = hddv.TongTien.ToString();
                                txtTienDichVu.Text = hddv.TongTien.ToString();

                                if (hddv != null && hddv.CTHDDVs != null)
                                {
                                    int index = 1;
                                    foreach (CTHDDV cthd in hddv.CTHDDVs)
                                    {
                                        ListViewItem item = new ListViewItem(index.ToString());
                                        item.SubItems.Add(cthd.DichVu.TenDV);
                                        item.SubItems.Add(cthd.DichVu.Gia.ToString());
                                        item.SubItems.Add(cthd.SoLuong.ToString());
                                        item.SubItems.Add((cthd.DichVu.Gia * cthd.SoLuong).ToString());
                                        lsvDV.Items.Add(item);
                                        index++;
                                    }
                                }
                            }
                        }

                        if (pd != null)
                        {
                            cboLoaiPhieu.SelectedText = pd.LoaiPhieu;
                            txtKH.Text = pd.HoTenKH;
                            txtSDT.Text = pd.SoDienThoai;
                            txtSoLuongKhach.Text = pd.TienCoc.ToString();
                            txtTinhTrang.Text = pd.TinhTrang;
                            txtPhiTiec.Text = pd.PhiTiec.ToString();
                            txtTienCoc.Text = pd.TienCoc.ToString();
                            txtMaTiec.Text = pd.MaTiec.ToString();
                            txtPhong.Text = pd.Phong.TenPhong;
                            txtNgayDat.Text = pd.NgayDat.ToString();
                            txtNgayNhan.Text = pd.NgayNhan.ToString();
                        }
                        else
                        {
                            ClearControlsTtPD();
                        }
                        if (hd != null)
                        {
                            txtGioVao.Text = hd.GioVao.ToString("HH:mm:ss dd-MM-yyyy");
                        }
                        else
                        {
                            ClearControlsTtHd();
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("An error occurred: " + ex.Message);
                    }
                }
                else
                {
                    ClearControlsTtPD();
                }
            }
            else
            {
                ClearControlsTtPD();
            }
        }

        private void ClearControlsTtPD()
        {
            cboLoaiPhieu.SelectedText = string.Empty;
            txtKH.Text = string.Empty;
            txtSDT.Text = string.Empty;
            txtSoLuongKhach.Text = string.Empty;
            txtTinhTrang.Text = string.Empty;
            txtPhiTiec.Text = string.Empty;
            txtTienCoc.Text = string.Empty;
            txtMaTiec.Text = string.Empty;
            txtPhong.Text = string.Empty;
            txtNgayDat.Text = string.Empty;
            txtNgayNhan.Text = string.Empty;
        }
        private void ClearControlsTtHd()
        {
            txtGioVao.Text = string.Empty;
            txtTienGio.Text = string.Empty;

            txtTienDichVu.Text = string.Empty;
            txtTienPhat.Text = string.Empty;
            txtTongTien.Text = string.Empty;
        }
        private void ClearControlsTtPhat()
        {
            txtTienPhat.Text = string.Empty;
            txtNDPhat.Text = string.Empty;
        }
        private void ClearControlsTtDichVu()
        {
            txtTTDV.Text = string.Empty;
            txtMaHDDV.Text = string.Empty;
            lsvDV.Clear();
        }

        private void txtTienPhat_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Back || e.KeyCode == Keys.Delete)
            {
                e.SuppressKeyPress = false;
            }
        }

        private void txtTienPhat_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void txtTienPhat_TextChanged(object sender, EventArgs e)
        {
            txtTPhat.Text = txtTienPhat.Text;
        }

        private void btnLapHD_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Bạn có chắc chắn muốn lập hóa đơn?", "Xác nhận", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);

            if (result == DialogResult.OK)
            {
                try
                {
                    UpdateHoaDon();
                    MessageBox.Show("Hóa đơn đã được lập thành công!", "Thành công", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    ClearControlsTtDichVu();
                    ClearControlsTtHd();
                    ClearControlsTtPD();
                    ClearControlsTtPhat();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Có lỗi xảy ra khi lập hóa đơn: " + ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
        private void UpdateHoaDon()
        {
            int maPD = int.Parse(txtMaPD.Text);
            HoaDon hd = BLL_HoaDon.GetDetailByIdPhieuDat(maPD);
            DateTime ngayLap = DateTime.Now;
            DateTime gioRa = DateTime.ParseExact(txtGioRa.Text, "HH:mm:ss dd-MM-yyyy", null);
            long tongTien = 0;
            if (long.TryParse(txtTongTien.Text.Replace(",", ""), out long tongTienParsed))
                tongTien = tongTienParsed;

            PhieuPhat phieuPhat = new PhieuPhat();
            if (!string.IsNullOrEmpty(txtTienPhat.Text) && !string.IsNullOrEmpty(txtNDPhat.Text))
            {
                phieuPhat.TienPhat = long.Parse(txtTienPhat.Text);
                phieuPhat.MoTa = txtNDPhat.Text;
                hd.MaPhieuPhat = BLL_PhieuPhat.add(phieuPhat);

            }
            hd.NgayLap = ngayLap;
            hd.GioRa = gioRa;
            hd.TongTien = tongTien;
            hd.NgayLap = ngayLap;


            BLL_HoaDon.UpdateHoaDon(hd);
        }
    }
}
