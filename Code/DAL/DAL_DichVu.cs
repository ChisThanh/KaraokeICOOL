using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_DichVu
    {
        KaraokeICOOLEntities db = new KaraokeICOOLEntities();
        public List<DichVu> getAll()
        {
            return db.DichVus.ToList();
        }
        public List<DichVu> FindDichVu(string search) //, string ghichu
        {
            var sql = "SELECT * FROM dbo.func_FindDichVu(@search)"; //, @ghichu
            var searchParam = new SqlParameter("@search", search);
            //var ghichuParam = new SqlParameter("@ghichu", ghichu);
            var dichVuList = db.Database.SqlQuery<DichVu>(sql, searchParam).ToList(); //, ghichuParam
            return dichVuList;
        }
    }
}
