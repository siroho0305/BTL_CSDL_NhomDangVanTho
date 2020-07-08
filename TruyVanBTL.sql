USE QUANLYCONGNHAN
GO

-- Lay tat ca du lieu tu bang CONGNHAN
SELECT * FROM CONGNHAN
-- Lay tat ca du lieu tu bang KHO
SELECT * FROM KHO
-- Lay tat ca du lieu tu bang LUONG
SELECT * FROM LUONG
-- Lay tat ca du lieu tu bang SANPHAM
SELECT * FROM SANPHAM
-- Lay tat ca du lieu tu bang THANNHAN
SELECT * FROM THANNHAN
-- Lay tat ca du lieu tu bang XUONG
SELECT * FROM KHO
-- Lay tat ca du lieu tu bang CONGNHAN_XUONG
SELECT * FROM CONGNHAN_XUONG
-- Lay tat ca du lieu tu bang XUONG_SDT
SELECT * FROM XUONG_SDT
-- Lay ra cong nhan co luong tren 3000
SELECT * FROM CONGNHAN CN,LUONG L WHERE CN.MaL = L.MaL AND L.LuongCB > 3000
-- Lay ra ten nhung cong nhan co gioi tinh nam
SELECT TenCN FROM CONGNHAN WHERE Gioitinh = 'Nam'
-- Lay ra ten nhung cong nhan co gioi tinh nu
SELECT TenCN FROM CONGNHAN WHERE Gioitinh = N'Nữ'
-- Lay ra nhung cong nhan lam o xuong A co luong hon 5000
SELECT * 
FROM CONGNHAN
WHERE MaCN IN( SELECT MaCN FROM CONGNHAN_XUONG WHERE MaXuong ='X1')
  AND MaL IN(SELECT CN.MaL FROM CONGNHAN CN, LUONG L WHERE CN.MaL = L.MaL AND L.LuongCB > 5000)
-- Tim ra nhung xuong co 3 cong nhan lam
SELECT TenX
FROM XUONG 
WHERE MaXuong IN (SELECT CNX.MaXuong FROM CONGNHAN_XUONG CNX GROUP BY CNX.MaXuong HAVING COUNT(MaCN) = 3)
-- Hien thi nhung cong nhan co than nhan
SELECT * FROM CONGNHAN CN, THANNHAN TN WHERE CN.MaCN = TN.MaCN
-- Hien thi thong tin san pham trong kho D
SELECT *
FROM SANPHAM SP, KHO K
WHERE SP.MaK = K.MaK AND K.TenK = 'Kho D'
-- Hien thi ra nhung nhan vien co muc  luong L1
SELECT TenCN FROM CONGNHAN CN WHERE CN.MaL = 'L1'
-- Hien thi nhung cong nhan khong vo than nhan nao
SELECT *
FROM CONGNHAN 
WHERE MaCN NOT IN (SELECT MaCN FROM THANNHAN)
-- Tim nhung cong nhan co luong lon hon luong cua it nhat mot cong nhan 
SELECT *
FROM CONGNHAN
WHERE MaL > ANY (
       SELECT MaL
	   FROM CONGNHAN CN
	   )
-- Tim ra cong nhan co gioi tinh nam hoc que o Binh Dinh
SELECT TenCN
FROM CONGNHAN
WHERE Gioitinh = 'Nam' AND Quequan= N'Bình Định'

-- Xuất thông tin của những xưởng mà công nhân Lê Minh Thái làm việc

SELECT X.*
FROM CONGNHAN_XUONG CNX INNER JOIN XUONG X ON CNX.MaXuong = X.MaXuong
WHERE CNX.MaCN = 
(SELECT MaCN
FROM CONGNHAN
WHERE TenCN = N'Lê Minh Thái')

-- Xuất ra danh sách công nhân
SELECT * FROM CONGNHAN

-- Xuất ra tên và lương của mọi công nhân
SELECT CN.TenCN, L.HSL * L.LuongCB AS "Lương"
FROM CONGNHAN CN INNER JOIN LUONG L ON CN.MaL = L.MaL

-- Xuất ra tên công nhân và tên của thân nhân công nhân đó có quan hệ là cha
SELECT CN.TenCN, TN.Ten
FROM CONGNHAN CN INNER JOIN THANNHAN TN ON TN.MaCN = CN.MaCN
WHERE TN.Quanhe = N'Cha'

-- Xuất ra thông tin công nhân làm ra sản phẩm đặt ở Kho B
SELECT CN.*
FROM CONGNHAN CN INNER JOIN CONGNHAN_SANPHAM CNSP ON CNSP.MaCN = CN.MaCN
WHERE CNSP.MaSP IN
(SELECT MaSP
FROM SANPHAM
WHERE MaK = 
(SELECT MaK
FROM KHO
WHERE TenK = N'Kho B'))