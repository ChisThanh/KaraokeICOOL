//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class CTHDDV
    {
        public int MaHDDV { get; set; }
        public int MaDV { get; set; }
        public int SoLuong { get; set; }
    
        public virtual DichVu DichVu { get; set; }
        public virtual HDDichVu HDDichVu { get; set; }
    }
}
