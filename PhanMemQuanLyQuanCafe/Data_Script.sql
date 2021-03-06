USE [master]
GO
/****** Object:  Database [QuanLyQuanCafe]    Script Date: 2/2/2020 11:14:27 AM ******/
CREATE DATABASE [QuanLyQuanCafe] ON  PRIMARY 
( NAME = N'QuanLyQuanCafe', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQL_EXP_2008R2\MSSQL\DATA\QuanLyQuanCafe.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyQuanCafe_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQL_EXP_2008R2\MSSQL\DATA\QuanLyQuanCafe_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyQuanCafe] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanCafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanCafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanCafe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyQuanCafe] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanCafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanCafe] SET DB_CHAINING OFF 
GO
USE [QuanLyQuanCafe]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[DisplayName] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
	[Type] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL,
	[DateOut] [date] NULL,
	[idTable] [int] NOT NULL,
	[status] [int] NOT NULL,
	[discount] [int] NULL,
	[totalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[idCategory] [int] NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([DisplayName], [UserName], [Password], [Type]) VALUES (N'Tần thông minh', N'K10', N'1962026656160185351301320480154111117132155', 0)
INSERT [dbo].[Account] ([DisplayName], [UserName], [Password], [Type]) VALUES (N'Tần đẹp trai', N'K9', N'1962026656160185351301320480154111117132155', 1)
INSERT [dbo].[Account] ([DisplayName], [UserName], [Password], [Type]) VALUES (N'Staff', N'Staff', N'1962026656160185351301320480154111117132155', 0)
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (36, CAST(N'2020-01-13' AS Date), CAST(N'2020-01-13' AS Date), 4, 1, 0, 122000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (37, CAST(N'2020-01-13' AS Date), CAST(N'2020-01-13' AS Date), 2, 1, 0, 122000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (38, CAST(N'2020-01-13' AS Date), CAST(N'2020-01-13' AS Date), 3, 1, 0, 77000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (39, CAST(N'2020-01-13' AS Date), CAST(N'2020-01-13' AS Date), 5, 1, 0, 75000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (40, CAST(N'2020-01-13' AS Date), CAST(N'2020-01-13' AS Date), 10, 1, 0, 75000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (41, CAST(N'2020-01-13' AS Date), CAST(N'2020-01-13' AS Date), 5, 1, 0, 50000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (42, CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 10, 1, 0, 120000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (43, CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 8, 1, 0, 120000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (44, CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 8, 1, 0, 120000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (45, CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 8, 1, 0, 120000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (46, CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 8, 1, 0, 120000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (47, CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 8, 1, 0, 120000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (48, CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 7, 1, 0, 120000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (49, CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 1, 1, 0, 120000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (50, CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 5, 1, 0, 140000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (51, CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 10, 1, 0, 150000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (52, CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 12, 1, 10, 27000)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (53, CAST(N'2020-01-14' AS Date), CAST(N'2020-01-14' AS Date), 8, 1, 10, 32400)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (54, CAST(N'2020-01-15' AS Date), CAST(N'2020-01-15' AS Date), 9, 1, 10, 1934998.2)
INSERT [dbo].[Bill] ([id], [DateCheckIn], [DateOut], [idTable], [status], [discount], [totalPrice]) VALUES (55, CAST(N'2020-01-15' AS Date), CAST(N'2020-01-15' AS Date), 10, 1, 10, 1934998.2)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (57, 36, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (58, 37, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (59, 37, 6, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (60, 38, 6, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (61, 36, 6, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (62, 38, 4, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (63, 39, 4, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (64, 40, 4, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (65, 40, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (66, 41, 2, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (67, 41, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (68, 42, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (69, 43, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (70, 44, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (71, 45, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (72, 46, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (73, 47, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (74, 48, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (75, 49, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (76, 50, 1, 2)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (77, 50, 6, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (78, 51, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (79, 51, 6, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (80, 52, 6, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (81, 52, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (82, 53, 7, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (83, 53, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (84, 55, 1, 1)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (85, 55, 6, 3)
INSERT [dbo].[BillInfo] ([id], [idBill], [idFood], [count]) VALUES (86, 55, 5, 2)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (1, N'Mực một nắng nướng sa tế', 1, 120000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (2, N'Nghêu hấp xả', 1, 50000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (3, N'Dú dê nướng sữa', 1, 60000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (4, N'Heo rừng nướng muối ớt', 3, 75000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (5, N'Cơm chiên mushi', 2, 999999)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (6, N'7Up', 5, 10000)
INSERT [dbo].[Food] ([id], [name], [idCategory], [price]) VALUES (7, N'Cafe', 5, 12000)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (1, N'Hải sản')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (2, N'Nông sản')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (3, N'Lâm sản')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (4, N'Sản sản')
INSERT [dbo].[FoodCategory] ([id], [name]) VALUES (5, N'Nước')
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (1, N'Bàn 0', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (2, N'Bàn 1', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (3, N'Bàn 2', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (4, N'Bàn 3', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (5, N'Bàn 4', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (6, N'Bàn 5', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (7, N'Bàn 6', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (8, N'Bàn 7', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (9, N'Bàn 8', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (10, N'Bàn 9', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (11, N'Bàn 10', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (12, N'Bàn 11', N'Trống')
INSERT [dbo].[TableFood] ([id], [name], [status]) VALUES (14, N'Bàn 12', N'Trống')
SET IDENTITY_INSERT [dbo].[TableFood] OFF
ALTER TABLE [dbo].[Account] ADD  DEFAULT (N'Kter') FOR [DisplayName]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Password]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT (getdate()) FOR [DateCheckIn]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[BillInfo] ADD  DEFAULT ((0)) FOR [count]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT (N'Chưa có tên') FOR [name]
GO
ALTER TABLE [dbo].[Food] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[FoodCategory] ADD  DEFAULT (N'Chưa đặt tên') FOR [name]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT (N'Bàn chưa có tên') FOR [name]
GO
ALTER TABLE [dbo].[TableFood] ADD  DEFAULT (N'Trống') FOR [status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([id])
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD FOREIGN KEY([idCategory])
REFERENCES [dbo].[FoodCategory] ([id])
GO
/****** Object:  StoredProcedure [dbo].[USP_GetAccountByUserName]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetAccountByUserName]
	@userName nvarchar(100)
as
	begin
		select * from dbo.Account where UserName = @userName
	end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDate]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetListBillByDate]
@checkin Date, @checkout Date
as
begin
	select t.name as [Têm bàn], DateCheckIn as [Ngày vào], DateOut as [Ngày ra], discount as [Giảm giá], b.totalPrice as [Tổng tiền] 
		from Bill as b, TableFood as t
		where DateCheckIn >= @checkin and DateOut <= @checkout and b.status = 1
		and t.id = b.idTable 
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetListBillByDateAndPage]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetListBillByDateAndPage]
@checkin Date, @checkout Date, @page int
as
begin
	declare @pageRows	int = 10 -- mặc định 10 hàng
	declare @selectRows int  = @pageRows
	declare @exceptRows int = (@page - 1) * @pageRows

		;WITH BillShow as
		(
		select b.id, t.name as [Têm bàn], DateCheckIn as [Ngày vào], DateOut as [Ngày ra], discount as [Giảm giá], b.totalPrice as [Tổng tiền] 
		from Bill as b, TableFood as t
		where DateCheckIn >= @checkin and DateOut <= @checkout and b.status = 1
		and t.id = b.idTable 
		)

		select top (@selectRows) * from BillShow WHERE id not in
		(select top (@exceptRows) id from BillShow)	
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetNumBillByDate]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetNumBillByDate]
@checkin Date, @checkout Date
as
begin
	select count(*)
		from Bill as b, TableFood as t
		where DateCheckIn >= @checkin and DateOut <= @checkout and b.status = 1
		and t.id = b.idTable 
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetTableList]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[USP_GetTableList]
 as select * from dbo.TableFood
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertBill]
 @idTable int
 as
 begin
	insert into dbo.Bill (DateCheckIn, DateOut, idTable, status, discount)
	values 
	( GETDATE(), null, @idTable, 0, 0)
 end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillInfo]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertBillInfo]
 @idBill int, @idFood int, @count int
 as
 begin
	declare @isExistsBillInfo int
	declare @foodCount int = 1

	Select @isExistsBillInfo = id, @foodCount = count
	from dbo.BillInfo 
	where idBill = @idBill and idFood = @idFood

	if (@isExistsBillInfo > 0)
		begin
			declare @newCount int = @foodCount + @count
			if (@newCount > 0)
				Update dbo.BillInfo 
				SET count = @foodCount + @count
				WHERE idFood = @idFood
			else
				Delete dbo.BillInfo 
				where idBill = @idBill and idFood = @idFood
		end
	else
		begin
			insert into dbo.BillInfo (idBill, idFood, count)
			values ( @idBill, @idFood, @count)
		end
 end
GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_Login]
@userName nvarchar(100), @passWord nvarchar(100)
as
	begin
		select * from dbo.Account where UserName = @userName and Password = @passWord
	end
GO
/****** Object:  StoredProcedure [dbo].[USP_SwitchTable]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- proc cho nút chuyển bàn
CREATE PROC [dbo].[USP_SwitchTable]
@idTable1 int , @idTable2 int
as 
begin
	declare @idFirstBill int
	declare @idSecondBill int
	declare	@isFirstTableEmpty int = 1
	declare	@isSecondTableEmpty int = 1

	SELECT @idFirstBill = id FROM dbo.Bill WHERE idTable = @idTable1 AND status = 0
	SELECT @idSecondBill = id FROM dbo.Bill WHERE idTable = @idTable2 AND status = 0

	IF (@idFirstBill is null)
		begin
			INSERT INTO dbo.Bill (DateCheckIn, DateOut, idTable, status)
			VALUES(GETDATE(), NULL, @idTable1, 0)

			SELECT @idFirstBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable1 and status = 0

		end

	Select @isFirstTableEmpty = count(*) from BillInfo where idBill = @idFirstBill

	IF (@idSecondBill is null)
		begin
			INSERT INTO dbo.Bill (DateCheckIn, DateOut, idTable, status)
			VALUES(GETDATE(), NULL, @idTable2, 0)

			SELECT @idSecondBill = MAX(id) FROM dbo.Bill WHERE idTable = @idTable2 and status = 0
		end
			
	Select @isSecondTableEmpty = count(*) from BillInfo where idBill = @idSecondBill

	SELECT id INTO IDBillInfoTable FROM dbo.BillInfo WHERE idBill = @idSecondBill
	
	UPDATE dbo.BillInfo SET idBill = @idSecondBill WHERE idBill = @idFirstBill
	UPDATE dbo.BillInfo SET idBill = @idFirstBill WHERE id IN (SELECT * FROM IDBillInfoTable)
	
	DROP TABLE IDBillInfoTable 

	if (@isFirstTableEmpty = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable2

	if (@isSecondTableEmpty = 0)
		UPDATE dbo.TableFood SET status = N'Trống' WHERE id = @idTable1
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAccount]    Script Date: 2/2/2020 11:14:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateAccount]
@userName nvarchar(100), @displayName nvarchar(100), @password nvarchar(100), @newPassword nvarchar(100)
as
begin
	declare @isRightPass int
	select @isRightPass = count(*) from Account where userName = @userName and Password = @password
	if (@isRightPass = 1)
	begin
		if (@newPassword is null or @newPassword = '')
		begin
			UPDATE Account SET DisplayName = @displayName where userName = @userName
		end
		else
			UPDATE Account SET DisplayName = @displayName, Password = @newPassword where userName = @userName
	end
end
GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanCafe] SET  READ_WRITE 
GO
