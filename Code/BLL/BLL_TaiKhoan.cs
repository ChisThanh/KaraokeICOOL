using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BLL_TaiKhoan
    {
        DAL_TaiKhoan dal = new DAL_TaiKhoan();

        public List<TaiKhoan> getAllBLL()
        {
            return dal.getAll();
        }
    }
}
