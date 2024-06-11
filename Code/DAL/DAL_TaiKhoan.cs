using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_TaiKhoan
    {
        KaraokeICOOLEntities entities = new KaraokeICOOLEntities();
        public List<TaiKhoan> getAll()
        {
            return entities.TaiKhoans.ToList();
        }
    }
}
