using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_HDDV
    {
        KaraokeICOOLEntities entities = new KaraokeICOOLEntities();
        public List<HDDichVu> getAll()
        {
            return entities.HDDichVus.ToList();
        }
        public List<CTHDDV> getCTHDDV(string ma)
        {
            int maInt;
            if (int.TryParse(ma, out maInt))
            {
                var query = entities.CTHDDVs
                          
                            .Where(cthddv => cthddv.MaHDDV == maInt)
                            .ToList();

                return query;
            }
            else
            {
                return new List<CTHDDV>();
            }
        }
        public void addHD()
        {
            entities.Database.ExecuteSqlCommand("AddHDDV");
        }
        public void deleteHD(int maHDDV)
        {
            var maHDDVParam = new SqlParameter("@maHDDV", maHDDV);
            entities.Database.ExecuteSqlCommand("DeleteHDDV @maHDDV", maHDDVParam);
        }
        public void addCTHDDV(int maHDDV, int maDV, int sl)
        {
            var maHDDVParam = new SqlParameter("@maHDDV", maHDDV);
            var maDVParam = new SqlParameter("@maDV", maDV);
            var slParam = new SqlParameter("@sl", sl);

            entities.Database.ExecuteSqlCommand("AddCTHDDV @maHDDV, @maDV, @sl", maHDDVParam, maDVParam, slParam);
        }
        public void deleteCTHDDV(int maHDDV, int maDV)
        {
            var maHDDVParam = new SqlParameter("@maHDDV", maHDDV);
            var maDVParam = new SqlParameter("@maDV", maDV);
            entities.Database.ExecuteSqlCommand("DeleteCTHDDV @maHDDV, @maDV", maHDDVParam, maDVParam);
        }
        public void updateCTHDDV(int maHDDV, int maDV, int sl)
        {
            var maHDDVParam = new SqlParameter("@maHDDV", maHDDV);
            var maDVParam = new SqlParameter("@maDV", maDV);
            var slParam = new SqlParameter("@sl", sl);
            entities.Database.ExecuteSqlCommand("UpdateCTHDDV @maHDDV, @maDV, @sl", maHDDVParam, maDVParam, slParam);
        }
    }
}
