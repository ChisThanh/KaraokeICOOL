USE master
GO
DROP DATABASE KaraokeICOOL

CREATE DATABASE KaraokeICOOL
GO 
USE KaraokeICOOL

GO
CREATE TABLE TaiKhoan(
	MaTK INT IDENTITY(1,1),
	TenDangNhap VARCHAR(255) NOT NULL,
	MatKhau VARCHAR(255) NOT NULL,
	Loai NVARCHAR(255) NOT NULL,
	CONSTRAINT PK_TaiKhoan PRIMARY KEY (MaTK ),
);

--====================================================================================================---
CREATE TABLE NhanVien (
	MaNV INT IDENTITY(1,1),
	HoTen  NVARCHAR(255) NOT NULL,
	NgaySinh DATE NOT NULL,
	GioiTinh NVARCHAR(5) NOT NULL,
	DiaChi  NVARCHAR(255) NOT NULL,
	SoDienThoai VARCHAR(11) NOT NULL,
	Email VARCHAR(100),
	MaTK INT NOT NULL,
	CONSTRAINT PK_NhanVien PRIMARY KEY (MaNV),
	CONSTRAINT FK_NhanVien_TaiKhoan FOREIGN KEY (MaTK) REFERENCES TaiKhoan(MaTK)
);

--====================================================================================================---
CREATE TABLE LoaiPhong (
    MaLoai INT IDENTITY(1,1),
    TenLoai NVARCHAR(50) NOT NULL,
    SucChua INT NOT NULL,
	CONSTRAINT PK_LoaiPhong PRIMARY KEY (MaLoai),
	CONSTRAINT CHK_SucChua_LoaiPhong CHECK(SucChua >= 0),
);


--====================================================================================================---
CREATE TABLE Phong (
    MaPhong INT IDENTITY(1,1),
    TenPhong NVARCHAR(100) NOT NULL,
    MaLoai INT NOT NULL,
	TrangThai NVARCHAR(100),
	CONSTRAINT PK_Phong PRIMARY KEY (MaPhong),
    CONSTRAINT PK_Phong_LoaiPhong FOREIGN KEY (MaLoai) REFERENCES LoaiPhong(MaLoai)
);

--====================================================================================================---
CREATE TABLE ThietBi (
    MaTB INT IDENTITY(1,1),
    TenTB NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_ThietBi PRIMARY KEY (MaTB),
);

--====================================================================================================---
CREATE TABLE TrangBi (
    MaPhong INT,
    MaTB INT,
    SL INT NOT NULL,
    TrangThai NVARCHAR(100),
	CONSTRAINT PK_TrangBi PRIMARY KEY (MaPhong,MaTB),
    CONSTRAINT FK_TrangBi_Phong FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong),
    CONSTRAINT FK_TrangBi_ThietBi FOREIGN KEY (MaTB) REFERENCES ThietBi(MaTB),
	CONSTRAINT CHK_SL_TrangBi CHECK(SL >= 0),
);

--====================================================================================================---
CREATE TABLE DichVu (
    MaDV INT IDENTITY(1,1),
    TenDV NVARCHAR(100) NOT NULL,
    Anh VARCHAR(255),
	Gia BIGINT NOT NULL,
    GhiChu NVARCHAR(255),
	CONSTRAINT PK_DichVu PRIMARY KEY (MaDV),
);

--====================================================================================================---
CREATE TABLE Tiec (
    MaTiec INT IDENTITY(1,1),
    TenTiec NVARCHAR(100) NOT NULL,
    MoTa NVARCHAR(255),
	CONSTRAINT PK_Tiec PRIMARY KEY (MaTiec),
);

--====================================================================================================---
CREATE TABLE PhieuPhat (
    MaPhieuPhat INT IDENTITY(1,1),
    TienPhat BIGINT NOT NULL,
    MoTa NVARCHAR(255) NOT NULL,
	CONSTRAINT PK_PhieuPhat PRIMARY KEY (MaPhieuPhat),
);

--====================================================================================================---
CREATE TABLE PhieuDat (
    MaPhieu INT IDENTITY(1,1),
    NgayDat DATE NOT NULL,
    NgayNhan DATE NOT NULL,
    LoaiPhieu NVARCHAR(255) NOT NULL,
    HoTenKH NVARCHAR(100) NOT NULL,
    CMND VARCHAR(20) NOT NULL,
	SoDienThoai VARCHAR(11) NOT NULL, 
    SoLuongKH INT NOT NULL,
    TinhTrang NVARCHAR(50) NOT NULL,
	TienCoc BIGINT,
    PhiTiec BIGINT,
    MaTiec INT,
	MaPhong INT,
	CONSTRAINT PK_PhieuDat PRIMARY KEY (MaPhieu),
	CONSTRAINT FK_PhieuDat_Phong FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong),
	CONSTRAINT FK_PhieuDat_Tiec FOREIGN KEY (MaTiec) REFERENCES Tiec(MaTiec),
	CONSTRAINT CHK_SoLuongKH_PhieuDat CHECK(SoLuongKH >= 1),
);
--====================================================================================================---

CREATE TABLE HDDichVu (
    MaHDDV INT IDENTITY(1,1),
    TongTien BIGINT,
	CONSTRAINT PK_HDDichVu PRIMARY KEY (MaHDDV),
);

--====================================================================================================---
CREATE TABLE CTHDDV (
    MaHDDV INT,
    MaDV INT,
    SoLuong INT NOT NULL,
    CONSTRAINT PK_CTHDDV PRIMARY KEY (MaHDDV, MaDV),
    CONSTRAINT FK_CTHDDV_HDDichVu FOREIGN KEY (MaHDDV) REFERENCES HDDichVu(MaHDDV),
    CONSTRAINT FK_CTHDDV_DichVu FOREIGN KEY (MaDV) REFERENCES DichVu(MaDV),
	CONSTRAINT CHK_SoLuong_CTHDDV CHECK(SoLuong >= 0),
	
);
--====================================================================================================---
CREATE TABLE HoaDon (
    MaHD INT IDENTITY(1,1),
    MaNV INT NOT NULL,
	GioVao DATETIME NOT NULL,
	GioRa DATETIME NOT NULL,
    TongTien BIGINT,
    NgayLap DATE NOT NULL,
    MaPhieuPhat INT,
    MaHDDV INT,
    MaPhieuDat INT,
	CONSTRAINT PK_HoaDon PRIMARY KEY (MaHD),
    CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    CONSTRAINT FK_HoaDon_PhieuPhat FOREIGN KEY (MaPhieuPhat) REFERENCES PhieuPhat(MaPhieuPhat),
	CONSTRAINT FK_HoaDon_HDDichVu FOREIGN KEY (MaHDDV) REFERENCES HDDichVu(MaHDDV),
    CONSTRAINT FK_HoaDon_PhieuDat FOREIGN KEY (MaPhieuDat) REFERENCES PhieuDat(MaPhieu)
);
GO
INSERT INTO TaiKhoan VALUES ('admin','admin@123',N'Admin')
INSERT INTO TaiKhoan VALUES ('quanly1','123456',N'Quản lý')
INSERT INTO TaiKhoan VALUES ('quanly2','123456',N'Quản lý')
INSERT INTO TaiKhoan VALUES ('tieptan1','123456',N'Tiếp tân')
INSERT INTO TaiKhoan VALUES ('tieptan2','123456',N'Tiếp tân')
INSERT INTO TaiKhoan VALUES ('phucvu1','123456',N'Phục vụ')
INSERT INTO TaiKhoan VALUES ('phucvu2','123456',N'Phục vụ')
GO

SET DATEFORMAT DMY
INSERT INTO NhanVien VALUES (N'Vũ Văn Anh','13/02/2003',N'Nam',N'Tây Thạnh, Tân Phú, Thành phố Hồ Chí Minh','0393222222','fashionshop@gmail.com',1)
INSERT INTO NhanVien VALUES (N'Hà Tri Thủy','17/01/2003',N'Nam',N'Tân Sơn Nhì, Tân Phú, Thành phố Hồ Chí Minh','0967327941','hatrithuy@gmail.com',2)
INSERT INTO NhanVien VALUES (N'Nguyễn Văn Chí Thanh','07/04/2003',N'Nam',N'Phường 7, Quận 5, Thành phố Hồ Chí Minh, Việt Nam','0393555222','chithanh@gmail.com',3)
INSERT INTO NhanVien VALUES (N'Nguyễn Bảo Long','20/11/2000',N'Nam',N'212-242 Đ. Độc Lập, Tân Thành, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam','0393666222','nguyenbaolong@gmail.com',4)
INSERT INTO NhanVien VALUES (N'Nguyễn Lê Huyền Trang','14/03/1998',N'Nữ',N'Bình Hưng Hòa A, Bình Hưng Hoà A, Bình Tân, Thành phố Hồ Chí Minh, Việt Nam','0393777222','trangnguyen14@gmail.com',5)
INSERT INTO NhanVien VALUES (N'Huỳnh Thái Cường','21/06/2000',N'Nam',N'131 Đ. 26/3, Bình Hưng Hoà, Bình Tân, Thành phố Hồ Chí Minh, Việt Nam','0393000222','cuonghuynh21@gmail.com',6)
INSERT INTO NhanVien VALUES (N'Huỳnh Tuấn Khang','21/06/2003',N'Nam',N'131 Đ. 26/3, Bình Hưng Hoà, Bình Tân, Thành phố Hồ Chí Minh, Việt Nam','0355974560','huynhkhang@gmail.com',7)
GO
INSERT INTO LoaiPhong VALUES (N'Thường - Nhỏ',5)
INSERT INTO LoaiPhong VALUES (N'Thường - Trung',10)
INSERT INTO LoaiPhong VALUES (N'Thường - Lớn',20)
INSERT INTO LoaiPhong VALUES (N'VIP - Nhỏ',5)
INSERT INTO LoaiPhong VALUES (N'VIP - Trung',10)
INSERT INTO LoaiPhong VALUES (N'VIP - Lớn',20)
GO
--INSERT INTO Phong
INSERT INTO Phong VALUES (N'Phòng 1',1,N'Trống')
INSERT INTO Phong VALUES (N'Phòng 2',2,N'Trống')
INSERT INTO Phong VALUES (N'Phòng 3',3,N'Trống')
INSERT INTO Phong VALUES (N'Phòng 4',4,N'Trống')
INSERT INTO Phong VALUES (N'Phòng 5',5,N'Trống')
INSERT INTO Phong VALUES (N'Phòng 6',6,N'Trống')
INSERT INTO Phong VALUES (N'Phòng 7',1,N'Trống')
INSERT INTO Phong VALUES (N'Phòng 8',2,N'Trống')
INSERT INTO Phong VALUES (N'Phòng 9',3,N'Trống')
INSERT INTO Phong VALUES (N'Phòng 10',4,N'Trống')
INSERT INTO Phong VALUES (N'Phòng 11',5,N'Trống')
INSERT INTO Phong VALUES (N'Phòng 12',6,N'Trống')

--INSERT INTO ThietBi
GO
INSERT INTO ThietBi VALUES (N'Đầu Karaoke')
INSERT INTO ThietBi VALUES (N'Loa Karaoke')
INSERT INTO ThietBi VALUES (N'Amply')
INSERT INTO ThietBi VALUES (N'Loa Sub')
INSERT INTO ThietBi VALUES (N'Micro')
INSERT INTO ThietBi VALUES (N'Màn hình karaoke BTE')
INSERT INTO ThietBi VALUES (N'Màn hình karaoke Hanet')
INSERT INTO ThietBi VALUES (N'Smart TV 43 inch')
INSERT INTO ThietBi VALUES (N'Smart TV 65 inch 4K')

--INSERT INTO TrangBi
GO
INSERT INTO TrangBi VALUES (1,1,1,N'Bình thường')
INSERT INTO TrangBi VALUES (1,2,1,N'Bình thường')
INSERT INTO TrangBi VALUES (1,3,1,N'Bình thường')
INSERT INTO TrangBi VALUES (1,4,1,N'Bình thường')
INSERT INTO TrangBi VALUES (1,5,2,N'Bình thường')
INSERT INTO TrangBi VALUES (1,6,1,N'Bình thường')
INSERT INTO TrangBi VALUES (1,8,1,N'Bình thường')

INSERT INTO TrangBi VALUES (2,1,1,N'Bình thường')
INSERT INTO TrangBi VALUES (2,2,2,N'Bình thường')
INSERT INTO TrangBi VALUES (2,3,1,N'Bình thường')
INSERT INTO TrangBi VALUES (2,4,2,N'Bình thường')
INSERT INTO TrangBi VALUES (2,5,4,N'Bình thường')
INSERT INTO TrangBi VALUES (2,6,1,N'Bình thường')
INSERT INTO TrangBi VALUES (2,8,1,N'Bình thường')

INSERT INTO TrangBi VALUES (3,1,1,N'Bình thường')
INSERT INTO TrangBi VALUES (3,2,3,N'Bình thường')
INSERT INTO TrangBi VALUES (3,3,1,N'Bình thường')
INSERT INTO TrangBi VALUES (3,4,1,N'Hư hỏng')
INSERT INTO TrangBi VALUES (3,5,8,N'Bình thường')
INSERT INTO TrangBi VALUES (3,6,1,N'Bình thường')
INSERT INTO TrangBi VALUES (3,8,1,N'Bình thường')

INSERT INTO TrangBi VALUES (4,1,1,N'Bình thường')
INSERT INTO TrangBi VALUES (4,2,2,N'Bình thường')
INSERT INTO TrangBi VALUES (4,3,1,N'Bình thường')
INSERT INTO TrangBi VALUES (4,4,2,N'Bình thường')
INSERT INTO TrangBi VALUES (4,5,4,N'Bình thường')
INSERT INTO TrangBi VALUES (4,7,1,N'Bình thường')
INSERT INTO TrangBi VALUES (4,9,1,N'Bình thường')

INSERT INTO TrangBi VALUES (5,1,1,N'Bình thường')
INSERT INTO TrangBi VALUES (5,2,2,N'Bình thường')
INSERT INTO TrangBi VALUES (5,3,1,N'Bình thường')
INSERT INTO TrangBi VALUES (5,4,3,N'Bình thường')
INSERT INTO TrangBi VALUES (5,5,5,N'Bình thường')
INSERT INTO TrangBi VALUES (5,7,1,N'Bình thường')
INSERT INTO TrangBi VALUES (5,9,1,N'Bình thường')

INSERT INTO TrangBi VALUES (6,1,1,N'Bình thường')
INSERT INTO TrangBi VALUES (6,2,3,N'Bình thường')
INSERT INTO TrangBi VALUES (6,3,1,N'Bình thường')
INSERT INTO TrangBi VALUES (6,4,3,N'Bình thường')
INSERT INTO TrangBi VALUES (6,5,10,N'Bình thường')
INSERT INTO TrangBi VALUES (6,7,1,N'Bình thường')
INSERT INTO TrangBi VALUES (6,9,1,N'Bình thường')

INSERT INTO TrangBi VALUES (7,1,1,N'Bình thường')
INSERT INTO TrangBi VALUES (7,2,2,N'Bình thường')
INSERT INTO TrangBi VALUES (7,3,1,N'Bình thường')
INSERT INTO TrangBi VALUES (7,4,1,N'Hư hỏng')
INSERT INTO TrangBi VALUES (7,5,2,N'Bình thường')
INSERT INTO TrangBi VALUES (7,6,1,N'Bình thường')
INSERT INTO TrangBi VALUES (7,8,1,N'Bình thường')

INSERT INTO TrangBi VALUES (8,1,1,N'Bình thường')
INSERT INTO TrangBi VALUES (8,2,2,N'Bình thường')
INSERT INTO TrangBi VALUES (8,3,1,N'Bình thường')
INSERT INTO TrangBi VALUES (8,4,2,N'Bình thường')
INSERT INTO TrangBi VALUES (8,5,4,N'Bình thường')
INSERT INTO TrangBi VALUES (8,6,1,N'Bình thường')
INSERT INTO TrangBi VALUES (8,8,1,N'Bình thường')

INSERT INTO TrangBi VALUES (9,1,1,N'Bình thường')
INSERT INTO TrangBi VALUES (9,2,3,N'Bình thường')
INSERT INTO TrangBi VALUES (9,3,1,N'Bình thường')
INSERT INTO TrangBi VALUES (9,4,2,N'Hư hỏng')
INSERT INTO TrangBi VALUES (9,5,8,N'Bình thường')
INSERT INTO TrangBi VALUES (9,6,1,N'Bình thường')
INSERT INTO TrangBi VALUES (9,8,1,N'Bình thường')

INSERT INTO TrangBi VALUES (10,1,1,N'Bình thường')
INSERT INTO TrangBi VALUES (10,2,2,N'Bình thường')
INSERT INTO TrangBi VALUES (10,3,1,N'Bình thường')
INSERT INTO TrangBi VALUES (10,4,2,N'Bình thường')
INSERT INTO TrangBi VALUES (10,5,4,N'Bình thường')
INSERT INTO TrangBi VALUES (10,7,1,N'Bình thường')
INSERT INTO TrangBi VALUES (10,9,1,N'Bình thường')

INSERT INTO TrangBi VALUES (11,1,1,N'Bình thường')
INSERT INTO TrangBi VALUES (11,2,2,N'Bình thường')
INSERT INTO TrangBi VALUES (11,3,1,N'Bình thường')
INSERT INTO TrangBi VALUES (11,4,3,N'Bình thường')
INSERT INTO TrangBi VALUES (11,5,5,N'Bình thường')
INSERT INTO TrangBi VALUES (11,7,1,N'Bình thường')
INSERT INTO TrangBi VALUES (11,9,1,N'Bình thường')

INSERT INTO TrangBi VALUES (12,1,1,N'Bình thường')
INSERT INTO TrangBi VALUES (12,2,2,N'Bình thường')
INSERT INTO TrangBi VALUES (12,3,1,N'Bình thường')
INSERT INTO TrangBi VALUES (12,4,3,N'Bình thường')
INSERT INTO TrangBi VALUES (12,5,10,N'Bình thường')
INSERT INTO TrangBi VALUES (12,7,1,N'Bình thường')
INSERT INTO TrangBi VALUES (12,9,1,N'Bình thường')
GO
--INSERT INTO DichVu

INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh) VALUES(N'Nước ép cam',65000,N'Nước ép','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Nước ép ổi',65000,N'Nước ép','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Nước ép dưa hấu',65000,N'Nước ép','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Nước ép nho',65000,N'Nước ép','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Nước ép bưởi',65000,N'Nước ép','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Nước chanh',55000,N'Nước','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Nước chanh muối',55000,N'Nước','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Cà phê đá',55000,N'Nước','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Cà phê sữa',55000,N'Nước','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Trà gừng mật ong',55000,N'Nước','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Trà Lipton bạc hà',55000,N'Nước','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Trà Lipton chanh',55000,N'Nước','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Sữa tươi cà phê',55000,N'Nước','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Soda chanh',55000,N'Nước','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Chanh mật ong',55000,N'Nước','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'Nước suối',35000,N'Nước','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'SÀI GÒN SPECIAL LON',35000,N'Bia','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'TIGER',35000,N'Bia','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'HEINEKEN',35000,N'Bia','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'STRONGBOW ',35000,N'Bia','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'CHILL COCKTAIL',35000,N'Bia','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'7 UP',35000,N'Nước ngọt','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'COCA',35000,N'Nước ngọt','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'PEPSI',35000,N'Nước ngọt','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'STING',35000,N'Nước ngọt','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'REDBULL',35000,N'Nước ngọt','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'MÌ XÀO NẤM BÒ',269000,N'CƠM MÌ CHÁO','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'MÌ XÀO HẢI SẢN',289000,N'CƠM MÌ CHÁO','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'CƠM CHIÊN TRỨNG CHÁY TỎI',199000,N'CƠM MÌ CHÁO','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'CƠM CHIÊN HẢI SẢN',239000,N'CƠM MÌ CHÁO','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'CƠM CHIÊN DƯA BÒ',289000,N'CƠM MÌ CHÁO','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'CHÁO BÒ NẤM ĐÔNG CÔ',289000,N'CƠM MÌ CHÁO','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'RAU CỦ XÀO THẬP CẨM',149000,N'MÓN CHÍNH','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'XÚC XÍCH NƯỚNG TIÊU',219000,N'MÓN CHÍNH','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'ẾCH SỐT MẮM',219000,N'MÓN CHÍNH','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'ẾCH SỐT TỪ XUYÊN',219000,N'MÓN CHÍNH','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'RAU CỦ XÀO THẬP CẨM',219000,N'MÓN CHÍNH','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'BÒ LÚC LẮC KHOAI TÂY',229000,N'MÓN CHÍNH','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'TÔM SỐT TRỨNG MUỐI',269000,N'MÓN CHÍNH','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'CHÂN GÀ SỐT TỬ XUYÊN',269000,N'MÓN CHÍNH','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'KHÔ MỰC XẺ RANG TỎI ỚT',295000,N'MÓN CHÍNH','khomucxe_rangtoi.jpg')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'KHÔ MỰC NƯỚNG',295000,N'MÓN CHÍNH','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'ĐUÔI HEO CHIÊN GIÒN KIỂU HÀN',289000,N'MÓN CHÍNH','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'KHOAI TÂY CHIÊN BƠ',119000,N'KHAI VỊ','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'CHẢ RAM TÔM',139000,N'KHAI VỊ','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'CHẢ GIÒ HẢI SẢN',139000,N'KHAI VỊ','chagiohaisan.jpg')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'CHÂN GÀ CHIÊN SẢ TẮC',149000,N'KHAI VỊ','sungarangmuoikieuhongkong.jpg')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'ĐẬU HỦ CHÀ BÔNG',159000,N'KHAI VỊ','dauhusottoiot.jpg')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'RĂNG MỰC CHIÊN GIÒN TỎI ỚT',169000,N'KHAI VỊ','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'KHÔ BÒ XẺ DĨA',179000,N'KHAI VỊ','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'BÁNH PATE TRỨNG CỦA ĐÓ',269000,N'KHAI VỊ','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'MALA BÒ MỘT NẮNG',289000,N'KHAI VỊ','')
INSERT INTO DichVu (TenDV,Gia,GhiChu,Anh)VALUES(N'MỤC CHIÊN BƠ TỎI',289000,N'KHAI VỊ','')
GO
--INSERT INTO Tiec 

INSERT INTO Tiec VALUES (N'Thuỷ Long',N'Liên hoan với set tiệc có các món như SOUP CUA TRỨNG CÚT, GỎI BÊ CÀ PHÁO, CHẲNG DỪNG RANG RIỀNG, MÌ Ý HẢI SẢN ĐÚT LÒ, LẨU CÁ TẰM MĂNG CHUA. Được trang trí với màu xanh da trời làm chủ đạo, màu của hy vọng, hoà bình, thanh thản ... ')
INSERT INTO Tiec VALUES (N'Tiên Long',N'Sinh nhật với set tiệc có các món như SOUP CUA TÓC TIÊN, TÔM CHIÊN PHỤNG HOÀNG, CƠM CHIÊN GÀ KẺ THỊT BACON, GỎI RAU CÀNG CUA BẮP BÒ, LẨU GÀ NẤM KIỂU NHẬT. Không gian được trang trí với sắc vàng là chủ đạo ..')
INSERT INTO Tiec VALUES (N'Vương Long',N'Tiệc tổng kết với set tiệc có các món như SOUP BÀO NGƯ, TÔM CÀNG RANG MUỐI, GỎI ĐU ĐỦ TRỘN TAI HEO, CƠM CHIÊN HẠT SEN, LẨU ĐUÔI BÒ HÀN QUỐC. Không gian với sắc đỏ chủ đạo với mong muốn càng nhận được nhiều may mắn...')
INSERT INTO Tiec VALUES (N'Thanh Long',N'Sinh nhật với set tiệc có các món như SOUP XÍU MẠI, GÀ ĐỐT Ô THUM, GỎI NGÓ SEN TÔM THỊT, CƠM CHIÊN TÔM CÀNG TRỨNG MUỐI, LẨU CÙ LAO. Không gian được trang trí với nhiều màu sắc tươi sáng...')
INSERT INTO Tiec VALUES (N'Vũ Long',N'Tiệc chia tay với set tiệc có các món như SOUP CÁ HỒI TRỨNG BẮC THẢO, GỎI KHOAI MÔN GÀ XÉ,CUA LỘT SỐT MALAYSIA, BÚN XÀO SINGAPORE, LẤU XÍ QUÁCH...')
GO
--INSERT INTO PhieuDat
SET DATEFORMAT DMY
INSERT INTO PhieuDat VALUES ('02/06/2023', '05/06/2023', N'Tiệc', N'Nguyễn Ngọc Ánh', '01234567893', '0909123455', 5, N'Đã nhận',600000,3000000,1,7)
INSERT INTO PhieuDat VALUES ('02/06/2023', '05/06/2023', N'Tiệc', N'Nguyễn Trần Anh', '01623456789', '0909123456', 10, N'Đã nhận',1000000,5000000,3,11)
INSERT INTO PhieuDat (NgayNhan,NgayDat,LoaiPhieu,HoTenKH,CMND,SoDienThoai,SoLuongKH,TinhTrang,MaPhong) VALUES ('02/06/2023', '06/06/2023', N'Phòng', N'Trần Thị Bình', '0987654321', '0912345678', 19, N'Đã nhận',9)
GO

--INSERT INTO PhieuPhat
INSERT INTO PhieuPhat VALUES (500000,N'Làm hỏng loa của quán')
GO
--INSERT INTO HDDichVu
INSERT INTO HDDichVu VALUES (5240000)
GO
--INSERT INTO CTHDDV
INSERT INTO CTHDDV VALUES (1,48,10)
INSERT INTO CTHDDV VALUES (1,41,10)
INSERT INTO CTHDDV VALUES (1,18,20)
GO
--INSERT INTO HoaDon
SET DATEFORMAT DMY
INSERT INTO HoaDon (MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuDat)VALUES (3,'2023-06-01 14:00', '2023-06-01 18:00', 3100000, '2023-06-01',1)
INSERT INTO HoaDon (MaNV, GioVao, GioRa, TongTien, NgayLap, MaPhieuDat)VALUES (4,'2023-06-02 10:00', '2023-06-02 15:00', 5125000, '2023-06-02',2)
INSERT INTO HoaDon VALUES (4,'2023-06-02 10:00','2023-06-02 15:00', 3000000, '2023-06-02', 1, 1, 3)
--====================================================================================================---
GO
CREATE PROC DsDichVu 
AS
	select MaDV,TenDV,Gia,GhiChu
	from DichVu DV
GO
--EXEC DsDichVu
--Exec sp_helptext 'DSHDDichVu'
GO
CREATE PROC SHOW_DsCtHdDVTheoIdHd @IdHoaDonDV int
AS
	select MaHDDV,DV.MaDV, TenDV, SoLuong, Gia 
	from CTHDDV CT 
	INNER JOIN DichVu DV ON CT.MaDV = DV.MaDV 
	WHERE MaHDDV = @IdHoaDonDV
go
--Exec SHOW_DsCtHdDVTheoIdHd 1
CREATE FUNCTION func_FindDichVu(@search varchar(255))
RETURNS TABLE
as
	return(select MaDV,TenDV,Gia,GhiChu
	from DichVu DV
	where (DV.TenDV  LIKE N'%' + @search + '%' ));
GO
--SELECT * FROM dbo.func_FindDichVu(N'tôm')
GO
CREATE FUNCTION func_FindDichVuTheoLoai(@search varchar(255),@ghichu varchar(255))
RETURNS TABLE
as
	return(select * 
	from DichVu DV
	where DV.TenDV  LIKE N'%' + @search + '%'
	AND GhiChu=@ghichu
	);
GO
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
CREATE PROCEDURE AddHDDV
AS
BEGIN
    INSERT INTO HDDichVu
    VALUES (0);
END;
GO
CREATE PROCEDURE DeleteHDDV
	@maHDDV INT
AS
BEGIN
    DELETE FROM HDDichVu WHERE MaHDDV=@maHDDV
END;
go
