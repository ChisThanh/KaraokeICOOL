using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static class BLL_HoaDon
    {
        private static readonly DAL_HoaDon dal = new DAL_HoaDon();

        public static HoaDon GetDetailByIdPhieuDat(int id)
        {
            return dal.GetDetailByIdPhieuDat(id);
        }
        public static bool UpdateHoaDon(HoaDon hoaDon)
        {
            return dal.UpdateHoaDon(hoaDon);
        }
    }
}
