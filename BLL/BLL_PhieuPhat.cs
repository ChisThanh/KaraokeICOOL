using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public static class BLL_PhieuPhat
    {
        private static readonly DAL_PhieuPhat dal = new DAL_PhieuPhat();

        public static int add(PhieuPhat phieuPhat)
        {
            return dal.add(phieuPhat);
        }
    }
}
