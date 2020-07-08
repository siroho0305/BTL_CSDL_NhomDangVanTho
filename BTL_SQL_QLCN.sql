﻿CREATE DATABASE QUANLYCONGNHAN

DROP DATABASE QUANLYCONGNHAN

USE QUANLYCONGNHAN

--USE QLCN
CREATE TABLE LUONG(
	MaL varchar(9) PRIMARY KEY,
	HSL FLOAT NOT NULL,
	LuongCB FLOAT NOT NULL
)

CREATE TABLE XUONG(
	MaXuong varchar(9) PRIMARY KEY,
	TenX nvarchar(50) UNIQUE,
	DD Nvarchar(50),
)

CREATE TABLE KHO(
	MaK varchar(9) PRIMARY KEY,
	TenK nvarchar(50) UNIQUE,
	DiaChi nvarchar(100) NOT NULL
)

CREATE TABLE CONGNHAN(
	MaCN varchar(9) PRIMARY KEY,
	TenCN nvarchar(100) NOT NULL,
	Gioitinh nvarchar(3) CHECK (Gioitinh IN(N'Nữ', N'Nam')),
	Quequan nvarchar(100),
	MaL varchar(9) FOREIGN KEY (MaL) REFERENCES LUONG(MaL)
)

CREATE TABLE SANPHAM(
	MaSP varchar(9) PRIMARY KEY,
	TenSP nvarchar(50) UNIQUE,
	Loai nvarchar(20) NOT NULL,
	MaK varchar(9) FOREIGN KEY (Mak) REFERENCES KHO(MaK),
)

CREATE TABLE XUONG_SDT(
	 MaXuong varchar(9) FOREIGN KEY (MaXuong) REFERENCES XUONG(MaXuong) NOT NULL,
	 SDT varchar(10) NOT NULL
) 

CREATE TABLE CONGNHAN_XUONG(
	MaCN varchar(9) FOREIGN KEY (MaCN) REFERENCES CONGNHAN(MaCN) NOT NULL,
	MaXuong varchar(9) FOREIGN KEY (MaXuong) REFERENCES XUONG(MaXuong) NOT NULL
)

CREATE TABLE THANNHAN(
	MaCN varchar(9) FOREIGN KEY (MaCN) REFERENCES CONGNHAN(MaCN) NOT NULL,
	Ten nvarchar(100) NOT NULL,
	Gioitinh nvarchar(3) CHECK (Gioitinh IN(N'Nữ', N'Nam')),
	Ngaysinh DATE,
	Quanhe nvarchar(10) NOT NULL
)

CREATE TABLE CONGNHAN_SANPHAM(
	MaCN varchar(9) FOREIGN KEY (MaCN) REFERENCES CONGNHAN(MaCN) NOT NULL,
	MaSP varchar(9) FOREIGN KEY (MaSP) REFERENCES SANPHAM(MaSP) NOT NULL
)

alter table XUONG_SDT add constraint PK_XUONG_SDT primary key(MaXuong, SDT)
alter table CONGNHAN_XUONG add constraint PK_CONGNHAN_XUONG primary key(MaCN, MaXuong)
alter table THANNHAN add constraint PK_THANNHAN primary key(MaCN, Ten)

INSERT INTO LUONG VALUES('L1', 0.7, 1000)
INSERT INTO LUONG VALUES('L2', 2.0, 3500)
INSERT INTO LUONG VALUES('L3', 1.7, 1200)
INSERT INTO LUONG VALUES('L4', 0.9, 7600)
INSERT INTO LUONG VALUES('L5', 1.5, 5200)

INSERT INTO XUONG VALUES('X1', N'Xưởng A', N'Đăk Lăk')
INSERT INTO XUONG VALUES('X2', N'Xưởng B', N'Phú Yên')
INSERT INTO XUONG VALUES('X3', N'Xưởng C', N'Bình Định')
INSERT INTO XUONG VALUES('X4', N'Xưởng D', N'TP HCM')
INSERT INTO XUONG VALUES('X5', N'Xưởng E', N'Hà Nội')

INSERT INTO CONGNHAN VALUES('CN1', N'Lê Minh Thái', N'Nam', N'Bình Định', 'L5')
INSERT INTO CONGNHAN VALUES('CN7', N'Trần Thị Thuý Vân', N'Nữ', N'Huế', 'L3')
INSERT INTO CONGNHAN VALUES('CN2', N'Nguyễn Duy Thắng', N'Nam', N'Phú Yên', 'L3')
INSERT INTO CONGNHAN VALUES('CN3', N'Đặng Văn Thọ', N'Nam', N'Bình Định', 'L2')
INSERT INTO CONGNHAN VALUES('CN6', N'Trần Thị Thuý Kiều', N'Nữ', N'Huế', 'L4')
INSERT INTO CONGNHAN VALUES('CN4', N'Hồ Nguyễn Thanh Phong', N'Nam', N'TP HCM', 'L5')
INSERT INTO CONGNHAN VALUES('CN5', N'Nguyễn Thị Đào', N'Nữ', N'Tiền Giang', 'L1')
INSERT INTO CONGNHAN VALUES('CN9', N'Nguyễn Du', N'Nam', N'Quãng Ngãi', 'L1')
INSERT INTO CONGNHAN VALUES('CN11', N'Bill Gate', N'Nam', N'Hà Tĩnh', 'L4')
INSERT INTO CONGNHAN VALUES('CN8', N'Hồ Xuân Hương', N'Nữ', N'Hà Nội', 'L2')

INSERT INTO KHO VALUES('K1', N'Kho A', N'Đắk Lắk')
INSERT INTO KHO VALUES('K2', N'Kho B', N'Phú Yên')
INSERT INTO KHO VALUES('K3', N'Kho C', N'Bình Định')
INSERT INTO KHO VALUES('K4', N'Kho D', N'TP HCM')
INSERT INTO KHO VALUES('K5', N'KHo E', N'Hà Nội')

INSERT INTO SANPHAM VALUES('SP1', N'Aó', N'A1', 'K1')
INSERT INTO SANPHAM VALUES('SP2', N'Quần', N'Q1', 'K2')
INSERT INTO SANPHAM VALUES('SP3', N'Giày', N'G1', 'K3')
INSERT INTO SANPHAM VALUES('SP4', N'Túi xách', N'T1', 'K4')
INSERT INTO SANPHAM VALUES('SP5', N'Nước Hoa', N'N1', 'K5')

INSERT INTO THANNHAN VALUES('CN3', N'Đặng Văn Cha', N'Nam', 'july 7, 1978' , 'Cha')
INSERT INTO THANNHAN VALUES('CN6', N'Trần Văn Việt', N'Nam', 'june 23, 1983 ', 'Cha')
INSERT INTO THANNHAN VALUES('CN9', N'Nguyễn Thị Mộng', N'Nữ' , 'nov 11, 1964' , N'Mẹ')

INSERT INTO CONGNHAN_XUONG VALUES('CN1', 'X2')
INSERT INTO CONGNHAN_XUONG VALUES('CN2', 'X4')
INSERT INTO CONGNHAN_XUONG VALUES('CN3', 'X5')
INSERT INTO CONGNHAN_XUONG VALUES('CN4', 'X1')
INSERT INTO CONGNHAN_XUONG VALUES('CN5', 'X2')
INSERT INTO CONGNHAN_XUONG VALUES('CN6', 'X3')
INSERT INTO CONGNHAN_XUONG VALUES('CN7', 'X3')
INSERT INTO CONGNHAN_XUONG VALUES('CN8', 'X5')
INSERT INTO CONGNHAN_XUONG VALUES('CN9', 'X5')
INSERT INTO CONGNHAN_XUONG VALUES('CN11', 'X2')

INSERT INTO XUONG_SDT VALUES('X1', '0123456789' )
INSERT INTO XUONG_SDT VALUES('X2', '0112233445' )
INSERT INTO XUONG_SDT VALUES('X3', '0998877665' )
INSERT INTO XUONG_SDT VALUES('X4', '0101020203' )
INSERT INTO XUONG_SDT VALUES('X5', '0111111119' )

INSERT INTO CONGNHAN_SANPHAM VALUES('CN1', 'SP1')
INSERT INTO CONGNHAN_SANPHAM VALUES('CN1', 'SP3')
INSERT INTO CONGNHAN_SANPHAM VALUES('CN1', 'SP5')
INSERT INTO CONGNHAN_SANPHAM VALUES('CN2', 'SP2')
INSERT INTO CONGNHAN_SANPHAM VALUES('CN3', 'SP2')
INSERT INTO CONGNHAN_SANPHAM VALUES('CN4', 'SP3')
INSERT INTO CONGNHAN_SANPHAM VALUES('CN5', 'SP4')
INSERT INTO CONGNHAN_SANPHAM VALUES('CN6', 'SP4')
INSERT INTO CONGNHAN_SANPHAM VALUES('CN7', 'SP5')
INSERT INTO CONGNHAN_SANPHAM VALUES('CN8', 'SP1')
INSERT INTO CONGNHAN_SANPHAM VALUES('CN9', 'SP3')
INSERT INTO CONGNHAN_SANPHAM VALUES('CN11', 'SP5')