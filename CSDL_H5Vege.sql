

CREATE DATABASE [QLBanRauCu];
USE [QLBanRauCu];
GO
Drop database [QLBanRauCu];
CREATE TABLE [dbo].[tDanhMucRauCu](
    [MaRauCu] [char](25) NOT NULL,
    [TenRauCu] [nvarchar](150) NULL,
    [DonGia] [decimal] NULL,
    [NguonGoc] [nvarchar](100) NULL,
    [MoTa] [nvarchar](255) NULL,
    [HinhAnh] [nvarchar](255) NULL, -- Image URL
	[MaLoaiRauCu] [char](25) NULL,
    CONSTRAINT [PK_tDanhMucRauCu] PRIMARY KEY CLUSTERED 
    (
        [MaRauCu] ASC
    ) ON [PRIMARY]
);
GO

CREATE TABLE [dbo].[tXuatXu](
    [MaXuatXu] [char](25) NOT NULL,
    [TenXuatXu] [nvarchar](150) NULL,
    CONSTRAINT [PK_tXuatXu] PRIMARY KEY CLUSTERED 
    (
        [MaXuatXu] ASC
    ) ON [PRIMARY]
);
GO

CREATE TABLE [dbo].[tChiTietRauCu](
    [MaChiTietRauCu] [char](25) NOT NULL,
    [MaRauCu] [char](25) NULL,
    [NgayThuHoach] [date] NULL,
	[MoTaChiTiet] [nvarchar](255) NULL,
    [ThoiGianBaoQuan] [int] NULL, -- Time in days
    [TrangThai] [nvarchar](50) NULL, -- E.g., Fresh, Frozen, Processed
    [HinhAnh] [nvarchar](255) NULL, -- Image URL
    CONSTRAINT [PK_tChiTietRauCu] PRIMARY KEY CLUSTERED 
    (
        [MaChiTietRauCu] ASC
    ) ON [PRIMARY]
);
GO

CREATE TABLE [dbo].[tLoaiRauCu](
    [MaLoaiRauCu] [char](25) NOT NULL,
    [LoaiRauCu] [nvarchar](100) NULL,
    CONSTRAINT [PK_tLoaiRauCu] PRIMARY KEY CLUSTERED 
    (
        [MaLoaiRauCu] ASC
    ) ON [PRIMARY]
);
GO

-- Tables for customers and invoices
CREATE TABLE [dbo].[tHoaDonBan](
    [MaHoaDon] [char](25) NOT NULL,
    [NgayHoaDon] [datetime] NULL,
    [MaKhachHang] [char](25) NULL,
    [MaNhanVien] [char](25) NULL,
    [TongTienHD] [decimal] NULL,
    [GiamGiaHD] [float] NULL,
    [PhuongThucThanhToan] [tinyint] NULL,
    [MaSoThue] [char](100) NULL,
    [ThongTinThue] [nvarchar](250) NULL,
    [GhiChu] [nvarchar](100) NULL,
    CONSTRAINT [PK_tHoaDonBan] PRIMARY KEY CLUSTERED 
    (
        [MaHoaDon] ASC
    ) ON [PRIMARY]
);
GO

CREATE TABLE [dbo].[tKhachHang](
    [MaKhachHang] [char](25) NOT NULL,
    [username] [char](100) NULL,
    [TenKhachHang] [nvarchar](100) NULL,
    [NgaySinh] [date] NULL,
    [SoDienThoai] [char](15) NULL,
    [DiaChi] [nvarchar](150) NULL,
    [LoaiKhachHang] [tinyint] NULL,
    [AnhDaiDien] [char](100) NULL,
    [GhiChu] [nvarchar](100) NULL,
    CONSTRAINT [PK_tKhachHang] PRIMARY KEY CLUSTERED 
    (
        [MaKhachHang] ASC
    ) ON [PRIMARY]
);
GO

-- User table
CREATE TABLE [dbo].[tUser](
    [username] [char](100) NOT NULL,
    [password] [char](256) NOT NULL,
    [LoaiUser] [tinyint] NULL, -- User role type
    CONSTRAINT [PK_tUser] PRIMARY KEY CLUSTERED 
    (
        [username] ASC
    ) ON [PRIMARY]
);
GO

-- Employee table
CREATE TABLE [dbo].[tNhanVien](
    [MaNhanVien] [char](25) NOT NULL,
    [username] [char](100) NULL,
    [TenNhanVien] [nvarchar](100) NULL,
    [NgaySinh] [date] NULL,
    [SoDienThoai1] [char](15) NULL,
    [SoDienThoai2] [char](15) NULL,
    [DiaChi] [nvarchar](150) NULL,
    [ChucVu] [nvarchar](100) NULL, -- Position/Role
    [AnhDaiDien] [char](100) NULL, -- Image URL
    [GhiChu] [nvarchar](100) NULL,
    CONSTRAINT [PK_tNhanVien] PRIMARY KEY CLUSTERED 
    (
        [MaNhanVien] ASC
    ) ON [PRIMARY]
);
GO


-- Inserting data into tDanhMucRauCu
INSERT INTO [dbo].[tDanhMucRauCu] (MaRauCu, TenRauCu, DonGia, NguonGoc, MoTa, HinhAnh, MaLoaiRauCu) VALUES
('RC001', N'Cải Xoong', 5000, N'Việt Nam', N'Rau cải xanh tươi ngon', 'https://nongsandungha.com/wp-content/uploads/2021/06/cai-xoong-min.jpg', 'LR001'),
('RC002', N'Rau Muống', 4000, N'Việt Nam', N'Rau muống tươi mới', 'https://product.hstatic.net/200000423303/product/rau_muong_huu_co_c9a3ac40b83542158cc777090bee8441_grande.png', 'LR001'),
('RC003', N'Rau Cải Thảo', 7000, N'Hàn Quốc', N'Rau cải thảo giòn', 'https://product.hstatic.net/200000423303/product/cai-thao-huu-co_d5a332d40bf843e283c45aae5039351c_1024x1024.jpg', 'LR001'),
('RC004', N'Súp Lơ', 8000, N'Mỹ', N'Súp lơ xanh tốt', 'https://product.hstatic.net/200000423303/product/bong-cai-xanh-huu-co_9dbd73ab4b3a4e62bf00ddeeb645b9a7_1024x1024.jpg', 'LR001'),
('RC005', N'Cà Rốt', 3000, N'Đà Lạt', N'Cà rốt tươi ngon', 'https://product.hstatic.net/200000423303/product/ca-rot-huu-co_051657cb99144443bac8015f6dd34dae_1024x1024.jpg', 'LR002'),
('RC006', N'Bí Đỏ', 5000, N'Trung Quốc', N'Bí đỏ giàu dinh dưỡng', 'https://product.hstatic.net/200000423303/product/bi_do_hat_dau_huu_co_b03f29a6449d4e7ebb7951b2e357e565_1024x1024.png', 'LR002'),
('RC007', N'Khoai Lang', 4500, N'Việt Nam', N'Khoai lang ngọt', 'https://product.hstatic.net/200000423303/product/khoai-mat-huu-co_6acf11bc200d4d0a82cae134bbad21d7.jpg', 'LR002'),
('RC008', N'Cà Chua', 6000, N'Tây Ban Nha', N'Cà chua mọng nước', 'https://product.hstatic.net/200000423303/product/ca-chua-bee-cherry-huu-co_2afe5b08b1f242809cac54171701fff4_1024x1024.jpg', 'LR002'),
('RC009', N'Dưa Leo', 4000, N'Việt Nam', N'Dưa leo mát lành', 'https://product.hstatic.net/200000423303/product/dua-leo-huu-co_6d5ca8015aea4e86bffbeb58e2a431fd_1024x1024.jpg', 'LR001'),
('RC010', N'Xà Lách', 7500, N'Mỹ', N'Rau xà lách tươi mát', 'https://product.hstatic.net/200000423303/product/xa-lach-romaine_744edd7c02bc4944987ae1d202a9b625.jpg', 'LR001'),
('RC011', N'Cam', 10000, N'Việt Nam', N'Trái cam ngọt, giàu vitamin C', 'https://product.hstatic.net/200000423303/product/cam-sanh-huu-co_073f4ecf43014f3c8eec0d825a214ea1.jpg', 'LR006'),
('RC012', N'Táo', 15000, N'Mỹ', N'Táo đỏ giòn ngọt, bổ sung chất xơ', 'https://product.hstatic.net/200000423303/product/untitled_design_99eaeb7141d44f45a924f6890f8222c6.jpg', 'LR006'),
('RC013', N'Chuối', 8000, N'Việt Nam', N'Chuối tươi ngon, giàu kali', 'https://product.hstatic.net/200000423303/product/add_a_heading_9b34415e7c19413392dc5d48fe06992c_1024x1024.jpg', 'LR006'),
('RC014', N'Nho', 20000, N'Mỹ', N'Nho ngọt mọng nước, tốt cho sức khỏe', 'https://product.hstatic.net/200000423303/product/nho_xanh_khong_hat__non-gmo__-_500g_b19ad79e912744ebab047545baac117a_grande.png', 'LR006'),
('RC015', N'Khoai Mì', 5000, N'Việt Nam', N'Khoai mì nhiều tinh bột, có thể luộc, hấp', 'https://product.hstatic.net/200000423303/product/khoai-mon-huu-co_71d368e89c414ea8a138c30dfd695bed_grande.jpg', 'LR002'),
('RC016', N'Dưa Hấu', 12000, N'Việt Nam', N'Dưa hấu mọng nước, thích hợp giải nhiệt', 'https://product.hstatic.net/1000282430/product/seedless-watermelon-around-2.5kg-whole-fruit_23a860613aa94413aca16b9d766f6291.jpg', 'LR006'),
('RC017', N'Đậu Phộng', 10000, N'Thái Lan', N'Đậu phộng sấy giòn, thích hợp làm snack', 'https://product.hstatic.net/200000118845/product/dau-phong-2_5d3648ad4b8e4f67a99a68ef2bebce52_master.jpg', 'LR005'),
('RC018', N'Hạt Chia', 30000, N'Mexico', N'Hạt chia giàu chất xơ và omega-3', 'https://product.hstatic.net/200000423303/product/hat_chia_naturgreen_acaf085c9afa41d7900a3407ba5b4971_1024x1024.png', 'LR005'),
('RC019', N'Nấm Hương Khô', 25000, N'Việt Nam', N'Nấm hương khô thơm, dùng cho súp hoặc xào', 'https://product.hstatic.net/200000423303/product/vn-11134201-23030-fqpej49svpovb3-removebg-preview_acbb4dc02c6f47c487c18db1b17fd185_1024x1024.png', 'LR005'),
('RC020', N'Yến Mạch', 15000, N'Úc', N'Yến mạch nguyên chất, giàu chất xơ, thích hợp cho bữa sáng', 'https://product.hstatic.net/200000423303/product/bot_yen_mach_huu_co_just_organik_500g_910784263e22439faef0b12dbcee7c0a_grande.jpeg', 'LR005');

-- Inserting data into tXuatXu
INSERT INTO [dbo].[tXuatXu] (MaXuatXu, TenXuatXu) VALUES
('XX001', N'Việt Nam'),
('XX002', N'Nhật Bản'),
('XX003', N'Hàn Quốc'),
('XX004', N'Mỹ'),
('XX005', N'Đà Lạt'),
('XX006', N'Trung Quốc'),
('XX007', N'Tây Ban Nha'),
('XX008', N'Úc'),
('XX009', N'Pháp'),
('XX010', N'Ý');

-- Inserting data into tChiTietRauCu with MoTaChiTiet field
INSERT INTO [dbo].[tChiTietRauCu] (MaChiTietRauCu, MaRauCu, NgayThuHoach, ThoiGianBaoQuan, TrangThai, HinhAnh, MoTaChiTiet) VALUES
('CTRC001', 'RC001', '2024-10-01', 5, N'Tươi', 'https://nongsandungha.com/wp-content/uploads/2021/06/cai-xoong-min.jpg', N'Rau cải xoong có độ giòn tự nhiên, là lựa chọn lý tưởng cho các món canh hoặc xào. Được trồng theo phương pháp hữu cơ, rau cải xoong không chỉ giữ nguyên độ tươi mát mà còn có vị thanh ngọt và không chứa hóa chất độc hại.'),
('CTRC002', 'RC002', '2024-10-02', 7, N'Tươi', 'https://product.hstatic.net/200000423303/product/rau_muong_huu_co_c9a3ac40b83542158cc777090bee8441_grande.png', N'Rau muống tươi, chứa nhiều chất xơ và vitamin, là nguyên liệu phổ biến trong bữa ăn gia đình. Rau muống có thể được dùng để xào với tỏi, nấu canh hoặc luộc, giúp thanh nhiệt và hỗ trợ tiêu hóa hiệu quả.'),
('CTRC003', 'RC003', '2024-10-03', 10, N'Đông lạnh', 'https://product.hstatic.net/200000423303/product/cai-thao-huu-co_d5a332d40bf843e283c45aae5039351c_1024x1024.jpg', N'Rau cải thảo giòn và ngọt nhẹ, rất thích hợp cho món kim chi hoặc các món canh hầm. Rau cải thảo được thu hoạch kỹ lưỡng, giữ được độ tươi ngon, giúp món ăn có hương vị đặc trưng của ẩm thực Hàn Quốc.'),
('CTRC004', 'RC004', '2024-10-04', 3, N'Tươi', 'https://product.hstatic.net/200000423303/product/bong-cai-xanh-huu-co_9dbd73ab4b3a4e62bf00ddeeb645b9a7_1024x1024.jpg', N'Súp lơ tươi mát, chứa nhiều vitamin C và chất xơ, có thể dùng để chế biến thành các món súp, xào, hoặc ăn sống với sốt. Được trồng tự nhiên, súp lơ mang đến sự giòn ngon và bổ dưỡng cho các món ăn.'),
('CTRC005', 'RC005', '2024-10-05', 12, N'Tươi', 'https://product.hstatic.net/200000423303/product/ca-rot-huu-co_051657cb99144443bac8015f6dd34dae_1024x1024.jpg', N'Cà rốt ngọt tự nhiên, giàu vitamin A và chất xơ, phù hợp với các món salad, nước ép hoặc canh bổ dưỡng. Cà rốt giúp tăng cường sức khỏe cho đôi mắt và hệ miễn dịch, là thực phẩm không thể thiếu trong mỗi bữa ăn.'),
('CTRC006', 'RC006', '2024-10-06', 8, N'Tươi', 'https://product.hstatic.net/200000423303/product/bi_do_hat_dau_huu_co_b03f29a6449d4e7ebb7951b2e357e565_1024x1024.png', N'Bí đỏ với độ ngọt và dẻo vừa phải, thích hợp để làm canh, nấu chè hoặc dùng trong các món ăn dặm cho trẻ nhỏ. Bí đỏ giàu chất dinh dưỡng, đặc biệt là vitamin A, hỗ trợ tốt cho thị giác và tăng cường miễn dịch.'),
('CTRC007', 'RC007', '2024-10-07', 15, N'Tươi', 'https://product.hstatic.net/200000423303/product/khoai-mat-huu-co_6acf11bc200d4d0a82cae134bbad21d7.jpg', N'Khoai lang có vị ngọt và bùi tự nhiên, là nguồn thực phẩm giàu chất xơ. Khoai lang có thể được hấp, nướng, hoặc làm thành các món bánh. Khoai không chỉ ngon mà còn tốt cho sức khỏe, giúp hỗ trợ tiêu hóa và kiểm soát cân nặng.'),
('CTRC008', 'RC008', '2024-10-08', 6, N'Đông lạnh', 'https://product.hstatic.net/200000423303/product/ca-chua-bee-cherry-huu-co_2afe5b08b1f242809cac54171701fff4_1024x1024.jpg', N'Cà chua đỏ mọng, giàu vitamin C và lycopene, giúp tăng cường sức đề kháng và tốt cho làn da. Cà chua có thể dùng làm sốt, nấu canh, hoặc ăn sống trong các món salad. Đây là thực phẩm bổ dưỡng và không thể thiếu trong gian bếp.'),
('CTRC009', 'RC009', '2024-10-09', 4, N'Tươi', 'https://product.hstatic.net/200000423303/product/dua-leo-huu-co_6d5ca8015aea4e86bffbeb58e2a431fd_1024x1024.jpg', N'Dưa leo giòn mát, là lựa chọn hoàn hảo cho các món dưa muối, salad, hoặc ăn kèm với các món chiên, nướng. Dưa leo có hàm lượng nước cao, giúp cơ thể giữ nước và làm đẹp da.'),
('CTRC010', 'RC010', '2024-10-10', 9, N'Đông lạnh', 'https://product.hstatic.net/200000423303/product/xa-lach-romaine_744edd7c02bc4944987ae1d202a9b625.jpg', N'Xà lách lá tươi xanh, thích hợp dùng ăn sống trong món salad hoặc làm rau cuốn. Với hương vị nhẹ nhàng và độ giòn, xà lách không chỉ làm tăng sự hấp dẫn cho món ăn mà còn bổ sung nhiều vitamin thiết yếu cho cơ thể.'),
('CTRC011', 'RC011', '2024-10-11', 5, N'Tươi', 'https://product.hstatic.net/200000423303/product/cam-sanh-huu-co_073f4ecf43014f3c8eec0d825a214ea1.jpg', N'Trái cam ngọt, mọng nước và giàu vitamin C, rất tốt cho hệ miễn dịch. Cam có thể dùng để ăn tươi hoặc ép thành nước giải khát, mang lại cảm giác sảng khoái và bổ sung vitamin.'),
('CTRC012', 'RC012', '2024-10-12', 7, N'Tươi', 'https://product.hstatic.net/200000423303/product/untitled_design_99eaeb7141d44f45a924f6890f8222c6.jpg', N'Táo đỏ giòn ngọt, là nguồn cung cấp chất xơ và vitamin C dồi dào. Táo thích hợp để ăn sống, làm salad trái cây, hoặc ép nước, giúp hỗ trợ tiêu hóa và duy trì vóc dáng.'),
('CTRC013', 'RC013', '2024-10-13', 10, N'Tươi', 'https://product.hstatic.net/200000423303/product/add_a_heading_9b34415e7c19413392dc5d48fe06992c_1024x1024.jpg', N'Chuối tươi ngon, giàu kali và năng lượng, là một món ăn nhanh lý tưởng trước khi tập luyện. Chuối có vị ngọt tự nhiên, có thể ăn trực tiếp hoặc chế biến thành sinh tố, bánh.'),
('CTRC014', 'RC014', '2024-10-15', 8, N'Tươi', 'https://product.hstatic.net/200000423303/product/nho_xanh_khong_hat__non-gmo__-_500g_b19ad79e912744ebab047545baac117a_grande.png', N'Nho ngọt mọng nước, chứa nhiều chất chống oxy hóa, tốt cho sức khỏe tim mạch. Nho thích hợp ăn sống, dùng trong salad trái cây hoặc làm nguyên liệu cho các món tráng miệng.'),
('CTRC015', 'RC015', '2024-10-19', 6, N'Tươi', 'https://product.hstatic.net/200000423303/product/khoai-mon-huu-co_71d368e89c414ea8a138c30dfd695bed_grande.jpg', N'Khoai mì là loại củ giàu tinh bột, thích hợp để luộc, hấp hoặc làm bánh. Khoai mì có vị ngọt bùi tự nhiên, cung cấp năng lượng tốt cho các hoạt động thể chất.'),
('CTRC016', 'RC016', '2024-10-16', 3, N'Tươi', 'https://product.hstatic.net/1000282430/product/seedless-watermelon-around-2.5kg-whole-fruit_23a860613aa94413aca16b9d766f6291.jpg', N'Dưa hấu mọng nước, ngọt mát, rất thích hợp làm món tráng miệng trong những ngày hè nóng bức. Dưa hấu chứa nhiều vitamin A và C, giúp giải nhiệt và cấp nước cho cơ thể.'),
('CTRC017', 'RC017', '2024-10-17', 12, N'Đông lạnh', 'https://product.hstatic.net/200000118845/product/dau-phong-2_5d3648ad4b8e4f67a99a68ef2bebce52_master.jpg', N'Đậu phộng sấy giòn, thơm ngon, là món ăn vặt bổ dưỡng giàu protein và chất béo lành mạnh. Đậu phộng thích hợp làm snack, ăn kèm hoặc dùng trong các món ăn châu Á.'),
('CTRC018', 'RC018', '2024-10-18', 15, N'Đông lạnh', 'https://product.hstatic.net/200000423303/product/hat_chia_naturgreen_acaf085c9afa41d7900a3407ba5b4971_1024x1024.png', N'Hạt chia giàu chất xơ và omega-3, rất tốt cho sức khỏe tim mạch và hệ tiêu hóa. Hạt chia có thể dùng kèm nước uống, làm pudding hoặc bổ sung vào các món sinh tố.'),
('CTRC019', 'RC019', '2024-10-19', 6, N'Tươi', 'https://product.hstatic.net/200000423303/product/vn-11134201-23030-fqpej49svpovb3-removebg-preview_acbb4dc02c6f47c487c18db1b17fd185_1024x1024.png', N'Nấm hương khô có hương thơm đậm đà, thích hợp để nấu súp, xào hoặc làm nước dùng. Nấm hương cung cấp nhiều vitamin và khoáng chất, giúp tăng hương vị và giá trị dinh dưỡng cho món ăn.'),
('CTRC020', 'RC020', '2024-10-20', 9, N'Đông lạnh', 'https://product.hstatic.net/200000423303/product/bot_yen_mach_huu_co_just_organik_500g_910784263e22439faef0b12dbcee7c0a_grande.jpeg', N'Yến mạch nguyên chất, giàu chất xơ, thích hợp cho bữa sáng lành mạnh. Yến mạch có thể nấu thành cháo, trộn với sữa chua hoặc dùng làm nguyên liệu cho các món bánh dinh dưỡng.');
-- Inserting data into tLoaiRauCu
INSERT INTO [dbo].[tLoaiRauCu] (MaLoaiRauCu, LoaiRauCu) VALUES
('LR001', N'Rau Lá Xanh'),
('LR002', N'Rau Củ Quả'),
('LR003', N'Rau Gia Vị'),
('LR004', N'Rau Mầm'),
('LR005', N'Đồ Khô'),
('LR006', N'Trái Cây');

-- Inserting data into tHoaDonBan
INSERT INTO [dbo].[tHoaDonBan] (MaHoaDon, NgayHoaDon, MaKhachHang, MaNhanVien, TongTienHD, GiamGiaHD, PhuongThucThanhToan, MaSoThue, ThongTinThue, GhiChu) VALUES
('HD001', '2024-10-05', 'KH001', 'NV001', 9000, 0.1, 1, '123456789', N'10% VAT', N'Giao hàng tận nơi'),
('HD002', '2024-10-06', 'KH002', 'NV002', 12000, 0.05, 2, '987654321', N'5% VAT', N'Khách tự lấy');

-- Inserting data into tKhachHang
INSERT INTO [dbo].[tKhachHang] (MaKhachHang, username, TenKhachHang, NgaySinh, SoDienThoai, DiaChi, LoaiKhachHang, AnhDaiDien, GhiChu) VALUES
('KH001', 'user1', N'Nguyễn Văn A', '1990-01-01', '0123456789', N'Hà Nội', 1, 'images/khachhang1.jpg', N'Khách hàng thường xuyên'),
('KH002', 'user2', N'Trần Thị B', '1992-02-02', '0987654321', N'Hồ Chí Minh', 2, 'images/khachhang2.jpg', N'Khách hàng mới');

-- Inserting data into tUser
INSERT INTO [dbo].[tUser] (username, password, LoaiUser) VALUES
('admin', 'admin123', 1),
('staff', 'staff123', 2);

-- Inserting data into tNhanVien
INSERT INTO [dbo].[tNhanVien] (MaNhanVien, username, TenNhanVien, NgaySinh, SoDienThoai1, SoDienThoai2, DiaChi, ChucVu, AnhDaiDien, GhiChu) VALUES
('NV001', 'admin', N'Lê Văn C', '1985-03-15', '0123456788', '0123456787', N'Hà Nội', N'Quản lý', 'images/nhanvien1.jpg', N'Nhân viên quản lý'),
('NV002', 'staff', N'Phạm Thị D', '1988-04-20', '0987654322', '0987654323', N'Hồ Chí Minh', N'Nhân viên bán hàng', 'images/nhanvien2.jpg', N'Nhân viên bán hàng');

GO
