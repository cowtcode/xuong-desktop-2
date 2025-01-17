﻿Drop DATABASE DuAn1_Poly5
CREATE DATABASE DuAn1_Poly2;
GO
USE DuAn1_Poly2;
GO
CREATE TABLE NhanVien (
  MaNV NVARCHAR(20) PRIMARY KEY,
  TenNV NVARCHAR(50),
  MatKhau NVARCHAR(50),
  GioiTinh BIT,
  NgaySinh DATE,
  VaiTro BIT,
  Email NVARCHAR(50),
  GhiChu NVARCHAR(50)
);

-- thêm dữ liệu cho bảng nhân viên
INSERT INTO NhanVien (MaNV, TenNV, MatKhau, GioiTinh, NgaySinh, VaiTro, Email, GhiChu) VALUES 
(N'NV001', 'Admin', '123456', 0, '2003-01-01', 1, N'Admin@gmail.com', N'Quản lý'),
(N'NV002', 'Nunv', '654321', 1, '2004-05-10', 1, N'nu@gmail.com', N'Quản lý'),
(N'NV003', 'Baonv', 'abcdef', 0, '2002-03-15', 0, N'bao@gmail.com', N'Nhân viên '),
(N'NV004', 'Truongnv', 'xyz123',0, '1994-07-20', 0, N'truong@gmail.com', N'Nhân viên '),
(N'NV005', 'Khangnv', 'qwerty',0, '1991-12-05', 0, N'khang@gmail.com', N'Nhân viên '),
(N'NV006', 'Tinnv', 'password', 0, '1993-08-30', 0, N'tin@gmail.com', N'Nhân viên '),
(N'NV007', 'Hoangnv', 'abc123', 0, '1996-06-25', 0, N'hoang@gmail.com', N'Nhân viên ')
;

INSERT INTO NhanVien (MaNV, TenNV, MatKhau, GioiTinh, NgaySinh, VaiTro, Email, GhiChu) VALUES 
(N'NV010', 'Admin', '123456', 0, '2003-01-01', 1, N'nguyenngocxuantruong2004@gmail.com', N'Quản lý');
hh

-- Tạo bảng Khách hàng
CREATE TABLE KhachHang (
  MaKH NVARCHAR(20) PRIMARY KEY,
  TenKH NVARCHAR(50),
  ThanhVien BIT,
  DiaChi NVARCHAR(50),
  SDT NVARCHAR(20),
  Email NVARCHAR(50),
  GhiChu NVARCHAR(50)
);

INSERT INTO KhachHang (MaKH, TenKH,ThanhVien, DiaChi, SDT, Email, GhiChu) VALUES
  ('KH001', N'Phạm văn Đồng',  1, N'Ha Noi', '0123456789', N'acb@gmail.com', N'Khách VJP'),
  ('KH002', N'Nguyễn Xuân Hoa',  0, N'Ho Chi Minh', '0987654321',N'Akk@gmail.com', N'Khách tiềm năng'),
  ('KH003', N'Đại Thất Bé',  1, N'Da Nang', '0123456789', N'min@gmail.com', N'Khách tiềm năng'),
  ('KH004', N'Phan Như Ngọc ',  0, N'Hai Phong', '0987654321', N'uin@gmail.com', N'Khách tiềm năng'),
  ('KH005', N'Hoàng Lưu Trung',  1, N'Can Tho', '0123456789', N'bvn@gmail.com', N'Khách tiềm năng'),
  ('KH006', N'Võ Hoa Đào',  0, N'Hue', '0987654321', N'asn@gmail.com', N'Khách tiềm năng'),
  ('KH007', N'Trương Văn Bích',  1, N'Quang Ninh', '0123456789',N'cc@gmail.com', N'Khách kì cựu'),
  ('KH008', N'Ngô Hà Thi',  0, N'Bac Giang', '0987654321',N'vlc@gmail.com', N'Khách tiềm năng'),
  ('KH009', N'Đăng Nhất Bảng',  1, N'Vinh Phuc', '0123456789', N'ghs@gmail.com', N'Khách kì cựu'),
  ('KH010', N'Bùi Hữu Duyên',  0, N'Yen Bai', '0987654321', N'ren@gmail.com', N'Khách tiềm năng'),
  ('KH011', N'Lê Văn Lợi',  1, N'Lang Son', '0123456789', N'ksj@gmail.com', N'Khách kì cựu'),
  ('KH012', N'Nguyễn Thị Tuyết', 0, N'Phu Tho', '0987654321', N'asn@gmail.com', N'Khách tiềm năng'),
  ('KH013', N'Trần Hoàng Hồ',  1, N'Thai Nguyen', '0123456789', N'rrmin@gmail.com', N'Khách kì cựu'),
  ('KH014', N'Lê Thị Mai',0, N'Nam Dinh', '0987654321',N'ooin@gmail.com', N'Khách tiềm năng'),
  ('KH015', N'Nguyễn Như Ngọc',  1, N'Thanh Hoa', '0123456789',N'yyn@gmail.com', N'Khách kì cựu');
  
CREATE TABLE LoaiSanPham (
  MaLoaiSP NVARCHAR(20) PRIMARY KEY,
  TenLoaiSanPham NVARCHAR(50)
);

-- thêm dữ liệu cho bảng Loại sản phẩm 
INSERT INTO LoaiSanPham (MaLoaiSP, TenLoaiSanPham) VALUES
(N'LSP001',N'Giày thể thao '),
(N'LSP002',N'Giày Loafer'),
(N'LSP003',N'Giày Seaker'),
(N'LSP004',N'Giày cao gót'),
(N'LSP005',N'Giày Sandal nữ'),
(N'LSP006',N'Giày đi trong nhà')
;
-- Tạo bảng Sản phẩm
CREATE TABLE SanPham (
  MaSP NVARCHAR(20) PRIMARY KEY,
  TenSP NVARCHAR(50),
  MaLoaiSP NVARCHAR(20),
  Size NVARCHAR(20),
  GiaBan DECIMAL(10, 2),
  HinhAnh NVARCHAR(50),
  GhiChu NVARCHAR(50),
  FOREIGN KEY (MaLoaiSP) REFERENCES LoaiSanPham(MaLoaiSP)
);

-- Thêm dữ liệu vào bảng sản phẩm
INSERT INTO SanPham (MaSP, TenSP, MaLoaiSP, Size, GiaBan, HinhAnh, GhiChu)
VALUES
('SP001', N'Giày thể thao nam', N'LSP001', '34', 300000, N'giay_thethao_nam.jpg', N'Hàng mới về'),
('SP002', N'Giày thể thao nữ', N'LSP001', '44', 150000, N'giay_thethao_nu.jpg', N'Hàng mới về'),
('SP003', N'Giày thể thao học sinh', N'LSP001', '35', 150000, N'giay_thethao_hs.jpg', N'Hàng mới về'),
('SP004', N'Giày Penny Loafer', N'LSP002', '41', 150000, N'giay_Penny_Loafer.jpg', N'Hàng mới về'),
('SP005', N'Giày Tassel Loafer', N'LSP002', '40', 200000,  N'giay_Tassel_Loafer.jpg', N'Hàng chưa về'),
('SP006', N'Giày Horsebit Loafer', N'LSP002', '30', 450000, N'giay_Horsebit_Loafer.jpg', N'Hàng mới về'),
('SP007', N'Giày Slipper Loafer', N'LSP002', '45', 250000, N'giay_Slipper_Loafer.jpg', N'Hàng mới về'),
('SP008', N'Giày Sneaker High – top', N'LSP003', '34', 750000, N'giay_Sneaker_High_top.jpg', N'Hàng mới về'),
('SP009', N'Giày Sneaker Mule', N'LSP003', '33', 220000, N'giay_Sneaker_Mule.jpg', N'Hàng mới về'),
('SP0010', N'Giày Sneaker Low – top', N'LSP003', '44', 550000, N'giay_Sneaker_Low_top.jpg', N'Hàng mới về');

-- Tạo bảng Hóa đơn
CREATE TABLE HoaDon (
  MaHD NVARCHAR(20) PRIMARY KEY,
  MaNV NVARCHAR(20),
  MaKH NVARCHAR(20),
  MaSP NVARCHAR(20),
  TenSP NVARCHAR(50),
  DonGia  DECIMAL(10, 2),
  Soluong INT,
  ThanhTien DECIMAL(10, 2),
  HinhAnh NVARCHAR(50),
  FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
  FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
  FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

INSERT INTO HoaDon (MaHD, MaNV, MaKH, MaSP, TenSP, DonGia, Soluong, ThanhTien, HinhAnh)
VALUES
('HD001', 'NV001', 'KH001', 'SP001', N'Giày thể thao nam', 300000, 1, 300000, N'giay_thethao_nam.jpg'),
('HD002', 'NV002', 'KH002', 'SP002', N'Giày thể thao nữ', 150000, 2, 300000, N'giay_thethao_nu.jpg'),
('HD003', 'NV003', 'KH003', 'SP003', N'Giày thể thao học sinh', 150000, 1, 150000, N'giay_thethao_hs.jpg'),
('HD004', 'NV004', 'KH004', 'SP004', N'Giày Penny Loafer', 150000, 1, 150000, N'giay_Penny_Loafer.jpg'),
('HD005', 'NV005', 'KH005', 'SP005', N'Giày Tassel Loafer', 200000, 1, 200000, N'giay_Tassel_Loafer.jpg');

INSERT INTO HoaDon (MaHD,  MaKH, MaSP, TenSP, DonGia, Soluong, ThanhTien, HinhAnh)
VALUES
('HD006', 'KH001', 'SP001', N'Giày thể thao nam', 300000, 1, 300000, N'giay_thethao_nam.jpg');

SELECT * FROM HoaDon

SELECT * FROM HoaDon WHERE MaHD = 'HD006'
UPDATE HoaDon SET MaSP = ? , TenSP = ?, Soluong = ?, DonGia, MaKH = ?,ThanhTien = ? WHERE MaHD =?
UPDATE HoaDon
SET MaSP = 'SP002'
WHERE MaHD = 'HD006';

DELETE FROM HoaDon WHERE MaHD='HD006';