USE master
GO
--==============================================================================================================
DROP DATABASE KaraokeICOOL

CREATE DATABASE KaraokeICOOL
GO
--============================================================================================================== 
USE KaraokeICOOL
GO
--==============================================================================================================

--==============================================================================================================
CREATE TABLE DichVu(
	MaDV int IDENTITY(1,1) NOT NULL,
	TenDV nvarchar(100) NOT NULL,
	Anh varchar(255) NULL,
	Gia bigint NOT NULL,
	GhiChu nvarchar(255) NULL,
 CONSTRAINT PK_DichVu PRIMARY KEY (MaDV) 
)
GO
--==============================================================================================================



--Exec SHOW_DsCtHdDVTheoIdHd 1
CREATE FUNCTION func_FindDichVu(@search varchar(255))
RETURNS TABLE
as
	return(select MaDV,TenDV,Gia,GhiChu
	from DichVu DV
	where (DV.TenDV  LIKE N'%' + @search + '%' ));
GO
--==============================================================================================================




CREATE FUNCTION func_FindDichVuTheoLoai(@search varchar(255),@ghichu varchar(255))
RETURNS TABLE
as
	return(select * 
	from DichVu DV
	where DV.TenDV  LIKE N'%' + @search + '%'
	AND GhiChu=@ghichu
	);
GO
--==============================================================================================================


CREATE TABLE CTHDDV(
	MaHDDV int NOT NULL,
	MaDV int NOT NULL,
	SoLuong int NOT NULL,
 CONSTRAINT PK_CTHDDV PRIMARY KEY (MaHDDV,MaDV) 
)
GO
--==============================================================================================================


CREATE TABLE HDDichVu(
	MaHDDV int IDENTITY(1,1) NOT NULL,
	TongTien bigint NULL,
 CONSTRAINT PK_HDDichVu PRIMARY KEY (MaHDDV) 
)


CREATE TABLE HoaDon(
	MaHD int IDENTITY(1,1) NOT NULL,
	MaNV int NOT NULL,
	GioVao datetime NOT NULL,
	GioRa datetime NOT NULL,
	TongTien bigint NULL,
	NgayLap date NOT NULL,
	MaPhieuPhat int NULL,
	MaHDDV int NULL,
	MaPhieuDat int NULL,
 CONSTRAINT PK_HoaDon PRIMARY KEY (MaHD) 
)
GO
--==============================================================================================================


CREATE TABLE LoaiPhong(
	MaLoai int IDENTITY(1,1) NOT NULL,
	TenLoai nvarchar(50) NOT NULL,
	SucChua int NOT NULL,
 CONSTRAINT PK_LoaiPhong PRIMARY KEY (MaLoai) 
)
GO
--==============================================================================================================


CREATE TABLE NhanVien(
	MaNV int IDENTITY(1,1) NOT NULL,
	HoTen nvarchar(255) NOT NULL,
	NgaySinh date NOT NULL,
	GioiTinh nvarchar(5) NOT NULL,
	DiaChi nvarchar(255) NOT NULL,
	SoDienThoai varchar(11) NOT NULL,
	Email varchar(100) NULL,
	MaTK int NOT NULL,
 CONSTRAINT PK_NhanVien PRIMARY KEY (MaNV) 
)
GO
--==============================================================================================================


CREATE TABLE PhieuDat(
	MaPhieu int IDENTITY(1,1) NOT NULL,
	NgayDat date NOT NULL,
	NgayNhan date NULL,
	LoaiPhieu nvarchar(255) NOT NULL,
	HoTenKH nvarchar(100) NOT NULL,
	CMND varchar(20) NOT NULL,
	SoDienThoai varchar(11) NOT NULL,
	SoLuongKH int NOT NULL,
	TinhTrang nvarchar(50) NOT NULL,
	TienCoc bigint NULL,
	PhiTiec bigint NULL,
	MaTiec int NULL,
	MaPhong int NULL,
 CONSTRAINT PK_PhieuDat PRIMARY KEY (MaPhieu) 
)
GO
--==============================================================================================================


CREATE TABLE PhieuPhat(
	MaPhieuPhat int IDENTITY(1,1) NOT NULL,
	TienPhat bigint NOT NULL,
	MoTa nvarchar(255) NOT NULL,
 CONSTRAINT PK_PhieuPhat PRIMARY KEY (MaPhieuPhat) 
)
GO
--==============================================================================================================


CREATE TABLE Phong(
	MaPhong int IDENTITY(1,1) NOT NULL,
	TenPhong nvarchar(100) NOT NULL,
	MaLoai int NOT NULL,
	TrangThai nvarchar(100) NULL,
 CONSTRAINT PK_Phong PRIMARY KEY (MaPhong) 
)
GO
--==============================================================================================================


CREATE TABLE TaiKhoan(
	MaTK int IDENTITY(1,1) NOT NULL,
	TenDangNhap varchar(255) NOT NULL,
	MatKhau varchar(255) NOT NULL,
	Loai nvarchar(255) NOT NULL,
 CONSTRAINT PK_TaiKhoan PRIMARY KEY (MaTK) 
)
GO
--==============================================================================================================


CREATE TABLE ThietBi(
	MaTB int IDENTITY(1,1) NOT NULL,
	TenTB nvarchar(100) NOT NULL,
 CONSTRAINT PK_ThietBi PRIMARY KEY (MaTB) 
)
GO
--==============================================================================================================


CREATE TABLE Tiec(
	MaTiec int IDENTITY(1,1) NOT NULL,
	TenTiec nvarchar(100) NOT NULL,
	MoTa nvarchar(255) NULL,
 CONSTRAINT PK_Tiec PRIMARY KEY (MaTiec) 
)
GO
--==============================================================================================================


CREATE TABLE TrangBi(
	MaPhong int NOT NULL,
	MaTB int NOT NULL,
	SL int NOT NULL,
	TrangThai nvarchar(100) NULL,
 CONSTRAINT PK_TrangBi PRIMARY KEY (MaPhong,MaTB) 
)
GO
--==============================================================================================================
INSERT CTHDDV (MaHDDV, MaDV, SoLuong) VALUES (1, 18, 20)
INSERT CTHDDV (MaHDDV, MaDV, SoLuong) VALUES (1, 41, 10)
INSERT CTHDDV (MaHDDV, MaDV, SoLuong) VALUES (1, 48, 10)
GO
--==============================================================================================================
SET IDENTITY_INSERT DichVu ON 

INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (1, N'Nước ép cam', N'', 65000, N'Nước ép')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (2, N'Nước ép ổi', N'', 65000, N'Nước ép')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (3, N'Nước ép dưa hấu', N'', 65000, N'Nước ép')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (4, N'Nước ép nho', N'', 65000, N'Nước ép')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (5, N'Nước ép bưởi', N'', 65000, N'Nước ép')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (6, N'Nước chanh', N'', 55000, N'Nước')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (7, N'Nước chanh muối', N'', 55000, N'Nước')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (8, N'Cà phê đá', N'', 55000, N'Nước')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (9, N'Cà phê sữa', N'', 55000, N'Nước')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (10, N'Trà gừng mật ong', N'', 55000, N'Nước')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (11, N'Trà Lipton bạc hà', N'', 55000, N'Nước')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (12, N'Trà Lipton chanh', N'', 55000, N'Nước')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (13, N'Sữa tươi cà phê', N'', 55000, N'Nước')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (14, N'Soda chanh', N'', 55000, N'Nước')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (15, N'Chanh mật ong', N'', 55000, N'Nước')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (16, N'Nước suối', N'', 35000, N'Nước')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (17, N'SÀI GÒN SPECIAL LON', N'', 35000, N'Bia')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (18, N'TIGER', N'', 35000, N'Bia')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (19, N'HEINEKEN', N'', 35000, N'Bia')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (20, N'STRONGBOW ', N'', 35000, N'Bia')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (21, N'CHILL COCKTAIL', N'', 35000, N'Bia')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (22, N'7 UP', N'', 35000, N'Nước ngọt')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (23, N'COCA', N'', 35000, N'Nước ngọt')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (24, N'PEPSI', N'', 35000, N'Nước ngọt')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (25, N'STING', N'', 35000, N'Nước ngọt')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (26, N'REDBULL', N'', 35000, N'Nước ngọt')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (27, N'MÌ XÀO NẤM BÒ', N'', 269000, N'CƠM MÌ CHÁO')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (28, N'MÌ XÀO HẢI SẢN', N'', 289000, N'CƠM MÌ CHÁO')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (29, N'CƠM CHIÊN TRỨNG CHÁY TỎI', N'', 199000, N'CƠM MÌ CHÁO')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (30, N'CƠM CHIÊN HẢI SẢN', N'', 239000, N'CƠM MÌ CHÁO')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (31, N'CƠM CHIÊN DƯA BÒ', N'', 289000, N'CƠM MÌ CHÁO')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (32, N'CHÁO BÒ NẤM ĐÔNG CÔ', N'', 289000, N'CƠM MÌ CHÁO')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (33, N'RAU CỦ XÀO THẬP CẨM', N'', 149000, N'MÓN CHÍNH')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (34, N'XÚC XÍCH NƯỚNG TIÊU', N'', 219000, N'MÓN CHÍNH')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (35, N'ẾCH SỐT MẮM', N'', 219000, N'MÓN CHÍNH')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (36, N'ẾCH SỐT TỪ XUYÊN', N'', 219000, N'MÓN CHÍNH')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (37, N'RAU CỦ XÀO THẬP CẨM', N'', 219000, N'MÓN CHÍNH')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (38, N'BÒ LÚC LẮC KHOAI TÂY', N'', 229000, N'MÓN CHÍNH')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (39, N'TÔM SỐT TRỨNG MUỐI', N'', 269000, N'MÓN CHÍNH')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (40, N'CHÂN GÀ SỐT TỬ XUYÊN', N'', 269000, N'MÓN CHÍNH')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (41, N'KHÔ MỰC XẺ RANG TỎI ỚT', N'khomucxe_rangtoi.jpg', 295000, N'MÓN CHÍNH')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (42, N'KHÔ MỰC NƯỚNG', N'', 295000, N'MÓN CHÍNH')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (43, N'ĐUÔI HEO CHIÊN GIÒN KIỂU HÀN', N'', 289000, N'MÓN CHÍNH')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (44, N'KHOAI TÂY CHIÊN BƠ', N'', 119000, N'KHAI VỊ')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (45, N'CHẢ RAM TÔM', N'', 139000, N'KHAI VỊ')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (46, N'CHẢ GIÒ HẢI SẢN', N'chagiohaisan.jpg', 139000, N'KHAI VỊ')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (47, N'CHÂN GÀ CHIÊN SẢ TẮC', N'sungarangmuoikieuhongkong.jpg', 149000, N'KHAI VỊ')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (48, N'ĐẬU HỦ CHÀ BÔNG', N'dauhusottoiot.jpg', 159000, N'KHAI VỊ')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (49, N'RĂNG MỰC CHIÊN GIÒN TỎI ỚT', N'', 169000, N'KHAI VỊ')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (50, N'KHÔ BÒ XẺ DĨA', N'', 179000, N'KHAI VỊ')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (51, N'BÁNH PATE TRỨNG CỦA ĐÓ', N'', 269000, N'KHAI VỊ')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (52, N'MALA BÒ MỘT NẮNG', N'', 289000, N'KHAI VỊ')
INSERT DichVu (MaDV, TenDV, Anh, Gia, GhiChu) VALUES (53, N'MỤC CHIÊN BƠ TỎI', N'', 289000, N'KHAI VỊ')
SET IDENTITY_INSERT DichVu OFF
GO
--==============================================================================================================
SET IDENTITY_INSERT HDDichVu ON 

INSERT HDDichVu (MaHDDV, TongTien) VALUES (1, 5240000)
INSERT HDDichVu (MaHDDV, TongTien) VALUES (2, 5240000)
INSERT HDDichVu (MaHDDV, TongTien) VALUES (3, 5240000)
INSERT HDDichVu (MaHDDV, TongTien) VALUES (4, 5240000)
INSERT HDDichVu (MaHDDV, TongTien) VALUES (5, 5240000)
INSERT HDDichVu (MaHDDV, TongTien) VALUES (6, 5240000)
INSERT HDDichVu (MaHDDV, TongTien) VALUES (7, 5240000)
INSERT HDDichVu (MaHDDV, TongTien) VALUES (8, 5240000)
INSERT HDDichVu (MaHDDV, TongTien) VALUES (9, 5000000)
INSERT HDDichVu (MaHDDV, TongTien) VALUES (10, 5000000)
INSERT HDDichVu (MaHDDV, TongTien) VALUES (11, 5000000)
INSERT HDDichVu (MaHDDV, TongTien) VALUES (12, 5000000)
INSERT HDDichVu (MaHDDV, TongTien) VALUES (13, 5000000)
SET IDENTITY_INSERT HDDichVu OFF
GO
--==============================================================================================================
SET IDENTITY_INSERT HoaDon ON 

INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (1, 3, CAST(N'2023-01-06T14:00:00.000' AS DateTime), CAST(N'2023-01-06T18:00:00.000' AS DateTime), 3100000, CAST(N'2023-06-01' AS Date), NULL, NULL, 1)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (2, 4, CAST(N'2023-02-06T10:00:00.000' AS DateTime), CAST(N'2023-02-06T15:00:00.000' AS DateTime), 5125000, CAST(N'2023-06-02' AS Date), NULL, NULL, 2)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (3, 4, CAST(N'2023-02-06T10:00:00.000' AS DateTime), CAST(N'2023-02-06T15:00:00.000' AS DateTime), 3000000, CAST(N'2023-06-02' AS Date), 1, 1, 3)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (4, 3, CAST(N'2023-01-06T14:00:00.000' AS DateTime), CAST(N'2023-01-06T18:00:00.000' AS DateTime), 3100000, CAST(N'2023-07-01' AS Date), NULL, 1, 1)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (6, 4, CAST(N'2023-02-06T10:00:00.000' AS DateTime), CAST(N'2023-02-06T15:00:00.000' AS DateTime), 3000000, CAST(N'2023-09-02' AS Date), 1, 1, 3)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (17, 3, CAST(N'2023-01-06T14:00:00.000' AS DateTime), CAST(N'2023-01-06T18:00:00.000' AS DateTime), 3100000, CAST(N'2023-07-01' AS Date), NULL, 1, 1)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (18, 4, CAST(N'2023-02-06T10:00:00.000' AS DateTime), CAST(N'2023-02-06T15:00:00.000' AS DateTime), 5125000, CAST(N'2023-08-02' AS Date), NULL, 2, 2)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (19, 4, CAST(N'2023-02-06T10:00:00.000' AS DateTime), CAST(N'2023-02-06T15:00:00.000' AS DateTime), 3000000, CAST(N'2023-09-02' AS Date), 1, 1, 3)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (30, 3, CAST(N'2023-01-06T14:00:00.000' AS DateTime), CAST(N'2023-01-06T18:00:00.000' AS DateTime), 3100000, CAST(N'2023-07-01' AS Date), NULL, 1, 1)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (31, 4, CAST(N'2023-02-06T10:00:00.000' AS DateTime), CAST(N'2023-02-06T15:00:00.000' AS DateTime), 5125000, CAST(N'2023-08-02' AS Date), NULL, 2, 2)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (32, 4, CAST(N'2023-02-06T10:00:00.000' AS DateTime), CAST(N'2023-02-06T15:00:00.000' AS DateTime), 3000000, CAST(N'2023-09-02' AS Date), 1, 1, 3)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (33, 3, CAST(N'2023-03-06T12:00:00.000' AS DateTime), CAST(N'2023-03-06T17:00:00.000' AS DateTime), 2800000, CAST(N'2023-10-03' AS Date), NULL, 3, 11)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (34, 4, CAST(N'2023-04-06T09:00:00.000' AS DateTime), CAST(N'2023-04-06T13:00:00.000' AS DateTime), 4200000, CAST(N'2023-11-04' AS Date), NULL, 4, 12)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (35, 3, CAST(N'2023-05-06T16:00:00.000' AS DateTime), CAST(N'2023-05-06T20:00:00.000' AS DateTime), 1950000, CAST(N'2023-12-05' AS Date), NULL, 5, 13)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (36, 4, CAST(N'2023-06-06T11:00:00.000' AS DateTime), CAST(N'2023-06-06T14:00:00.000' AS DateTime), 6300000, CAST(N'2023-01-06' AS Date), NULL, 6, 14)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (37, 3, CAST(N'2023-07-06T08:00:00.000' AS DateTime), CAST(N'2023-07-06T12:00:00.000' AS DateTime), 4800000, CAST(N'2023-02-07' AS Date), NULL, 7, 15)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (38, 4, CAST(N'2023-08-06T15:00:00.000' AS DateTime), CAST(N'2023-08-06T19:00:00.000' AS DateTime), 2500000, CAST(N'2023-03-08' AS Date), NULL, 8, 16)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (43, 3, CAST(N'2023-01-06T14:00:00.000' AS DateTime), CAST(N'2023-01-06T18:00:00.000' AS DateTime), 3100000, CAST(N'2023-07-01' AS Date), NULL, 1, 1)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (44, 4, CAST(N'2023-02-06T10:00:00.000' AS DateTime), CAST(N'2023-02-06T15:00:00.000' AS DateTime), 5125000, CAST(N'2023-08-02' AS Date), NULL, 2, 2)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (45, 4, CAST(N'2023-02-06T10:00:00.000' AS DateTime), CAST(N'2023-02-06T15:00:00.000' AS DateTime), 3000000, CAST(N'2023-09-02' AS Date), 1, 1, 3)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (46, 3, CAST(N'2023-03-06T12:00:00.000' AS DateTime), CAST(N'2023-03-06T17:00:00.000' AS DateTime), 2800000, CAST(N'2023-10-03' AS Date), NULL, 3, 11)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (47, 4, CAST(N'2023-04-06T09:00:00.000' AS DateTime), CAST(N'2023-04-06T13:00:00.000' AS DateTime), 4200000, CAST(N'2023-11-04' AS Date), NULL, 4, 12)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (48, 3, CAST(N'2023-05-06T16:00:00.000' AS DateTime), CAST(N'2023-05-06T20:00:00.000' AS DateTime), 1950000, CAST(N'2023-12-05' AS Date), NULL, 5, 13)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (49, 4, CAST(N'2023-06-06T11:00:00.000' AS DateTime), CAST(N'2023-06-06T14:00:00.000' AS DateTime), 6300000, CAST(N'2023-01-06' AS Date), NULL, 6, 14)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (50, 3, CAST(N'2023-07-06T08:00:00.000' AS DateTime), CAST(N'2023-07-06T12:00:00.000' AS DateTime), 4800000, CAST(N'2023-02-07' AS Date), NULL, 7, 15)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (51, 4, CAST(N'2023-08-06T15:00:00.000' AS DateTime), CAST(N'2023-08-06T19:00:00.000' AS DateTime), 2500000, CAST(N'2023-03-08' AS Date), NULL, 8, 16)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (52, 3, CAST(N'2023-09-06T10:00:00.000' AS DateTime), CAST(N'2023-09-06T14:00:00.000' AS DateTime), 3720000, CAST(N'2023-04-09' AS Date), NULL, 9, 17)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (53, 4, CAST(N'2023-10-06T13:00:00.000' AS DateTime), CAST(N'2023-10-06T18:00:00.000' AS DateTime), 1800000, CAST(N'2023-06-10' AS Date), NULL, 10, 18)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (54, 3, CAST(N'2023-11-06T09:00:00.000' AS DateTime), CAST(N'2023-11-06T12:00:00.000' AS DateTime), 5400000, CAST(N'2023-05-11' AS Date), NULL, 11, 19)
INSERT HoaDon (MaHD, MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuPhat, MaHDDV, MaPhieuDat) VALUES (55, 4, CAST(N'2023-12-06T14:00:00.000' AS DateTime), CAST(N'2023-12-06T19:00:00.000' AS DateTime), 4100000, CAST(N'2023-06-12' AS Date), NULL, 12, 20)
SET IDENTITY_INSERT HoaDon OFF
GO
--==============================================================================================================
SET IDENTITY_INSERT LoaiPhong ON 

INSERT LoaiPhong (MaLoai, TenLoai, SucChua) VALUES (1, N'Thường - Nhỏ', 5)
INSERT LoaiPhong (MaLoai, TenLoai, SucChua) VALUES (2, N'Thường - Trung', 10)
INSERT LoaiPhong (MaLoai, TenLoai, SucChua) VALUES (3, N'Thường - Lớn', 20)
INSERT LoaiPhong (MaLoai, TenLoai, SucChua) VALUES (4, N'VIP - Nhỏ', 5)
INSERT LoaiPhong (MaLoai, TenLoai, SucChua) VALUES (5, N'VIP - Trung', 10)
INSERT LoaiPhong (MaLoai, TenLoai, SucChua) VALUES (6, N'VIP - Lớn', 20)
SET IDENTITY_INSERT LoaiPhong OFF
GO
--==============================================================================================================
SET IDENTITY_INSERT NhanVien ON 

INSERT NhanVien (MaNV, HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email, MaTK) VALUES (1, N'Vũ Văn Anh', CAST(N'2003-02-13' AS Date), N'Nam', N'Tây Thạnh, Tân Phú, Thành phố Hồ Chí Minh', N'0393222222', N'fashionshop@gmail.com', 1)
INSERT NhanVien (MaNV, HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email, MaTK) VALUES (2, N'Hà Tri Thủy', CAST(N'2003-01-17' AS Date), N'Nam', N'Tân Sơn Nhì, Tân Phú, Thành phố Hồ Chí Minh', N'0967327941', N'hatrithuy@gmail.com', 2)
INSERT NhanVien (MaNV, HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email, MaTK) VALUES (3, N'Nguyễn Văn Chí Thanh', CAST(N'2003-04-07' AS Date), N'Nam', N'Phường 7, Quận 5, Thành phố Hồ Chí Minh, Việt Nam', N'0393555222', N'chithanh@gmail.com', 3)
INSERT NhanVien (MaNV, HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email, MaTK) VALUES (4, N'Nguyễn Bảo Long', CAST(N'2000-11-20' AS Date), N'Nam', N'212-242 Đ. Độc Lập, Tân Thành, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam', N'0393666222', N'nguyenbaolong@gmail.com', 4)
INSERT NhanVien (MaNV, HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email, MaTK) VALUES (5, N'Nguyễn Lê Huyền Trang', CAST(N'1998-03-14' AS Date), N'Nữ', N'Bình Hưng Hòa A, Bình Hưng Hoà A, Bình Tân, Thành phố Hồ Chí Minh, Việt Nam', N'0393777222', N'trangnguyen14@gmail.com', 5)
INSERT NhanVien (MaNV, HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email, MaTK) VALUES (6, N'Huỳnh Thái Cường', CAST(N'2000-06-21' AS Date), N'Nam', N'131 Đ. 26/3, Bình Hưng Hoà, Bình Tân, Thành phố Hồ Chí Minh, Việt Nam', N'0393000222', N'cuonghuynh21@gmail.com', 6)
INSERT NhanVien (MaNV, HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email, MaTK) VALUES (7, N'Huỳnh Tuấn Khang', CAST(N'2003-06-21' AS Date), N'Nam', N'131 Đ. 26/3, Bình Hưng Hoà, Bình Tân, Thành phố Hồ Chí Minh, Việt Nam', N'0355974560', N'huynhkhang@gmail.com', 7)
SET IDENTITY_INSERT NhanVien OFF
GO
--==============================================================================================================
SET IDENTITY_INSERT PhieuDat ON 

INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (1, CAST(N'2023-06-02' AS Date), CAST(N'2023-06-05' AS Date), N'Tiệc', N'Nguyễn Ngọc Ánh', N'01234567893', N'0909123455', 5, N'Đã nhận', 600000, 3000000, 1, 7)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (2, CAST(N'2023-06-02' AS Date), CAST(N'2023-06-05' AS Date), N'Tiệc', N'Nguyễn Trần Anh', N'01623456789', N'0909123456', 10, N'Đã nhận', 1000000, 5000000, 3, 11)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (3, CAST(N'2023-06-06' AS Date), CAST(N'2023-06-02' AS Date), N'Phòng', N'Trần Thị Bình', N'0987654321', N'0912345678', 19, N'Đã nhận', NULL, NULL, NULL, 9)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (4, CAST(N'2023-06-02' AS Date), CAST(N'2023-06-05' AS Date), N'Tiệc', N'Nguyễn Ngọc Ánh', N'01234567893', N'0909123455', 5, N'Đã nhận', 600000, 3000000, 1, 7)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (5, CAST(N'2023-06-02' AS Date), CAST(N'2023-06-05' AS Date), N'Tiệc', N'Nguyễn Trần Anh', N'01623456789', N'0909123456', 10, N'Đã nhận', 1000000, 5000000, 3, 11)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (6, CAST(N'2023-06-06' AS Date), CAST(N'2023-06-02' AS Date), N'Phòng', N'Trần Thị Bình', N'0987654321', N'0912345678', 19, N'Đã nhận', NULL, NULL, 2, 9)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (7, CAST(N'2023-06-07' AS Date), CAST(N'2023-06-02' AS Date), N'Tiệc', N'Lê Thị Lan', N'01234567890', N'0909123457', 8, N'Đã nhận', NULL, NULL, 3, 5)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (8, CAST(N'2023-06-08' AS Date), CAST(N'2023-06-02' AS Date), N'Phòng', N'Trần Văn Mạnh', N'0987654322', N'0912345679', 2, N'Đã nhận', NULL, NULL, 4, 12)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (9, CAST(N'2023-06-09' AS Date), CAST(N'2023-06-02' AS Date), N'Tiệc', N'Nguyễn Thị Mai', N'01234567891', N'0909123458', 15, N'Đã nhận', NULL, NULL, 5, 3)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (10, CAST(N'2023-06-10' AS Date), CAST(N'2023-06-02' AS Date), N'Phòng', N'Phạm Kim Ngân', N'0987654323', N'0912345680', 5, N'Đã nhận', NULL, NULL, 1, 8)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (11, CAST(N'2023-06-11' AS Date), CAST(N'2023-06-03' AS Date), N'Tiệc', N'Lê Văn Hùng', N'01234567892', N'0909123459', 12, N'Đã nhận', NULL, NULL, 2, 6)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (12, CAST(N'2023-06-12' AS Date), CAST(N'2023-06-03' AS Date), N'Phòng', N'Đỗ Thị Hoa', N'0987654324', N'0912345681', 3, N'Đã nhận', NULL, NULL, 3, 10)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (13, CAST(N'2023-06-13' AS Date), CAST(N'2023-06-03' AS Date), N'Tiệc', N'Vũ Thị Ngọc', N'01234567894', N'0909123460', 7, N'Đã nhận', NULL, NULL, 4, 1)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (14, CAST(N'2023-06-14' AS Date), CAST(N'2023-06-03' AS Date), N'Phòng', N'Trần Minh Tuấn', N'0987654325', N'0912345682', 4, N'Đã nhận', NULL, NULL, 5, 9)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (15, CAST(N'2023-06-15' AS Date), CAST(N'2023-06-04' AS Date), N'Tiệc', N'Nguyễn Thị Minh', N'01234567895', N'0909123461', 11, N'Đã nhận', NULL, NULL, 1, 7)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (16, CAST(N'2023-06-16' AS Date), CAST(N'2023-06-04' AS Date), N'Phòng', N'Phạm Thị Thu', N'0987654326', N'0912345683', 6, N'Đã nhận', NULL, NULL, 2, 4)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (17, CAST(N'2023-06-02' AS Date), CAST(N'2023-06-05' AS Date), N'Tiệc', N'Nguyễn Ngọc Ánh', N'01234567893', N'0909123455', 5, N'Đã nhận', 600000, 3000000, 1, 7)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (18, CAST(N'2023-06-02' AS Date), CAST(N'2023-06-05' AS Date), N'Tiệc', N'Nguyễn Trần Anh', N'01623456789', N'0909123456', 10, N'Đã nhận', 1000000, 5000000, 3, 11)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (19, CAST(N'2023-06-06' AS Date), CAST(N'2023-06-02' AS Date), N'Phòng', N'Trần Thị Bình', N'0987654321', N'0912345678', 19, N'Đã nhận', NULL, NULL, 2, 9)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (20, CAST(N'2023-06-07' AS Date), CAST(N'2023-06-02' AS Date), N'Tiệc', N'Lê Thị Lan', N'01234567890', N'0909123457', 8, N'Đã nhận', NULL, NULL, 3, 5)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (21, CAST(N'2023-06-08' AS Date), CAST(N'2023-06-02' AS Date), N'Phòng', N'Trần Văn Mạnh', N'0987654322', N'0912345679', 2, N'Đã nhận', NULL, NULL, 4, 12)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (22, CAST(N'2023-06-09' AS Date), CAST(N'2023-06-02' AS Date), N'Tiệc', N'Nguyễn Thị Mai', N'01234567891', N'0909123458', 15, N'Đã nhận', NULL, NULL, 5, 3)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (23, CAST(N'2023-06-10' AS Date), CAST(N'2023-06-02' AS Date), N'Phòng', N'Phạm Kim Ngân', N'0987654323', N'0912345680', 5, N'Đã nhận', NULL, NULL, 1, 8)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (24, CAST(N'2023-06-11' AS Date), CAST(N'2023-06-03' AS Date), N'Tiệc', N'Lê Văn Hùng', N'01234567892', N'0909123459', 12, N'Đã nhận', NULL, NULL, 2, 6)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (25, CAST(N'2023-06-12' AS Date), CAST(N'2023-06-03' AS Date), N'Phòng', N'Đỗ Thị Hoa', N'0987654324', N'0912345681', 3, N'Đã nhận', NULL, NULL, 3, 10)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (26, CAST(N'2023-06-13' AS Date), CAST(N'2023-06-03' AS Date), N'Tiệc', N'Vũ Thị Ngọc', N'01234567894', N'0909123460', 7, N'Đã nhận', NULL, NULL, 4, 1)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (27, CAST(N'2023-06-14' AS Date), CAST(N'2023-06-03' AS Date), N'Phòng', N'Trần Minh Tuấn', N'0987654325', N'0912345682', 4, N'Đã nhận', NULL, NULL, 5, 9)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (28, CAST(N'2023-06-15' AS Date), CAST(N'2023-06-04' AS Date), N'Tiệc', N'Nguyễn Thị Minh', N'01234567895', N'0909123461', 11, N'Đã nhận', NULL, NULL, 1, 7)
INSERT PhieuDat (MaPhieu, NgayDat, NgayNhan, LoaiPhieu, HoTenKH, CMND, SoDienThoai, SoLuongKH, TinhTrang, TienCoc, PhiTiec, MaTiec, MaPhong) VALUES (29, CAST(N'2023-06-16' AS Date), CAST(N'2023-06-04' AS Date), N'Phòng', N'Phạm Thị Thu', N'0987654326', N'0912345683', 6, N'Đã nhận', NULL, NULL, 2, 4)
SET IDENTITY_INSERT PhieuDat OFF
GO
--==============================================================================================================
SET IDENTITY_INSERT PhieuPhat ON 

INSERT PhieuPhat (MaPhieuPhat, TienPhat, MoTa) VALUES (1, 500000, N'Làm hỏng loa của quán')
SET IDENTITY_INSERT PhieuPhat OFF
GO
--==============================================================================================================
SET IDENTITY_INSERT Phong ON 

INSERT Phong (MaPhong, TenPhong, MaLoai, TrangThai) VALUES (1, N'Phòng 1', 1, N'Trống')
INSERT Phong (MaPhong, TenPhong, MaLoai, TrangThai) VALUES (2, N'Phòng 2', 2, N'Trống')
INSERT Phong (MaPhong, TenPhong, MaLoai, TrangThai) VALUES (3, N'Phòng 3', 3, N'Trống')
INSERT Phong (MaPhong, TenPhong, MaLoai, TrangThai) VALUES (4, N'Phòng 4', 4, N'Trống')
INSERT Phong (MaPhong, TenPhong, MaLoai, TrangThai) VALUES (5, N'Phòng 5', 5, N'Trống')
INSERT Phong (MaPhong, TenPhong, MaLoai, TrangThai) VALUES (6, N'Phòng 6', 6, N'Trống')
INSERT Phong (MaPhong, TenPhong, MaLoai, TrangThai) VALUES (7, N'Phòng 7', 1, N'Trống')
INSERT Phong (MaPhong, TenPhong, MaLoai, TrangThai) VALUES (8, N'Phòng 8', 2, N'Trống')
INSERT Phong (MaPhong, TenPhong, MaLoai, TrangThai) VALUES (9, N'Phòng 9', 3, N'Trống')
INSERT Phong (MaPhong, TenPhong, MaLoai, TrangThai) VALUES (10, N'Phòng 10', 4, N'Trống')
INSERT Phong (MaPhong, TenPhong, MaLoai, TrangThai) VALUES (11, N'Phòng 11', 5, N'Trống')
INSERT Phong (MaPhong, TenPhong, MaLoai, TrangThai) VALUES (12, N'Phòng 12', 6, N'Trống')
SET IDENTITY_INSERT Phong OFF
GO
--==============================================================================================================
SET IDENTITY_INSERT TaiKhoan ON 

INSERT TaiKhoan (MaTK, TenDangNhap, MatKhau, Loai) VALUES (1, N'admin', N'admin@123', N'Admin')
INSERT TaiKhoan (MaTK, TenDangNhap, MatKhau, Loai) VALUES (2, N'quanly1', N'123456', N'Quản lý')
INSERT TaiKhoan (MaTK, TenDangNhap, MatKhau, Loai) VALUES (3, N'quanly2', N'123456', N'Quản lý')
INSERT TaiKhoan (MaTK, TenDangNhap, MatKhau, Loai) VALUES (4, N'tieptan1', N'123456', N'Tiếp tân')
INSERT TaiKhoan (MaTK, TenDangNhap, MatKhau, Loai) VALUES (5, N'tieptan2', N'123456', N'Tiếp tân')
INSERT TaiKhoan (MaTK, TenDangNhap, MatKhau, Loai) VALUES (6, N'phucvu1', N'123456', N'Phục vụ')
INSERT TaiKhoan (MaTK, TenDangNhap, MatKhau, Loai) VALUES (7, N'phucvu2', N'123456', N'Phục vụ')
SET IDENTITY_INSERT TaiKhoan OFF
GO
--==============================================================================================================
SET IDENTITY_INSERT ThietBi ON 

INSERT ThietBi (MaTB, TenTB) VALUES (1, N'Đầu Karaoke')
INSERT ThietBi (MaTB, TenTB) VALUES (2, N'Loa Karaoke')
INSERT ThietBi (MaTB, TenTB) VALUES (3, N'Amply')
INSERT ThietBi (MaTB, TenTB) VALUES (4, N'Loa Sub')
INSERT ThietBi (MaTB, TenTB) VALUES (5, N'Micro')
INSERT ThietBi (MaTB, TenTB) VALUES (6, N'Màn hình karaoke BTE')
INSERT ThietBi (MaTB, TenTB) VALUES (7, N'Màn hình karaoke Hanet')
INSERT ThietBi (MaTB, TenTB) VALUES (8, N'Smart TV 43 inch')
INSERT ThietBi (MaTB, TenTB) VALUES (9, N'Smart TV 65 inch 4K')
SET IDENTITY_INSERT ThietBi OFF
GO
--==============================================================================================================
SET IDENTITY_INSERT Tiec ON 

INSERT Tiec (MaTiec, TenTiec, MoTa) VALUES (1, N'Thuỷ Long', N'Liên hoan với set tiệc có các món như SOUP CUA TRỨNG CÚT, GỎI BÊ CÀ PHÁO, CHẲNG DỪNG RANG RIỀNG, MÌ Ý HẢI SẢN ĐÚT LÒ, LẨU CÁ TẰM MĂNG CHUA. Được trang trí với màu xanh da trời làm chủ đạo, màu của hy vọng, hoà bình, thanh thản ... ')
INSERT Tiec (MaTiec, TenTiec, MoTa) VALUES (2, N'Tiên Long', N'Sinh nhật với set tiệc có các món như SOUP CUA TÓC TIÊN, TÔM CHIÊN PHỤNG HOÀNG, CƠM CHIÊN GÀ KẺ THỊT BACON, GỎI RAU CÀNG CUA BẮP BÒ, LẨU GÀ NẤM KIỂU NHẬT. Không gian được trang trí với sắc vàng là chủ đạo ..')
INSERT Tiec (MaTiec, TenTiec, MoTa) VALUES (3, N'Vương Long', N'Tiệc tổng kết với set tiệc có các món như SOUP BÀO NGƯ, TÔM CÀNG RANG MUỐI, GỎI ĐU ĐỦ TRỘN TAI HEO, CƠM CHIÊN HẠT SEN, LẨU ĐUÔI BÒ HÀN QUỐC. Không gian với sắc đỏ chủ đạo với mong muốn càng nhận được nhiều may mắn...')
INSERT Tiec (MaTiec, TenTiec, MoTa) VALUES (4, N'Thanh Long', N'Sinh nhật với set tiệc có các món như SOUP XÍU MẠI, GÀ ĐỐT Ô THUM, GỎI NGÓ SEN TÔM THỊT, CƠM CHIÊN TÔM CÀNG TRỨNG MUỐI, LẨU CÙ LAO. Không gian được trang trí với nhiều màu sắc tươi sáng...')
INSERT Tiec (MaTiec, TenTiec, MoTa) VALUES (5, N'Vũ Long', N'Tiệc chia tay với set tiệc có các món như SOUP CÁ HỒI TRỨNG BẮC THẢO, GỎI KHOAI MÔN GÀ XÉ,CUA LỘT SỐT MALAYSIA, BÚN XÀO SINGAPORE, LẤU XÍ QUÁCH...')
SET IDENTITY_INSERT Tiec OFF
GO
--==============================================================================================================
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (1, 1, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (1, 2, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (1, 3, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (1, 4, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (1, 5, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (1, 6, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (1, 8, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (2, 1, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (2, 2, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (2, 3, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (2, 4, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (2, 5, 4, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (2, 6, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (2, 8, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (3, 1, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (3, 2, 3, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (3, 3, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (3, 4, 1, N'Hư hỏng')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (3, 5, 8, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (3, 6, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (3, 8, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (4, 1, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (4, 2, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (4, 3, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (4, 4, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (4, 5, 4, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (4, 7, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (4, 9, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (5, 1, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (5, 2, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (5, 3, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (5, 4, 3, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (5, 5, 5, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (5, 7, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (5, 9, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (6, 1, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (6, 2, 3, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (6, 3, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (6, 4, 3, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (6, 5, 10, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (6, 7, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (6, 9, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (7, 1, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (7, 2, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (7, 3, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (7, 4, 1, N'Hư hỏng')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (7, 5, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (7, 6, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (7, 8, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (8, 1, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (8, 2, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (8, 3, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (8, 4, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (8, 5, 4, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (8, 6, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (8, 8, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (9, 1, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (9, 2, 3, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (9, 3, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (9, 4, 2, N'Hư hỏng')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (9, 5, 8, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (9, 6, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (9, 8, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (10, 1, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (10, 2, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (10, 3, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (10, 4, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (10, 5, 4, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (10, 7, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (10, 9, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (11, 1, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (11, 2, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (11, 3, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (11, 4, 3, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (11, 5, 5, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (11, 7, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (11, 9, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (12, 1, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (12, 2, 2, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (12, 3, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (12, 4, 3, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (12, 5, 10, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (12, 7, 1, N'Bình thường')
INSERT TrangBi (MaPhong, MaTB, SL, TrangThai) VALUES (12, 9, 1, N'Bình thường')
GO
--==============================================================================================================
ALTER TABLE CTHDDV  WITH CHECK ADD  CONSTRAINT FK_CTHDDV_DichVu FOREIGN KEY(MaDV)
REFERENCES DichVu (MaDV)
GO
--==============================================================================================================
ALTER TABLE CTHDDV CHECK CONSTRAINT FK_CTHDDV_DichVu
GO
--==============================================================================================================
ALTER TABLE CTHDDV  WITH CHECK ADD  CONSTRAINT FK_CTHDDV_HDDichVu FOREIGN KEY(MaHDDV)
REFERENCES HDDichVu (MaHDDV)
GO
--==============================================================================================================
ALTER TABLE CTHDDV CHECK CONSTRAINT FK_CTHDDV_HDDichVu
GO
--==============================================================================================================
ALTER TABLE HoaDon  WITH CHECK ADD  CONSTRAINT FK_HoaDon_HDDichVu FOREIGN KEY(MaHDDV)
REFERENCES HDDichVu (MaHDDV)
GO
--==============================================================================================================
ALTER TABLE HoaDon CHECK CONSTRAINT FK_HoaDon_HDDichVu
GO
--==============================================================================================================
ALTER TABLE HoaDon  WITH CHECK ADD  CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY(MaNV)
REFERENCES NhanVien (MaNV)
GO
--==============================================================================================================
ALTER TABLE HoaDon CHECK CONSTRAINT FK_HoaDon_NhanVien
GO
--==============================================================================================================
ALTER TABLE HoaDon  WITH CHECK ADD  CONSTRAINT FK_HoaDon_PhieuDat FOREIGN KEY(MaPhieuDat)
REFERENCES PhieuDat (MaPhieu)
GO
--==============================================================================================================
ALTER TABLE HoaDon CHECK CONSTRAINT FK_HoaDon_PhieuDat
GO
--==============================================================================================================
ALTER TABLE HoaDon  WITH CHECK ADD  CONSTRAINT FK_HoaDon_PhieuPhat FOREIGN KEY(MaPhieuPhat)
REFERENCES PhieuPhat (MaPhieuPhat)
GO
--==============================================================================================================
ALTER TABLE HoaDon CHECK CONSTRAINT FK_HoaDon_PhieuPhat
GO
--==============================================================================================================
ALTER TABLE NhanVien  WITH CHECK ADD  CONSTRAINT FK_NhanVien_TaiKhoan FOREIGN KEY(MaTK)
REFERENCES TaiKhoan (MaTK)
GO
--==============================================================================================================
ALTER TABLE NhanVien CHECK CONSTRAINT FK_NhanVien_TaiKhoan
GO
--==============================================================================================================
ALTER TABLE PhieuDat  WITH CHECK ADD  CONSTRAINT FK_PhieuDat_Phong FOREIGN KEY(MaPhong)
REFERENCES Phong (MaPhong)
GO
--==============================================================================================================
ALTER TABLE PhieuDat CHECK CONSTRAINT FK_PhieuDat_Phong
GO
--==============================================================================================================
ALTER TABLE PhieuDat  WITH CHECK ADD  CONSTRAINT FK_PhieuDat_Tiec FOREIGN KEY(MaTiec)
REFERENCES Tiec (MaTiec)
GO
--==============================================================================================================
ALTER TABLE PhieuDat CHECK CONSTRAINT FK_PhieuDat_Tiec
GO
--==============================================================================================================
ALTER TABLE Phong  WITH CHECK ADD  CONSTRAINT PK_Phong_LoaiPhong FOREIGN KEY(MaLoai)
REFERENCES LoaiPhong (MaLoai)
GO
--==============================================================================================================
ALTER TABLE Phong CHECK CONSTRAINT PK_Phong_LoaiPhong
GO
--==============================================================================================================
ALTER TABLE TrangBi  WITH CHECK ADD  CONSTRAINT FK_TrangBi_Phong FOREIGN KEY(MaPhong)
REFERENCES Phong (MaPhong)
GO
--==============================================================================================================
ALTER TABLE TrangBi CHECK CONSTRAINT FK_TrangBi_Phong
GO
--==============================================================================================================
ALTER TABLE TrangBi  WITH CHECK ADD  CONSTRAINT FK_TrangBi_ThietBi FOREIGN KEY(MaTB)
REFERENCES ThietBi (MaTB)
GO
--==============================================================================================================
ALTER TABLE TrangBi CHECK CONSTRAINT FK_TrangBi_ThietBi
GO
--==============================================================================================================
ALTER TABLE CTHDDV  WITH CHECK ADD  CONSTRAINT CHK_SoLuong_CTHDDV CHECK  ((SoLuong>=(0)))
GO
--==============================================================================================================
ALTER TABLE CTHDDV CHECK CONSTRAINT CHK_SoLuong_CTHDDV
GO
--==============================================================================================================
ALTER TABLE LoaiPhong  WITH CHECK ADD  CONSTRAINT CHK_SucChua_LoaiPhong CHECK  ((SucChua>=(0)))
GO
--==============================================================================================================
ALTER TABLE LoaiPhong CHECK CONSTRAINT CHK_SucChua_LoaiPhong
GO
--==============================================================================================================
ALTER TABLE PhieuDat  WITH CHECK ADD  CONSTRAINT CHK_SoLuongKH_PhieuDat CHECK  ((SoLuongKH>=(1)))
GO
--==============================================================================================================
ALTER TABLE PhieuDat CHECK CONSTRAINT CHK_SoLuongKH_PhieuDat
GO
--==============================================================================================================
ALTER TABLE TrangBi  WITH CHECK ADD  CONSTRAINT CHK_SL_TrangBi CHECK  ((SL>=(0)))
GO
--==============================================================================================================
ALTER TABLE TrangBi CHECK CONSTRAINT CHK_SL_TrangBi
GO
--==============================================================================================================




--SELECT * FROM dbo.func_FindDichVuTheoLoai(N'tôm',N'MÓN CHÍNH')
CREATE PROCEDURE AddCTHDDV
    @maHDDV INT,
    @maDV INT,
    @sl INT
AS
BEGIN
    BEGIN TRANSACTION;
	-- Kiểm tra xem chi tiết hóa đơn đã tồn tại hay chưa
    IF EXISTS (SELECT 1 FROM CTHDDV WHERE MaHDDV = @maHDDV AND MaDV = @maDV)
    BEGIN
        -- Nếu tồn tại, cập nhật số lượng
        UPDATE CTHDDV
        SET SoLuong = SoLuong + @sl
        WHERE MaHDDV = @maHDDV AND MaDV = @maDV;
    END
    ELSE
    BEGIN
        -- Nếu không tồn tại, thêm chi tiết hóa đơn mới
        INSERT INTO CTHDDV(MaHDDV, MaDV, SoLuong)
        VALUES (@maHDDV, @maDV, @sl);
    END

    -- Tính lại tổng tiền hóa đơn
    DECLARE @tongTien  Int;
    SELECT @tongTien = SUM(SoLuong * DV.Gia )
    FROM CTHDDV CT
	INNER JOIN DichVu DV ON CT.MaDV = DV.MaDV 
    WHERE MaHDDV = @maHDDV;

    -- Cập nhật tổng tiền vào bảng hóa đơn
    UPDATE HDDichVu
    SET TongTien = @tongTien
    WHERE MaHDDV = @maHDDV;

    COMMIT TRANSACTION;
END;
GO
--==============================================================================================================




CREATE PROCEDURE AddHDDV
AS
BEGIN
    INSERT INTO HDDichVu
    VALUES (0);
END;
GO
--==============================================================================================================




CREATE PROCEDURE DeleteCTHDDV
    @maHDDV INT,
    @maDV INT
AS
BEGIN
    BEGIN TRANSACTION;

    -- Cập nhật chi tiết hóa đơn
    DELETE CTHDDV
    WHERE MaHDDV= @maHDDV AND MaDV= @maDV;

    -- Tính lại tổng tiền hóa đơn
    DECLARE @tongTien  Int;
    SELECT @tongTien = COALESCE(SUM(CT.SoLuong * DV.Gia), 0)
    FROM CTHDDV CT
	INNER JOIN DichVu DV ON CT.MaDV = DV.MaDV 
    WHERE MaHDDV = @maHDDV;

    -- Cập nhật tổng tiền vào bảng hóa đơn
    UPDATE HDDichVu
    SET TongTien = @tongTien
    WHERE MaHDDV = @maHDDV;

    COMMIT TRANSACTION;
END;
GO
--==============================================================================================================




CREATE PROCEDURE DeleteHDDV
	@maHDDV INT
AS
BEGIN
    DELETE FROM HDDichVu WHERE MaHDDV=@maHDDV
END;
GO
--==============================================================================================================




CREATE PROC PROC_DsDichVu 
AS
BEGIN
    -- Thân của stored procedure
    SELECT MaDV, TenDV, Gia, GhiChu
    FROM DichVu DV;
END;
GO
--==============================================================================================================




CREATE PROCEDURE PROC_THONGKE_SOLUONG_DICHVU
    @QUARTER INT,
    @YEAR INT
AS
BEGIN
    DECLARE @ResultTable TABLE
    (
        Month INT,
        quantity INT
    )

    SELECT 
        MONTH(H.NgayLap) AS Month,
        COUNT(MaHDDV) AS quantity
    FROM 
        HoaDon H
    WHERE 
        (@QUARTER = -1 OR 
         (@QUARTER <> -1 AND 
          ((@QUARTER = 1 AND MONTH(H.NgayLap) BETWEEN 1 AND 3) OR 
           (@QUARTER = 2 AND MONTH(H.NgayLap) BETWEEN 4 AND 6) OR 
           (@QUARTER = 3 AND MONTH(H.NgayLap) BETWEEN 7 AND 9) OR 
           (@QUARTER = 4 AND MONTH(H.NgayLap) BETWEEN 10 AND 12))))
        AND (@YEAR = -1 OR YEAR(H.NgayLap) = @YEAR)
    GROUP BY 
        MONTH(H.NgayLap)

    INSERT INTO @ResultTable
    SELECT * FROM @ResultTable

END
GO
--==============================================================================================================





CREATE PROCEDURE PROC_THONGKE_SOLUONG_DON
    @QUARTER INT,
    @NAM INT
AS
BEGIN
    DECLARE @ResultTable TABLE
    (
        Month INT,
        Quantity DECIMAL(18, 2)
    )

    DECLARE @StartMonth INT, @EndMonth INT
    SET @StartMonth = CASE 
                        WHEN @QUARTER = -1 THEN 1 
                        ELSE (@QUARTER - 1) * 3 + 1 
                     END
    SET @EndMonth = CASE 
                        WHEN @QUARTER = -1 THEN 12 
                        ELSE @QUARTER * 3 
                     END

    INSERT INTO @ResultTable ( Month, Quantity)
    SELECT 
        MONTH(NgayLap) AS Month, 
        COUNT(*) AS Quantity
    FROM 
        HoaDon
    WHERE 
        (@QUARTER = -1 OR (@QUARTER <> -1 AND MONTH(NgayLap) BETWEEN @StartMonth AND @EndMonth))
        AND (@NAM = -1 OR (@NAM <> -1 AND YEAR(NgayLap) = @NAM))
    GROUP BY 
        YEAR(NgayLap), MONTH(NgayLap)
    HAVING 
        YEAR(NgayLap) IS NOT NULL;

    SELECT Month, Quantity
    FROM @ResultTable
    ORDER BY  Month
END
GO
--==============================================================================================================





CREATE PROCEDURE PROC_THONGKE_SOLUONG_TIEC
    @QUARTER INT,
    @YEAR INT
AS
BEGIN
    DECLARE @ResultTable TABLE
    (
        Month INT,
        quantity INT
    )

    DECLARE @StartMonth INT, @EndMonth INT
    SET @StartMonth = CASE WHEN @QUARTER = -1 THEN 1 ELSE (@QUARTER - 1) * 3 + 1 END
    SET @EndMonth = CASE WHEN @QUARTER = -1 THEN 12 ELSE @QUARTER * 3 END

    WHILE @StartMonth <= @EndMonth
    BEGIN
        INSERT INTO @ResultTable (Month, quantity)
        SELECT 
            MONTH(H.NgayLap),
            COUNT(T.MaTiec) AS quantity
        FROM 
            HoaDon H
        LEFT JOIN 
            PhieuDat P ON H.MaPhieuDat = P.MaPhieu
        LEFT JOIN 
            Tiec T ON P.MaTiec = T.MaTiec
        WHERE 
            MONTH(H.NgayLap) = @StartMonth
            AND (@YEAR = -1 OR (@YEAR <> -1 AND YEAR(NgayLap) = @YEAR))
        GROUP BY 
            MONTH(H.NgayLap)

        SET @StartMonth = @StartMonth + 1
    END

    SELECT * FROM @ResultTable
END
GO
--==============================================================================================================




CREATE PROCEDURE PROC_THONGKE_TONGTIEN_DON
    @QUARTER INT,
    @NAM INT
AS
BEGIN
    DECLARE @ResultTable TABLE
    (
        Month INT,
        Total DECIMAL(18, 2)
    )

    DECLARE @StartMonth INT, @EndMonth INT
    SET @StartMonth = CASE 
                        WHEN @QUARTER = -1 THEN 1 
                        ELSE (@QUARTER - 1) * 3 + 1 
                     END
    SET @EndMonth = CASE 
                        WHEN @QUARTER = -1 THEN 12 
                        ELSE @QUARTER * 3 
                     END

    INSERT INTO @ResultTable ( Month, Total)
    SELECT 
        MONTH(NgayLap) AS Month, 
        SUM(TongTien) AS TONGTIEN
    FROM 
        HoaDon
    WHERE 
        (@QUARTER = -1 OR (@QUARTER <> -1 AND MONTH(NgayLap) BETWEEN @StartMonth AND @EndMonth))
        AND (@NAM = -1 OR (@NAM <> -1 AND YEAR(NgayLap) = @NAM))
    GROUP BY 
        YEAR(NgayLap), MONTH(NgayLap)
    HAVING 
        YEAR(NgayLap) IS NOT NULL;

    SELECT  Month, Total
    FROM @ResultTable
    ORDER BY  Month
END
GO
--==============================================================================================================




CREATE PROC SHOW_DsCtHdDVTheoIdHd @IdHoaDonDV int
AS
	select MaHDDV,DV.MaDV, TenDV, SoLuong, Gia 
	from CTHDDV CT 
	INNER JOIN DichVu DV ON CT.MaDV = DV.MaDV 
	WHERE MaHDDV = @IdHoaDonDV
GO
--==============================================================================================================




CREATE PROCEDURE UpdateCTHDDV
    @maHDDV INT,
    @maDV INT,
    @sl INT
AS
BEGIN
    BEGIN TRANSACTION;

    -- Cập nhật chi tiết hóa đơn
    UPDATE CTHDDV
	SET SoLuong=@sl
    WHERE MaHDDV= @maHDDV AND MaDV= @maDV;

    -- Tính lại tổng tiền hóa đơn
    DECLARE @tongTien  Int;
    SELECT @tongTien = SUM(SoLuong * DV.Gia )
    FROM CTHDDV CT
	INNER JOIN DichVu DV ON CT.MaDV = DV.MaDV 
    WHERE MaHDDV = @maHDDV;

    -- Cập nhật tổng tiền vào bảng hóa đơn
    UPDATE HDDichVu
    SET TongTien = @tongTien
    WHERE MaHDDV = @maHDDV;

    COMMIT TRANSACTION;
END;
GO
--==============================================================================================================
