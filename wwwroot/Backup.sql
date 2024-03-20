USE [coredb]
GO
/****** Object:  User [dhaval]    Script Date: 3/20/2024 4:29:08 PM ******/
CREATE USER [dhaval] FOR LOGIN [dhaval] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
	[FirstName] [varchar](30) NULL,
	[LastName] [varchar](30) NULL,
	[Email] [varchar](255) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Address] [nvarchar](60) NULL,
	[Birthdate] [date] NULL,
	[Password] [nvarchar](20) NULL,
	[IsDelete] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](255) NULL,
	[ProductDesc] [nvarchar](255) NULL,
	[ProductPrice] [decimal](10, 2) NULL,
	[ProductCategory] [nvarchar](50) NULL,
	[ProductStock] [int] NULL,
	[IsDelete] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryId] [int] NOT NULL,
	[ProductCategoryName] [varchar](255) NOT NULL,
	[IsDelete] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usertbl]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usertbl](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](30) NULL,
	[LastName] [nvarchar](30) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](20) NULL,
	[Date] [date] NULL,
	[IsDelete] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (1, N'John', N'Doe', N'john.doe@gmail.com', N'(555) 555-1212', N'123 Main St, Anytown, CA 12345', CAST(N'1980-01-01' AS Date), N'hunter2!', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (2, N'Jane', N'Smith', N'jane.smith@gmail.com', N'(555) 555-1213', N'456 Elm St, Anytown, CA 12345', CAST(N'1975-12-31' AS Date), N'sunshine123', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (3, N'Michael', N'Lee', N'michael.lee@gmail.com', N'(555) 555-1214', N'789 Oak St, Anytown, CA 12345', CAST(N'1990-07-04' AS Date), N'dragonfire', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (4, N'Amanda', N'Garcia', N'amanda.garcia@gmail.com', N'(555) 555-1215', N'1011 Pine St, Anytown, CA 12345', CAST(N'1985-04-25' AS Date), N'password123', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (5, N'David', N'Hernandez', N'david.hernandez@gmail.com', N'(555) 555-1216', N'1314 Spruce St, Anytown, CA 12345', CAST(N'1995-03-10' AS Date), N'welcome1', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (6, N'Sarah', N'Johnson', N'sarah.johnson@gmail.com', N'(555) 555-1217', N'1617 Maple St, Anytown, CA 12345', CAST(N'2000-11-18' AS Date), N'happyday', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (7, N'William', N'Jones', N'william.jones@gmail.com', N'(555) 555-1218', N'1920 Walnut St, Anytown, CA 12345', CAST(N'1970-09-22' AS Date), N'peanutbutter', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (8, N'Jennifer', N'Brown', N'jennifer.brown@gmail.com', N'(555) 555-1219', N'2223 Birch St, Anytown, CA 12345', CAST(N'1982-05-06' AS Date), N'princess', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (9, N'Matthew', N'Davis', N'matthew.davis@gmail.com', N'(555) 555-1220', N'2526 Poplar St, Anytown, CA 12345', CAST(N'1992-02-14' AS Date), N'baseballfan', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (10, N'Emily', N'Wilson', N'emily.wilson@gmail.com', N'(555) 555-1221', N'2829 Elm St, Anytown, CA 12345', CAST(N'1988-08-21' AS Date), N'chocolate!', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (11, N'Brandon', N'Miller', N'brandon.miller@gmail.com', N'(555) 555-1222', N'3132 Oak St, Anytown, CA 12345', CAST(N'1978-06-09' AS Date), N'fishing4life', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (12, N'Jessica', N'Moore', N'jessica.moore@gmail.com', N'(555) 555-1223', N'3435 Pine St, Anytown, CA 12345', CAST(N'1998-01-27' AS Date), N'bookworm', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (13, N'Christopher', N'Allen', N'christopher.allen@gmail.com', N'(555) 555-1224', N'3738 Spruce St, Anytown, CA 12345', CAST(N'1984-10-12' AS Date), N'musiclover', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (14, N'Ashley', N'Wright', N'ashley.wright@gmail.com', N'(555) 555-1225', N'4041 Maple St, Anytown, CA 12345', CAST(N'1990-03-05' AS Date), N'sunshine123!', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (15, N'Daniel', N'Clark', N'daniel.clark@gmail.com', N'(555) 555-1226', N'4344 Walnut St, Anytown, CA 12345', CAST(N'1972-04-17' AS Date), N'qwerty', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (16, N'Elizabeth', N'Rodriguez', N'elizabeth.rodriguez@gmail.com', N'(555) 555-1227', N'4647 Birch St, Anytown, CA 12345', CAST(N'1997-12-25' AS Date), N'passw0rd', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (17, N'Joseph', N'Lopez', N'joseph.lopez@gmail.com', N'(555) 555-1228', N'4950 Poplar St, Anytown, CA 12345', CAST(N'1981-09-08' AS Date), N'coffee123', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (18, N'Barbara', N'Lewis', N'barbara.lewis@gmail.com', N'(555) 555-1229', N'5253 Elm St, Anytown, CA 12345', CAST(N'1976-07-14' AS Date), N'ilovemydog', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (19, N'Kevin', N'Walker', N'kevin.walker@gmail.com', N'(555) 555-1230', N'5556 Oak St, Anytown, CA 12345', CAST(N'1994-02-20' AS Date), N'secret', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (20, N'Stephanie', N'Hall', N'stephanie.hall@gmail.com', N'(555) 555-1231', N'5859 Pine St, Anytown, CA 12345', CAST(N'1987-11-16' AS Date), N'shopping!', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (21, N'Brian', N'Young', N'brian.young@gmail.com', N'(555) 555-1232', N'6162 Spruce St, Anytown, CA 12345', CAST(N'1979-08-23' AS Date), N'password1', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (22, N'Michelle', N'King', N'michelle.king@gmail.com', N'(555) 555-1233', N'6465 Maple St, Anytown, CA 12345', CAST(N'1999-03-19' AS Date), N'hello123', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (23, N'James', N'Allen', N'james.allen@gmail.com', N'(555) 555-1234', N'6768 Walnut St, Anytown, CA 12345', CAST(N'1983-12-24' AS Date), N'sportsfan', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (24, N'Rebecca', N'Lee', N'rebecca.lee@gmail.com', N'(555) 555-1235', N'7071 Birch St, Anytown, CA 12345', CAST(N'1996-01-10' AS Date), N'travelbug', N'N')
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [PhoneNumber], [Address], [Birthdate], [Password], [IsDelete]) VALUES (25, N'Andrew', N'Brown', N'andrew.brown@gmail.com', N'(555) 555-1236', N'7374 Poplar St, Anytown, CA 12345', CAST(N'1989-06-15' AS Date), N'welcome123', N'N')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDesc], [ProductPrice], [ProductCategory], [ProductStock], [IsDelete]) VALUES (1, N'Product1', N'Product is amazing Kharid nahi paoge', CAST(1111.00 AS Decimal(10, 2)), N'Books', 11, N'N')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDesc], [ProductPrice], [ProductCategory], [ProductStock], [IsDelete]) VALUES (2, N'Nicki', N'mfdsf', CAST(1111.00 AS Decimal(10, 2)), N'Shoes', 11, N'N')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDesc], [ProductPrice], [ProductCategory], [ProductStock], [IsDelete]) VALUES (3, N'puma', N'Product is amazing Kharid nahi paoge', CAST(1111.00 AS Decimal(10, 2)), N'Shoes', 11, N'N')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductDesc], [ProductPrice], [ProductCategory], [ProductStock], [IsDelete]) VALUES (4, N'Product1', N'wdk', CAST(1111.00 AS Decimal(10, 2)), N'Fitness', 11, N'N')
GO
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [ProductCategoryName], [IsDelete]) VALUES (1, N'Bags', N'N')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [ProductCategoryName], [IsDelete]) VALUES (2, N'Books', N'N')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [ProductCategoryName], [IsDelete]) VALUES (3, N'Clothing', N'N')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [ProductCategoryName], [IsDelete]) VALUES (4, N'Electronic', N'N')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [ProductCategoryName], [IsDelete]) VALUES (5, N'Fitness', N'N')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [ProductCategoryName], [IsDelete]) VALUES (6, N'Kitchen Appliances', N'N')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [ProductCategoryName], [IsDelete]) VALUES (7, N'Kitchenware', N'N')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [ProductCategoryName], [IsDelete]) VALUES (8, N'Office Supplies', N'N')
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [ProductCategoryName], [IsDelete]) VALUES (9, N'Shoes', N'N')
GO
SET IDENTITY_INSERT [dbo].[Usertbl] ON 

INSERT [dbo].[Usertbl] ([UserId], [FirstName], [LastName], [Email], [Password], [Date], [IsDelete]) VALUES (55, N'Varsha', N'Jha', N'varsha@gmail.com', N'ZGVzb3RvQDEyMw==', CAST(N'1996-02-16' AS Date), N'N')
INSERT [dbo].[Usertbl] ([UserId], [FirstName], [LastName], [Email], [Password], [Date], [IsDelete]) VALUES (1046, N'Vishal', N'Vaghela', N'vishal@gmail.com', N'MTExMQ==', CAST(N'2000-02-14' AS Date), N'N')
INSERT [dbo].[Usertbl] ([UserId], [FirstName], [LastName], [Email], [Password], [Date], [IsDelete]) VALUES (1047, N'Nisarg', N'Prajapati', N'nisarg@gmail.com', N'MTExMQ==', CAST(N'2001-03-06' AS Date), N'N')
INSERT [dbo].[Usertbl] ([UserId], [FirstName], [LastName], [Email], [Password], [Date], [IsDelete]) VALUES (1048, N'Vishu', N'Vaghela', N'vishu@gmail.com', N'MTExMQ==', CAST(N'2000-02-14' AS Date), N'N')
INSERT [dbo].[Usertbl] ([UserId], [FirstName], [LastName], [Email], [Password], [Date], [IsDelete]) VALUES (1049, N'King', N'Rocco', N'king@gmail.com', N'MTExMQ==', CAST(N'1992-02-14' AS Date), N'N')
INSERT [dbo].[Usertbl] ([UserId], [FirstName], [LastName], [Email], [Password], [Date], [IsDelete]) VALUES (1050, N'scs', N'Rocco', N'king@gmail.com', N'MTExMQ==', CAST(N'1995-02-14' AS Date), N'N')
INSERT [dbo].[Usertbl] ([UserId], [FirstName], [LastName], [Email], [Password], [Date], [IsDelete]) VALUES (1051, N'King', N'Rocco', N'king@gmail.com', N'MTExMQ==', CAST(N'2006-03-13' AS Date), N'N')
INSERT [dbo].[Usertbl] ([UserId], [FirstName], [LastName], [Email], [Password], [Date], [IsDelete]) VALUES (1052, N'scs', N'Jha', N'vishal@gmail.com', N'MTExMQ==', CAST(N'2006-03-13' AS Date), N'N')
INSERT [dbo].[Usertbl] ([UserId], [FirstName], [LastName], [Email], [Password], [Date], [IsDelete]) VALUES (1053, N'King', N'Rocco', N'king@gmail.com', N'MTExMQ==', CAST(N'2006-03-13' AS Date), N'N')
INSERT [dbo].[Usertbl] ([UserId], [FirstName], [LastName], [Email], [Password], [Date], [IsDelete]) VALUES (1054, N'King', N'Rocco', N'king@gmail.com', N'MTExMQ==', CAST(N'2006-03-13' AS Date), N'N')
SET IDENTITY_INSERT [dbo].[Usertbl] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D10534CE043505]    Script Date: 3/20/2024 4:29:08 PM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CategoryStockCharts]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CategoryStockCharts]
as
SELECT ProductCategory, SUM(ProductStock) AS ProductStock
FROM Product
GROUP BY ProductCategory
ORDER BY ProductCategory;
GO
/****** Object:  StoredProcedure [dbo].[GetCustomer]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetCustomer]
As
Select dbo.Customer.CustomerID,dbo.Customer.FirstName,dbo.Customer.LastName,dbo.Customer.Email,dbo.Customer.PhoneNumber,dbo.Customer.Address,dbo.Customer.Birthdate, dbo.Customer.Password,dbo.Customer.IsDelete
from Customer;
GO
/****** Object:  StoredProcedure [dbo].[GetProduct]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetProduct]
As
SELECT dbo.Product.ProductID, dbo.Product.ProductName, dbo.Product.ProductDesc,dbo.Product.ProductPrice,dbo.Product.ProductPrice,dbo.Product.ProductCategory,dbo.Product.ProductStock
from Product;
GO
/****** Object:  StoredProcedure [dbo].[InsertData]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[InsertData]
@FirstName NVARCHAR(30),
@LastName NVARCHAR(30),
@Email NVARCHAR(50),
@Password NVARCHAR(20),
@Date date
as
begin
insert into Usertbl(FirstName,LastName,Email,[Password],[Date],IsDelete)values(@FirstName,@LastName,@Email,@Password,@Date,'N')
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProduct]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[InsertProduct]
@ProductName nvarchar(225),
@ProductDesc nvarchar(225),
@ProductPrice nvarchar(10),
@ProductCategory nvarchar(50),
@ProductStock int
as
begin
insert into Product(ProductID,ProductName,ProductDesc,ProductPrice,ProductCategory,ProductStock,IsDelete)
values(Next Value for ProductSeq,@ProductName,@ProductDesc,@ProductPrice,@ProductCategory,@ProductStock,'N')
end
GO
/****** Object:  StoredProcedure [dbo].[LoginSP]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[LoginSP]
@FirstName nvarchar(50) null,
@LastName nvarchar(50) null,
@Password nvarchar(50) null,
@Isvalid bit Out
as
begin
--Set @Isvalid =(Select Count(@Admin_id) from Adminlogin where Admin_id = @Admin_id and [Password]=@Password)
--Set @Isvalid =(Select Count(@FirstName) AS VishalCount, Count(@LastName) AS VaghelaCount from Employees where FirstName = @FirstName and LastName = @LastName and [Password]= @Password)
Set @Isvalid =(Select Count(*) FROM Usertbl where FirstName = @FirstName and LastName = @LastName and [Password]= @Password)
end	
GO
/****** Object:  StoredProcedure [dbo].[ProInsertData]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[ProInsertData]
@ProductName NVARCHAR(30),
@ProductDesc NVARCHAR(30),
@ProductPrice NVARCHAR(50),
@ProductCategory NVARCHAR(20),
@ProductStock int
as
insert into Product(ProductName,ProductDesc,ProductPrice,ProductCategory,ProductStock,IsDelete)values(@ProductName,@ProductDesc,@ProductPrice,@ProductCategory,@ProductStock,'N');
GO
/****** Object:  StoredProcedure [dbo].[TotalCategory]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[TotalCategory]
as
SELECT ProductCategory, SUM(ProductStock) AS TotalStock
FROM Product
GROUP BY ProductCategory
ORDER BY ProductCategory;
GO
/****** Object:  StoredProcedure [dbo].[TotalCategorysp]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[TotalCategorysp]
as
select * from ProductCategory;
GO
/****** Object:  StoredProcedure [dbo].[TotalDataSp]    Script Date: 3/20/2024 4:29:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TotalDataSp]
AS
BEGIN

  -- Count total customers
  DECLARE @TotalCustomer INT;
  SELECT @TotalCustomer = COUNT(*) FROM Customer;

  -- Count total products and distinct categories
  DECLARE @TotalProduct INT, @TotalProductCategory INT;
  SELECT @TotalProduct = COUNT(*), @TotalProductCategory = COUNT(DISTINCT ProductCategory)
  FROM Product;

  -- Return results
  SELECT @TotalCustomer AS TotalCustomer, @TotalProduct AS TotalProduct, @TotalProductCategory AS TotalProductCategory;

END;
GO
