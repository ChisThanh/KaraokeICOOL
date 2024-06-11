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
    public partial class frmThongKe : Form
    {
        KaraokeICOOLEntities db = new KaraokeICOOLEntities();
        int _q = -1, _y = -1;
        public frmThongKe()
        {
            InitializeComponent();
            Load_chart(_q, _y);
            Load_combobox();
        }

        public void Load_combobox()
        {
            comboBoxQuy.Items.Add("Tất cả");
            for (int i = 1; i <= 4; i++)
            {
                comboBoxQuy.Items.Add(i);
            }
            comboBoxQuy.SelectedIndex = 0;


            comboBoxNam.Items.Add("Tất cả");
            for (int i = DateTime.Now.Year; i >= 2020; i--)
            {
                comboBoxNam.Items.Add(i);
            }
            comboBoxNam.SelectedIndex = 0;
        }

        private void comboBoxQuy_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = comboBoxQuy.SelectedIndex;

            if (selectedIndex == 0)
                _q = -1;
            else
                _q = Convert.ToInt32(comboBoxQuy.SelectedItem);
            Load_chart(_q, _y);
        }

        private void comboBoxNam_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = comboBoxNam.SelectedIndex;

            if (selectedIndex == 0)
                _y = -1;
            else
                _y = Convert.ToInt32(comboBoxNam.SelectedItem);
            Load_chart(_q, _y);
        }

        public void Load_chart(int q, int y)
        {
            var data1 = db.PROC_THONGKE_TONGTIEN_DON(q, y).ToList();
            var data2 = db.PROC_THONGKE_SOLUONG_DON(q, y).ToList();
            var data3 = db.PROC_THONGKE_SOLUONG_DICHVU(q, y).ToList();
            var data4 = db.PROC_THONGKE_SOLUONG_TIEC(q, y).ToList();


            if (data1.Count() == 0 || data2.Count() == 0 || data3.Count() == 0 || data4.Count() == 0)
            {
                MessageBox.Show("Không có dữ liệu", "Thông báo");
                return;
            }

            chart_DoanhThu.Series[0].Points.Clear();
            chart_SoLuong.Series[0].Points.Clear();
            chart_SoLuong.Series[1].Points.Clear();
            chart_SoLuong.Series[2].Points.Clear();

            foreach (var item in data1)
            {
                chart_DoanhThu.Series[0].Points.AddXY(item.Month, item.Total);
            }

            foreach (var item in data2)
            {
                chart_SoLuong.Series[0].Points.AddXY(item.Month, item.Quantity);
            }

            foreach (var item in data3)
            {
                chart_SoLuong.Series[1].Points.AddXY(item.Month, item.quantity);
            }

            foreach (var item in data4)
            {
                chart_SoLuong.Series[2].Points.AddXY(item.Month, item.quantity);
            }
        }
    }
}
