using DAL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace KaraokeICOOL
{
	public partial class frmPhieuDat : Form
	{
		KaraokeICOOLEntities entity = new KaraokeICOOLEntities();
		bool starting = false;

		public frmPhieuDat()
		{
			InitializeComponent();
		}

		private void frmPhieuDat_Load(object sender, EventArgs e)
		{
			starting = true;

			lbl_VIP.Hide();
			lbl_Book.Hide();

			cbx_TinhTrang.Items.Add("Đã đặt");
			cbx_TinhTrang.Items.Add("Đã nhận");
			cbx_TinhTrang.Items.Add("Đã hủy");
			cbx_TinhTrang.Items.Add("Đã thanh toán");

			cbx_TenTiec.DisplayMember = "TenTiec";
			cbx_TenTiec.ValueMember = "MaTiec";
			cbx_TenTiec.DataSource = entity.Tiecs.Select(linq => new
			{
				linq.MaTiec,
				linq.TenTiec,
			}).ToList();

			dgv_Phong.AllowUserToAddRows = false;
			dgv_Phong.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
			dgv_Phong.RowHeadersVisible = false;
			dgv_Phong.AllowUserToResizeRows = false;

			loadPhong();

			dgv_Phong.Columns["MaPhong"].Visible = false;

			dgv_PhieuDat.AllowUserToAddRows = false;
			dgv_PhieuDat.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
			dgv_PhieuDat.RowHeadersVisible = false;
			dgv_PhieuDat.AllowUserToResizeRows = false;

			loadPhieuDat();

			//dgv_PhieuDat.Columns["CMND"].Visible = false;
			//dgv_PhieuDat.Columns["SoLuongKH"].Visible = false;
			dgv_PhieuDat.Columns["MaPhong"].Visible = false;
			dgv_PhieuDat.Columns["MaTiec"].Visible = false;
		}

		private void loadPhong()
		{
			if (dgv_Phong.DataSource != null) dgv_Phong.DataSource = null;

			dgv_Phong.DataSource = entity.Phongs.Select(linq => new
			{
				linq.MaPhong,
				linq.TenPhong,
				linq.LoaiPhong.TenLoai,
				linq.TrangThai,
				linq.LoaiPhong.SucChua
			}).ToList();
		}

		private void loadPhieuDat()
		{
			if (dgv_PhieuDat.DataSource != null) dgv_PhieuDat.DataSource = null;

			dgv_PhieuDat.DataSource = entity.PhieuDats.Select(linq => new
			{
				linq.MaPhieu,
				linq.LoaiPhieu,
				linq.NgayDat,
				linq.NgayNhan,
				linq.HoTenKH,
				linq.CMND,
				linq.SoDienThoai,
				linq.SoLuongKH,
				linq.TinhTrang,
				linq.MaPhong,
				linq.Phong.TenPhong,
				linq.MaTiec,
				linq.Tiec.TenTiec,
				linq.PhiTiec
			}).ToList();
		}

		private void dgv_Phong_SelectionChanged(object sender, EventArgs e)
		{
			if (starting) return;

			if (dgv_Phong.SelectedRows.Count > 0)
			{
				lbl_TenPhong.Text = dgv_Phong.SelectedRows[0].Cells["TenPhong"].Value.ToString();

				string type = dgv_Phong.SelectedRows[0].Cells["TenLoai"].Value.ToString();
				if (type.Contains("VIP")) lbl_VIP.Show();
				else lbl_VIP.Hide();

				string condition = dgv_Phong.SelectedRows[0].Cells["TrangThai"].Value.ToString();
				if (!condition.Contains("Trống")) lbl_Book.Show();
				else lbl_Book.Hide();

				cbx_SoLuong.Items.Clear();
				int capacity = int.Parse(dgv_Phong.SelectedRows[0].Cells["SucChua"].Value.ToString());
				for(int i = 1; i <= capacity; i = i + 1) cbx_SoLuong.Items.Add(i);
			}
		}

		private void dgv_PhieuDat_SelectionChanged(object sender, EventArgs e)
		{
			if (starting) return;

			if (dgv_PhieuDat.SelectedRows.Count > 0)
			{
				int room_id = int.Parse(dgv_PhieuDat.SelectedRows[0].Cells["MaPhong"].Value.ToString());
				if (dgv_PhieuDat.SelectedRows[0].Cells["MaTiec"].Value != null)
				{
					ckb_Tiec.Checked = true;

					int party_id = int.Parse(dgv_PhieuDat.SelectedRows[0].Cells["MaTiec"].Value.ToString());

					var party = cbx_TenTiec.Items.Cast<object>()
						.FirstOrDefault(item => item.ToString() == party_id.ToString());

					if (party != null) cbx_TenTiec.SelectedItem = party;

					if(dgv_PhieuDat.SelectedRows[0].Cells["PhiTiec"].Value != null)
						tbx_PhiTiec.Text = dgv_PhieuDat.SelectedRows[0].Cells["PhiTiec"].Value.ToString();
				}
				else ckb_Tiec.Checked = false;

				tbx_MaPhieuDat.Text = dgv_PhieuDat.SelectedRows[0].Cells["MaPhieu"].Value.ToString();
				tbx_HoTen.Text = dgv_PhieuDat.SelectedRows[0].Cells["HoTenKH"].Value.ToString();
				tbx_CMND.Text = dgv_PhieuDat.SelectedRows[0].Cells["CMND"].Value.ToString();
				tbx_SoDienThoai.Text = dgv_PhieuDat.SelectedRows[0].Cells["SoDienThoai"].Value.ToString();

				var correspond = dgv_Phong.Rows
					.Cast<DataGridViewRow>()
					.FirstOrDefault(row => (int)row.Cells["MaPhong"].Value == room_id);

				if (correspond != null)
				{
					dgv_Phong.ClearSelection();
					correspond.Selected = true;
				}

				var quantity = cbx_SoLuong.Items.Cast<object>()
					.FirstOrDefault(item => item.ToString() == dgv_PhieuDat.SelectedRows[0].Cells["SoLuongKH"].Value.ToString());

				if (quantity != null) cbx_SoLuong.SelectedItem = quantity;

				var condition = cbx_TinhTrang.Items.Cast<object>()
					.FirstOrDefault(item => item.ToString() == dgv_PhieuDat.SelectedRows[0].Cells["TinhTrang"].Value.ToString());

				if (condition != null) cbx_TinhTrang.SelectedItem = condition;

				object order = dgv_PhieuDat.SelectedRows[0].Cells["NgayDat"].Value;

				if (order != null && order != DBNull.Value && order is DateTime) dtp_NgayDat.Value = DateTime.Parse(order.ToString());

				object receive = dgv_PhieuDat.SelectedRows[0].Cells["NgayNhan"].Value;

				if (receive != null && receive != DBNull.Value && receive is DateTime) dtp_NgayNhan.Value = DateTime.Parse(receive.ToString());
			}
		}

		private void cbx_TenTiec_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (starting) return;

			if (cbx_TenTiec.SelectedIndex > -1)
			{
				int id = int.Parse(cbx_TenTiec.SelectedValue.ToString());
				tbx_MoTa.Text = entity.Tiecs.FirstOrDefault(t => t.MaTiec == id).MoTa;
			}
		}

		private void txt_All_KeyPress(object sender, KeyPressEventArgs e)
		{
			if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
			{
				e.Handled = true;
			}
		}

		private void tbx_PhiTiec_TextChanged(object sender, EventArgs e)
		{
			int money = int.Parse(tbx_PhiTiec.Text);
			tbx_TienCoc.Text = (money - money * 20 / 100).ToString();
		}

		private void btn_Dat_Click(object sender, EventArgs e)
		{
			if(lbl_TenPhong.Text.Equals("Tên Phòng"))
			{
				MessageBox.Show("Chọn Phòng!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
				return;
			}

			if(lbl_Book.Visible)
			{
				MessageBox.Show("Phòng Đã Đặt! Chọn Phòng Khác!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
				return;
			}

			if(string.IsNullOrEmpty(tbx_HoTen.Text) || string.IsNullOrEmpty(tbx_CMND.Text) || string.IsNullOrEmpty(tbx_SoDienThoai.Text) || cbx_SoLuong.SelectedIndex < 0)
			{
				MessageBox.Show("Nhập Thông Tin Khách Hàng!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
				return;
			}

			if(string.IsNullOrEmpty(dtp_NgayNhan.Text))
			{
				MessageBox.Show("Nhập Ngày Nhận!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
				return;
			}

			if (DateTime.Compare(DateTime.Today, DateTime.Parse(dtp_NgayNhan.Text.ToString())) > 0)
			{
				MessageBox.Show("Ngày Nhận Phải Sau Hoặc Là Ngày Hôm Nay!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
				return;
			}

			if (ckb_Tiec.Checked)
			{
				if(cbx_TenTiec.SelectedIndex < 0)
				{
					MessageBox.Show("Chọn Tiệc!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
					return;
				}

				if(string.IsNullOrEmpty(tbx_PhiTiec.Text))
				{
					MessageBox.Show("Nhập Phí Tiệc", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
					return;
				}
			}

			PhieuDat phieudat = new PhieuDat();
			phieudat.NgayDat = DateTime.Today;
			phieudat.NgayNhan = DateTime.Parse(dtp_NgayNhan.Text.ToString());
			if (ckb_Tiec.Checked)
			{
				phieudat.LoaiPhieu = "Tiệc";
				phieudat.PhiTiec = int.Parse(tbx_PhiTiec.Text.ToString());
				phieudat.TienCoc = int.Parse(tbx_TienCoc.Text.ToString());
				phieudat.MaTiec = int.Parse(cbx_TenTiec.SelectedValue.ToString());
			}
			else phieudat.LoaiPhieu = "Phòng";
			phieudat.HoTenKH = tbx_HoTen.Text;
			phieudat.CMND = tbx_CMND.Text;
			phieudat.SoDienThoai = tbx_SoDienThoai.Text;
			phieudat.SoLuongKH = int.Parse(cbx_SoLuong.SelectedItem.ToString());
			phieudat.TinhTrang = "Đã đặt";
			phieudat.MaPhong = int.Parse(dgv_Phong.SelectedRows[0].Cells["MaPhong"].Value.ToString());

			try
			{
				entity.Phongs.FirstOrDefault(linq => linq.MaPhong == phieudat.MaPhong).TrangThai = "Đặt";
				entity.PhieuDats.Add(phieudat);
				entity.SaveChanges();

				MessageBox.Show("Thêm Phiếu Đặt Thành Công!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
			}
			catch
			{
				MessageBox.Show("Lỗi Thêm Phiếu Đặt!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
			}
			finally
			{
				loadPhong();
				loadPhieuDat();

				selectRowInDataGridView(phieudat);
			}
		}

		private void btn_Nhan_Click(object sender, EventArgs e)
		{
			if (string.IsNullOrEmpty(tbx_MaPhieuDat.Text))
			{
				MessageBox.Show("Nhập Mã Phiếu Đặt Rồi Ấn Tìm Kiếm Hay Chọn Trong DataGridView!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
				return;
			}

			int id = int.Parse(tbx_MaPhieuDat.Text.ToString());
			PhieuDat phieudat = entity.PhieuDats.FirstOrDefault(linq => linq.MaPhieu == id);
			if(phieudat == null)
			{
				MessageBox.Show("Không Có Phiếu Đặt Trong Hệ Thống", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
				return;
			}

			phieudat.NgayNhan = DateTime.Today;
			phieudat.TinhTrang = "Đã nhận";

			entity.PhieuDats.AddOrUpdate(phieudat);
			entity.SaveChanges();

			loadPhieuDat();

			selectRowInDataGridView(phieudat);

			MessageBox.Show("Cập Nhật Phiếu Đặt Thành Công!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
		}


		private void btn_Huy_Click(object sender, EventArgs e)
		{
			if (string.IsNullOrEmpty(tbx_MaPhieuDat.Text))
			{
				MessageBox.Show("Nhập Mã Phiếu Đặt Rồi Ấn Tìm Kiếm Hay Chọn Trong DataGridView!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
				return;
			}

			int id = int.Parse(tbx_MaPhieuDat.Text.ToString());
			PhieuDat phieudat = entity.PhieuDats.FirstOrDefault(linq => linq.MaPhieu == id);
			if (phieudat == null)
			{
				MessageBox.Show("Không Có Phiếu Đặt Trong Hệ Thống", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
				return;
			}

            //phieudat.NgayNhan = null;
			phieudat.TinhTrang = "Đã hủy";

			entity.Phongs.FirstOrDefault(linq => linq.MaPhong == phieudat.MaPhong).TrangThai = "Trống";
			entity.PhieuDats.AddOrUpdate(phieudat);
			entity.SaveChanges();

			loadPhong();
			loadPhieuDat();

			selectRowInDataGridView(phieudat);

			MessageBox.Show("Cập Nhật Phiếu Đặt Thành Công!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
		}

		private void btn_TimKiem_Click(object sender, EventArgs e)
		{
			if (string.IsNullOrEmpty(tbx_MaPhieuDat.Text))
			{
				MessageBox.Show("Thiếu Mã Phiếu Đặt!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
				return;
			}

			int id = int.Parse(tbx_MaPhieuDat.Text);

			var search = dgv_PhieuDat.Rows
			   .Cast<DataGridViewRow>()
			   .FirstOrDefault(item => item.Cells["MaPhieu"].Value != null &&
									int.TryParse(item.Cells["MaPhieu"].Value.ToString(), out int row_id) &&
									row_id == id);

			if (search != null)
			{
				dgv_PhieuDat.ClearSelection();
				search.Selected = true;
			}
			else MessageBox.Show("Không Tìm Thấy Mã Phiếu Đặt!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
		}

		private void btn_TaoTiec_Click(object sender, EventArgs e)
		{
			MessageBox.Show("Chức Năng Khác!", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
		}

		private void frmPhieuDat_Shown(object sender, EventArgs e)
		{
			starting = false;
		}

		private void selectRowInDataGridView(PhieuDat phieudat)
		{
			foreach (DataGridViewRow row in dgv_PhieuDat.Rows)
			{
				if (row.Cells["MaPhieu"].Value != null && (int)row.Cells["MaPhieu"].Value == phieudat.MaPhieu)
				{
					row.Selected = true;
					dgv_PhieuDat.CurrentCell = row.Cells[0];
					break;
				}
			}
		}
	}

}

