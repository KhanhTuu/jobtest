USE [master]
GO
/****** Object:  Database [ShinStore]    Script Date: 01/04/2025 1:26:08 SA ******/
CREATE DATABASE [ShinStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShinStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MAYCUATUAN\MSSQL\DATA\ShinStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShinStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MAYCUATUAN\MSSQL\DATA\ShinStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShinStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShinStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShinStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShinStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShinStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShinStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShinStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShinStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShinStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShinStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShinStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShinStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShinStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShinStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShinStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShinStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShinStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShinStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShinStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShinStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShinStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShinStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShinStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShinStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShinStore] SET RECOVERY FULL 
GO
ALTER DATABASE [ShinStore] SET  MULTI_USER 
GO
ALTER DATABASE [ShinStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShinStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShinStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShinStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShinStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShinStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShinStore', N'ON'
GO
ALTER DATABASE [ShinStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShinStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShinStore]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 01/04/2025 1:26:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 01/04/2025 1:26:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 01/04/2025 1:26:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 01/04/2025 1:26:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[Category] [nvarchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
	[Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 01/04/2025 1:26:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[ShipmentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ShipmentDate] [date] NULL,
	[DeliveryStatus] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [Name], [Email]) VALUES (1, N'John Doe', N'john.doe@example.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Email]) VALUES (2, N'Nguyen Khanh Tuan', N'khanh@example.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Email]) VALUES (3, N'Le Minh Tu', N'minhtu@example.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [Email]) VALUES (4, N'Pham Anh Tuan', N'anh_tuan@example.com')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (1, 1, 1, 2, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (2, 1, 1, 2, CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (3, 1, 2, 1, CAST(800.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (4, 2, 3, 5, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (5, 3, 1, 1, CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (6, 3, 2, 2, CAST(800.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItems] ([OrderItemID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (7, 4, 3, 3, CAST(50.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Status]) VALUES (1, 1, CAST(N'2023-01-15' AS Date), N'Shipped')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Status]) VALUES (2, 1, CAST(N'2023-01-10' AS Date), N'Shipped')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Status]) VALUES (3, 1, CAST(N'2023-02-15' AS Date), N'Pending')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Status]) VALUES (4, 2, CAST(N'2023-03-05' AS Date), N'Shipped')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [Status]) VALUES (5, 3, CAST(N'2023-03-20' AS Date), N'Delivered')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [Stock]) VALUES (1, N'Laptop', N'Electronics', CAST(1000.00 AS Decimal(18, 2)), 50)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [Stock]) VALUES (2, N'Laptop', N'Electronics', CAST(1500.00 AS Decimal(18, 2)), 50)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [Stock]) VALUES (3, N'Smartphone', N'Electronics', CAST(800.00 AS Decimal(18, 2)), 100)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [Stock]) VALUES (4, N'Keyboard', N'Accessories', CAST(50.00 AS Decimal(18, 2)), 200)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipments] ON 

INSERT [dbo].[Shipments] ([ShipmentID], [OrderID], [ShipmentDate], [DeliveryStatus]) VALUES (1, 1, CAST(N'2023-01-16' AS Date), N'Delivered')
INSERT [dbo].[Shipments] ([ShipmentID], [OrderID], [ShipmentDate], [DeliveryStatus]) VALUES (2, 1, CAST(N'2023-01-12' AS Date), N'Delivered')
INSERT [dbo].[Shipments] ([ShipmentID], [OrderID], [ShipmentDate], [DeliveryStatus]) VALUES (3, 2, CAST(N'2023-02-17' AS Date), N'Shipped')
INSERT [dbo].[Shipments] ([ShipmentID], [OrderID], [ShipmentDate], [DeliveryStatus]) VALUES (4, 3, CAST(N'2023-03-07' AS Date), N'Delivered')
INSERT [dbo].[Shipments] ([ShipmentID], [OrderID], [ShipmentDate], [DeliveryStatus]) VALUES (5, 4, CAST(N'2023-03-21' AS Date), N'Delivered')
INSERT [dbo].[Shipments] ([ShipmentID], [OrderID], [ShipmentDate], [DeliveryStatus]) VALUES (6, 1, CAST(N'2023-01-12' AS Date), N'Delivered')
INSERT [dbo].[Shipments] ([ShipmentID], [OrderID], [ShipmentDate], [DeliveryStatus]) VALUES (7, 2, CAST(N'2023-02-17' AS Date), N'Shipped')
INSERT [dbo].[Shipments] ([ShipmentID], [OrderID], [ShipmentDate], [DeliveryStatus]) VALUES (8, 3, CAST(N'2023-03-07' AS Date), N'Delivered')
INSERT [dbo].[Shipments] ([ShipmentID], [OrderID], [ShipmentDate], [DeliveryStatus]) VALUES (9, 4, CAST(N'2023-03-21' AS Date), N'Delivered')
SET IDENTITY_INSERT [dbo].[Shipments] OFF
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
/****** Object:  StoredProcedure [dbo].[sp_GetComplexOrderReport]    Script Date: 01/04/2025 1:26:09 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetComplexOrderReport]
    @StartDate DATE,
    @EndDate DATE,
    @CustomerID INT = NULL,
    @MinAmount DECIMAL(18, 2) = NULL,
    @MaxAmount DECIMAL(18, 2) = NULL,
    @OrderStatus NVARCHAR(50) = NULL,
    @ShipmentStatus NVARCHAR(50) = NULL
AS
BEGIN
    SELECT 
        o.OrderID, 
        o.OrderDate, 
        c.Name AS CustomerName, 
        SUM(oi.Quantity * p.Price) AS TotalAmount,   
        SUM(oi.Quantity) AS TotalQuantity,           
        s.ShipmentDate, 
        s.DeliveryStatus, 
        CASE 
            WHEN o.Status = 'Shipped' THEN 'Shipped'
            WHEN o.Status = 'Pending' THEN 'Pending'
            ELSE 'Other'
        END AS OrderStatus,
        CASE 
            WHEN s.DeliveryStatus = 'Delivered' THEN 'Delivered'
            WHEN s.DeliveryStatus = 'Shipped' THEN 'Shipped'
            ELSE 'In Transit'
        END AS ShipmentStatus
    FROM Orders o
    JOIN Customers c ON o.CustomerID = c.CustomerID
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    JOIN Products p ON oi.ProductID = p.ProductID
    LEFT JOIN Shipments s ON o.OrderID = s.OrderID
    WHERE o.OrderDate BETWEEN @StartDate AND @EndDate
    AND (@CustomerID IS NULL OR o.CustomerID = @CustomerID)  
    GROUP BY o.OrderID, o.OrderDate, c.Name, s.ShipmentDate, s.DeliveryStatus, o.Status
    HAVING 
        (@MinAmount IS NULL OR SUM(oi.Quantity * p.Price) >= @MinAmount) 
        AND (@MaxAmount IS NULL OR SUM(oi.Quantity * p.Price) <= @MaxAmount)  
        AND (@OrderStatus IS NULL OR o.Status = @OrderStatus)  
        AND (@ShipmentStatus IS NULL OR s.DeliveryStatus = @ShipmentStatus) 
    ORDER BY o.OrderDate;
END;
GO
USE [master]
GO
ALTER DATABASE [ShinStore] SET  READ_WRITE 
GO
