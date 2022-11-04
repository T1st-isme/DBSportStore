use DBSportStore
-- Bang AdminUser
CREATE TABLE [dbo].[AdminUser] (
    [ID]           INT            NOT NULL,
    [NameUser]     NVARCHAR (50) NULL,
    [RoleUser]     NVARCHAR (50) NULL,
    [PasswordUser] NCHAR (50)     NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

--Bang Category
CREATE TABLE [dbo].[Category] (
    [IDCate]   INT IDENTITY (1, 1) NOT NULL,
    [NameCate] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([IDCate] ASC)
);
--Bang Customer
CREATE TABLE [dbo].[Customer] (
    [IDCus]    INT  IDENTITY (1, 1) NOT NULL,
    [NameCus]  NVARCHAR (50) NULL,
    [PhoneCus] NVARCHAR (15)  NULL,
    [EmailCus] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([IDCus] ASC)
);

--Bang Products
CREATE TABLE [dbo].[Product] (
    [ProductID]     INT             IDENTITY (1, 1) NOT NULL,
    [NamePro]       NVARCHAR (50)  NULL,
    [DecriptionPro] NVARCHAR (50)  NULL,
    [CateID]        INT      NULL,
    [Price]         DECIMAL (18, 2) NULL,
    [ImagePro]      NVARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [FK_Pro_Category] FOREIGN KEY ([CateID]) REFERENCES [dbo].[Category] ([IDCate])
);
--Bang OrderPro
CREATE TABLE [dbo].[OrderPro] (
    [ID]               INT            IDENTITY (1, 1) NOT NULL,
    [DateOrder]        DATE           NULL,
    [IDCus]            INT            NULL,
    [AddressDeliverry] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IDCus]) REFERENCES [dbo].[Customer] ([IDCus])
);

--Bang OrderDetail
CREATE TABLE [dbo].[OrderDetail] (
    [ID]        INT        IDENTITY (1, 1) NOT NULL,
    [IDProduct] INT        NULL,
    [IDOrder]   INT        NULL,
    [Quantity]  INT        NULL,
    [UnitPrice] FLOAT (53) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    FOREIGN KEY ([IDProduct]) REFERENCES [dbo].[Product] ([ProductID]),
    FOREIGN KEY ([IDOrder]) REFERENCES [dbo].[OrderPro] ([ID])
);

-- Insert dữ liệu
use DBSportStore

------AdminUser
Insert into AdminUser (ID, NameUser, RoleUser, PasswordUser)
	values (1, 'CuiBap', 'CuiBap', '12345678')
Insert into AdminUser (ID, NameUser, RoleUser, PasswordUser)
	values (2, 'MamTom', 'MamTom', '23456789')

------Customer
Insert into Customer (NameCus, PhoneCus, EmailCus)
	values (N'Nguyễn Văn Cùi Bắp', '0903784512', 'cuibap@gmail.com')
Insert into Customer (NameCus, PhoneCus, EmailCus)
	values (N'Lê thị Mắm Tôm', '0913678345', 'mamtom@gmail.com')

------Category
Insert into Category (NameCate)
    Values(N'Giày thể thao')
Insert into Category (NameCate)
    Values(N'Áo quần thi đấu')
Insert into Category (NameCate)
    Values(N'Dụng cụ thể thao')

--------Products
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Áo suông NKD', N'Tay ngắn vải coton', 2, 650, 'aq1.png')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Áo sát nách CT-23', N'Vải coton thoáng mát', 2, 600, 'aq2.png')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Quần dài nam ICADO', N'Co giãn, thoáng mát', 2, 750, 'aq3.png')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Quần đùi PAVO AT2', N'Dễ vận động', 2, 550, 'aq4.png')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Set tập gym nữ, áo BRA, quần', N'Tay ngắn quần cài khuy', 2, 800, 'aq5.jpg')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Set tập gym nữ, áo và quần', N'Áo ngắn tay, quần lửng', 2, 850, 'aq6.jpg')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Giày SNICKER', N'Độn đế', 1, 1200, 'g07.jpg')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Giày SNICKER TT 29.1', N'Xanh, hồng kim tuyến', 1, 1250, 'g08.jpg')
Insert into Product (NamePro, DecriptionPro, CateID, Price, ImagePro)
    values (N'Giày thể thao AT-32', N'Cao cổ', 1, 1300, 'g09.jpg')

--------OrderPro
Insert into OrderPro (DateOrder, IDCus, AddressDeliverry)
	values ('01/01/2022', 1, N'155 Sư Vạn Hạnh,q10')

--------OrderDetail
Insert into OrderDetail (IDProduct, IDOrder, Quantity, UnitPrice)
	values (1, 1, 5, 650)
Insert into OrderDetail (IDProduct, IDOrder, Quantity, UnitPrice)
	values (2, 1, 10, 600)
Insert into OrderDetail (IDProduct, IDOrder, Quantity, UnitPrice)
	values (3, 1, 12, 750)

