using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL;
namespace KaraokeICOOL
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            BLL_TaiKhoan bll = new BLL_TaiKhoan();
            GridView.DataSource = bll.getAllBLL();
        }
    }
}
