using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BLL_DichVu
    {
        DAL_DichVu dalDichVu = new DAL_DichVu();
        public List<DichVu> getAllDichVu()
        {
            return dalDichVu.getAll();
        }

        public List<DichVu> FindDichVu(string search)
        {
            return dalDichVu.FindDichVu(search);
        }
    }
}
