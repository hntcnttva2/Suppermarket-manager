
CREATE TABLE NHACUNGCAP(
MANHACUNGCAP NVARCHAR(20) NOT NULL,
TENNHACUNGCAP NVARCHAR(20) NOT NULL,
SODIENTHOAI NVARCHAR(15) ,
DIACHI NVARCHAR(30),
CONSTRAINT pk_nhacungcap_macungcap PRIMARY KEY(MANHACUNGCAP),
)

CREATE TABLE NHANVIEN(
MANHANVIEN NVARCHAR(20) NOT NULL,
TENNHANVIEN NVARCHAR(30) NOT NULL,
NGAYSINH DATETIME,
GIOITINH NVARCHAR(10),
SODIENTHOAI NVARCHAR(15),
DIACHI NVARCHAR(30),
LUONG INT ,
CONSTRAINT pk_nhanvien_manhanvien PRIMARY KEY(MANHANVIEN),
)

CREATE TABLE CALAMVIEC(
MACALAM NVARCHAR(20) NOT NULL,
TENCALAM INT NOT NULL,
CONSTRAINT pk_calamviec_macalam PRIMARY KEY(MACALAM),
)

CREATE TABLE LAM(
MACALAM NVARCHAR(20) NOT NULL,
MANHANVIEN NVARCHAR(20) NOT NULL,
NGAYLAMVIEC DATETIME NOT NULL,
CONSTRAINT pk_lam_macalam_ngaylamviec_manhanvien PRIMARY KEY(MACALAM, NGAYLAMVIEC,MANHANVIEN),
CONSTRAINT fk_lam_manhanvien FOREIGN KEY (MANHANVIEN) REFERENCES NHANVIEN(MANHANVIEN),
CONSTRAINT fk_lam_macalam FOREIGN KEY (MACALAM) REFERENCES CALAMVIEC(MACALAM),
)


CREATE TABLE HOADONNHAP (
MAHOADON NVARCHAR(20) NOT NULL,
MANHACUNGCAP NVARCHAR(20),
MANHANVIEN NVARCHAR(20),
NGAYNHAP DATETIME,
CONSTRAINT pk_hoadonnhap_mahoadon PRIMARY KEY(MAHOADON),
CONSTRAINT fk_hoadonnhap_macungcap FOREIGN KEY (MANHACUNGCAP) REFERENCES NHACUNGCAP(MANHACUNGCAP),
CONSTRAINT fk_hoadonnhap_manhanvien FOREIGN KEY (MANHANVIEN) REFERENCES NHANVIEN(MANHANVIEN),
)

CREATE TABLE KHACHHANG(
MAKHACHHANG NVARCHAR(20) NOT NULL,
TENKHACHHANG NVARCHAR(30),
GIOITINH NVARCHAR(10),
SODIENTHOAI NVARCHAR(15),
DIACHI NVARCHAR(30),
CONSTRAINT pk_khachhang_makhachhang PRIMARY KEY(MAKHACHHANG),
)

CREATE TABLE HOADONBAN(
MAHOADON NVARCHAR (20) NOT NULL,
MANHANVIEN NVARCHAR(20) NOT NULL,
MAKHACHHANG NVARCHAR(20) NOT NULL,
NGAYBAN DATETIME,
CONSTRAINT pk_hoadonban_mahoadon PRIMARY KEY(MAHOADON),
CONSTRAINT fk_hoadonban_manhanvien FOREIGN KEY (MANHANVIEN) REFERENCES NHANVIEN(MANHANVIEN),
CONSTRAINT fk_hoadonban_makhachhang FOREIGN KEY (MAKHACHHANG) REFERENCES KHACHHANG(MAKHACHHANG),
)

CREATE TABLE LOAIHANGHOA(
MALOAIHANG NVARCHAR(20) NOT NULL,
TENLOAIHANG NVARCHAR(40) NOT NULL,
CONSTRAINT pk_loaihanghoa_maloaihang PRIMARY KEY(MALOAIHANG),
)

CREATE TABLE HANGHOA(
MAHANGHOA NVARCHAR(20) NOT NULL,
TENHANGHOA NVARCHAR(40) NOT NULL,
SOLUONG INT NOT NULL,
GIATHANH INT NOT NULL,
MALOAIHANG NVARCHAR(20),
CONSTRAINT pk_hanghoa_mahanghoa PRIMARY KEY(MAHANGHOA),
CONSTRAINT fk_hanghoa_maloaihang FOREIGN KEY (MALOAIHANG) REFERENCES LOAIHANGHOA(MALOAIHANG),
)

CREATE TABLE CHITIETHOADONBAN(
MAHOADON NVARCHAR(20) NOT NULL,
MAHANGHOA NVARCHAR(20) NOT NULL,
SOLUONG INT NOT NULL,
GIANHAP INT NOT NULL,
DONVITINH NVARCHAR(30),
CONSTRAINT pk_chitiethoadonban_mahoadon_mahanghoa PRIMARY KEY(MAHOADON,MAHANGHOA),
CONSTRAINT fk_chitiethoadonban_mahoadon FOREIGN KEY (MAHOADON) REFERENCES HOADONBAN(MAHOADON),
CONSTRAINT fk_chitiethoadonban_mahanghoa FOREIGN KEY (MAHANGHOA) REFERENCES HANGHOA(MAHANGHOA),
)


CREATE TABLE CHITIETHOADONNHAP(
MAHOADON NVARCHAR(20) NOT NULL,
MAHANGHOA NVARCHAR(20) NOT NULL,
SOLUONG INT NOT NULL,
GIABAN INT NOT NULL,
DONVITINH NVARCHAR(30),
CONSTRAINT pk_chitiethoadonnhap_mahoadon_mahanghoa PRIMARY KEY(MAHOADON,MAHANGHOA),
CONSTRAINT fk_chitiethoadonnhap_mahoadon FOREIGN KEY (MAHOADON) REFERENCES HOADONNHAP(MAHOADON),
CONSTRAINT fk_chitiethoadonnhap_mahanghoa FOREIGN KEY (MAHANGHOA) REFERENCES HANGHOA(MAHANGHOA),
)
