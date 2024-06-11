using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_HoaDon
    {
        private readonly KaraokeICOOLEntities entities = new KaraokeICOOLEntities();

        public HoaDon GetDetailByIdPhieuDat(int id)
        {
            return entities.HoaDons.FirstOrDefault(pd => pd.MaPhieuDat == id);
        }
        public bool UpdateHoaDon(HoaDon hoaDon)
        {
            try
            {
                var existingHoaDon = entities.HoaDons.Find(hoaDon.MaHD);

                if (existingHoaDon != null)
                {
                    entities.Entry(existingHoaDon).CurrentValues.SetValues(hoaDon);
                    entities.SaveChanges();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Có lỗi xảy ra khi cập nhật hóa đơn: " + ex.Message);
                return false;
            }
        }
    }
}
