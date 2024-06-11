using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_PhieuPhat
    {
        private readonly KaraokeICOOLEntities entities = new KaraokeICOOLEntities();
        public int add(PhieuPhat phieuPhat)
        {
            int maPhieuPhat = -1;
            try
            {
                entities.PhieuPhats.Add(phieuPhat);
                entities.SaveChanges();
                maPhieuPhat = phieuPhat.MaPhieuPhat;
                return maPhieuPhat;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Có lỗi xảy ra khi thêm phiếu phạt: " + ex.Message);
                return maPhieuPhat;
            }
        }
    }
}
