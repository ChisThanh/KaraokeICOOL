using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static class BLL_PhieuDat
    {
        private static readonly DAL_PhieuDat dal = new DAL_PhieuDat();

        public static PhieuDat GetDetailById(int id)
        {
            return dal.GetDetailById(id);
        }
    }
}
