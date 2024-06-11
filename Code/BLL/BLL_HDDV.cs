using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class BLL_HDDV
    {
        DAL_HDDV dal = new DAL_HDDV();

        public List<HDDichVu> getAllHDDichVu()
        {
            return dal.getAll();
        }
        public void addHD()
        {
            dal.addHD();
        }
        public void deleteHD(int maHDDV)
        {
            dal.deleteHD(maHDDV);
        }
        public List<CTHDDV> ShowCTHDDV(string maHDDV)
        {
            return dal.getCTHDDV(maHDDV);
        }
        public void AddCTHDDV(int maHDDV, int maDV, int sl)
        {
            dal.addCTHDDV(maHDDV, maDV, sl);
        }
        public void DeleteCTHDDV(int maHDDV, int maDV)
        {
            dal.deleteCTHDDV(maHDDV, maDV);
        }
        public void UpdateCTHDDV(int maHDDV, int maDV, int sl)
        {
            dal.updateCTHDDV(maHDDV, maDV,sl);
        }

        public  HDDichVu GetDetailById(int id)
        {
            return dal.GetDetailById(id);
        }
    }
}
