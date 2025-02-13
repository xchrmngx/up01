USE [MasterFloor2]
GO
/****** Object:  Table [dbo].[adress]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[postalCode] [int] NULL,
	[area] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[street] [nvarchar](255) NULL,
	[houseNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_adress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cex]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cex](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_adress] [int] NULL,
 CONSTRAINT [PK_cex] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[family_status]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[family_status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_family_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[history_changing_minimal_price]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history_changing_minimal_price](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[date] [date] NULL,
	[cost] [decimal](18, 2) NULL,
 CONSTRAINT [PK_history_changing_minimal_price] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[history_provide_material]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history_provide_material](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_production] [int] NULL,
	[id_provider] [int] NULL,
	[date] [date] NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_history_provide_material] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[history_sale_product]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history_sale_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_product] [int] NULL,
	[id_partner] [int] NULL,
	[date] [date] NULL,
	[count] [int] NULL,
 CONSTRAINT [PK_history_sale_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_typeMaterial] [int] NULL,
	[id_measurement] [int] NULL,
	[id_provider] [int] NULL,
	[name] [nvarchar](50) NULL,
	[count] [int] NULL,
	[description] [nvarchar](50) NULL,
	[img] [nvarchar](50) NULL,
	[price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_material] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[materialType]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[materialType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[percentDefective] [int] NULL,
 CONSTRAINT [PK_materialType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[measurement]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[measurement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_measurement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[packageSize]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[packageSize](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[width_centimetr] [int] NULL,
	[height_centimetr] [int] NULL,
	[length_centimetr] [int] NULL,
 CONSTRAINT [PK_packageSize] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partnerContact]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partnerContact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lastname] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[fathername] [nvarchar](255) NULL,
	[telephone] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
 CONSTRAINT [PK_partnerContact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partnerProducts]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partnerProducts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_products] [int] NULL,
	[id_partner] [int] NULL,
	[count] [int] NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_partnerProducts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partners]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partners](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_partnerType] [int] NULL,
	[id_contact] [int] NULL,
	[id_adress] [int] NULL,
	[name] [nvarchar](255) NULL,
	[inn] [nvarchar](12) NULL,
	[rating] [int] NULL,
 CONSTRAINT [PK_partners] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partnerType]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partnerType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_partnerType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[passport]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[passport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_familyStatus] [int] NULL,
	[sex] [nvarchar](1) NULL,
	[passport_series] [nvarchar](4) NULL,
	[passport_number] [nvarchar](6) NULL,
	[lastname] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[fathername] [nvarchar](50) NULL,
 CONSTRAINT [PK_passport] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_productType] [int] NULL,
	[name] [nvarchar](255) NULL,
	[articule] [int] NULL,
	[minimalCost] [decimal](18, 2) NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productType]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[coefficient] [int] NULL,
 CONSTRAINT [PK_productType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provider]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_typeProvider] [int] NULL,
	[name] [nvarchar](50) NULL,
	[inn] [nvarchar](12) NULL,
 CONSTRAINT [PK_provider] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requisites]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requisites](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameRecipient] [nvarchar](50) NULL,
	[lastnameRecipient] [nvarchar](50) NULL,
	[fathernameRecipient] [nvarchar](50) NULL,
	[inn] [nvarchar](12) NULL,
	[number] [nvarchar](20) NULL,
	[nameBank] [nvarchar](50) NULL,
	[k_s] [nvarchar](20) NULL,
	[bik] [nvarchar](9) NULL,
	[kbk] [nvarchar](20) NULL,
 CONSTRAINT [PK_requisites] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salesPoints]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salesPoints](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_adress] [int] NULL,
	[id_partner] [int] NULL,
 CONSTRAINT [PK_salesPoints] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[typeProvider]    Script Date: 02.11.2024 20:24:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typeProvider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_typeProvider] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[adress] ON 

INSERT [dbo].[adress] ([id], [postalCode], [area], [city], [street], [houseNumber]) VALUES (1, 652050, N'Кемеровская', N'Юрга', N'Лесная', N'15')
INSERT [dbo].[adress] ([id], [postalCode], [area], [city], [street], [houseNumber]) VALUES (2, 164500, N'Архангельская', N'Северодвинск', N'Строителей', N'18')
INSERT [dbo].[adress] ([id], [postalCode], [area], [city], [street], [houseNumber]) VALUES (3, 188910, N'Ленинградская', N'Приморск', N'Парковая', N'21')
INSERT [dbo].[adress] ([id], [postalCode], [area], [city], [street], [houseNumber]) VALUES (4, 143960, N'Московская', N'Реутов', N'Свободы', N'51')
INSERT [dbo].[adress] ([id], [postalCode], [area], [city], [street], [houseNumber]) VALUES (5, 309500, N'Белгородская', N'Старый Оскол', N'Рабочая', N'122')
INSERT [dbo].[adress] ([id], [postalCode], [area], [city], [street], [houseNumber]) VALUES (6, 83, N'а', N'а', N'а', N'13')
INSERT [dbo].[adress] ([id], [postalCode], [area], [city], [street], [houseNumber]) VALUES (8, 83, N'f', N'f', N'f', N'f')
INSERT [dbo].[adress] ([id], [postalCode], [area], [city], [street], [houseNumber]) VALUES (9, 83, N'fgh', N'f', N'f', N'f')
INSERT [dbo].[adress] ([id], [postalCode], [area], [city], [street], [houseNumber]) VALUES (10, 83, N'fgh', N'f', N'f', N'f')
INSERT [dbo].[adress] ([id], [postalCode], [area], [city], [street], [houseNumber]) VALUES (11, 83, N'f', N'f', N'f', N'f')
INSERT [dbo].[adress] ([id], [postalCode], [area], [city], [street], [houseNumber]) VALUES (12, 83, N'а', N'а', N'а', N'а')
INSERT [dbo].[adress] ([id], [postalCode], [area], [city], [street], [houseNumber]) VALUES (13, 83, N'а', N'а', N'а', N'а')
SET IDENTITY_INSERT [dbo].[adress] OFF
GO
SET IDENTITY_INSERT [dbo].[materialType] ON 

INSERT [dbo].[materialType] ([id], [name], [percentDefective]) VALUES (1, N'Тип материала 1', 0)
INSERT [dbo].[materialType] ([id], [name], [percentDefective]) VALUES (2, N'Тип материала 2', 0)
INSERT [dbo].[materialType] ([id], [name], [percentDefective]) VALUES (3, N'Тип материала 3', 0)
INSERT [dbo].[materialType] ([id], [name], [percentDefective]) VALUES (4, N'Тип материала 4', 0)
INSERT [dbo].[materialType] ([id], [name], [percentDefective]) VALUES (5, N'Тип материала 5', 0)
SET IDENTITY_INSERT [dbo].[materialType] OFF
GO
SET IDENTITY_INSERT [dbo].[partnerContact] ON 

INSERT [dbo].[partnerContact] ([id], [lastname], [name], [fathername], [telephone], [email]) VALUES (1, N'Иванова', N'Александра', N'Ивановна', N'493 123 45 67', N'aleksandraivanova@ml.ru')
INSERT [dbo].[partnerContact] ([id], [lastname], [name], [fathername], [telephone], [email]) VALUES (2, N'Петров', N'Василий', N'Петрович', N'987 123 56 78', N'vppetrov@vl.ru')
INSERT [dbo].[partnerContact] ([id], [lastname], [name], [fathername], [telephone], [email]) VALUES (3, N'Соловьев', N'Андрей', N'Николаевич', N'812 223 32 00', N'ansolovev@st.ru')
INSERT [dbo].[partnerContact] ([id], [lastname], [name], [fathername], [telephone], [email]) VALUES (4, N'Воробьева', N'Екатерина', N'Валерьевна', N'444 222 33 11', N'ekaterina.vorobeva@ml.ru')
INSERT [dbo].[partnerContact] ([id], [lastname], [name], [fathername], [telephone], [email]) VALUES (5, N'Степанов', N'Степан', N'Сергеевич', N'912 888 33 33', N'stepanov@stepan.ru')
INSERT [dbo].[partnerContact] ([id], [lastname], [name], [fathername], [telephone], [email]) VALUES (7, N'а', N'а', N'а', N'3', N'f@.ru')
INSERT [dbo].[partnerContact] ([id], [lastname], [name], [fathername], [telephone], [email]) VALUES (9, N'а', N'а', N'а', N'2', N'f@.ru')
INSERT [dbo].[partnerContact] ([id], [lastname], [name], [fathername], [telephone], [email]) VALUES (10, N'k', N'k', N'k', N'56', N'jk.@.ru')
INSERT [dbo].[partnerContact] ([id], [lastname], [name], [fathername], [telephone], [email]) VALUES (11, N'k', N'k', N'k', N'56', N'jk.@.ru')
INSERT [dbo].[partnerContact] ([id], [lastname], [name], [fathername], [telephone], [email]) VALUES (12, N'f', N'f', N'f', N'234', N'sdaf@.ru')
INSERT [dbo].[partnerContact] ([id], [lastname], [name], [fathername], [telephone], [email]) VALUES (13, N'Николаевна', N'Полина', N'Токарева', N'128382123', N'tokareva@bk.ru')
INSERT [dbo].[partnerContact] ([id], [lastname], [name], [fathername], [telephone], [email]) VALUES (14, N'Николаевна', N'Полина', N'Токарева', N'560858669458', N'hkrj@ikjdfol.com')
SET IDENTITY_INSERT [dbo].[partnerContact] OFF
GO
SET IDENTITY_INSERT [dbo].[partnerProducts] ON 

INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (1, 1, 1, 15500, CAST(N'2023-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (2, 3, 1, 12350, CAST(N'2023-12-18T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (3, 4, 1, 37400, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (4, 2, 2, 35000, CAST(N'2022-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (5, 5, 2, 1250, CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (6, 3, 2, 1000, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (7, 1, 2, 7550, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (8, 1, 3, 7250, CAST(N'2023-01-22T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (9, 2, 3, 2500, CAST(N'2024-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (10, 4, 4, 59050, CAST(N'2023-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (11, 3, 4, 37200, CAST(N'2024-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (12, 5, 4, 4500, CAST(N'2024-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (13, 3, 5, 50000, CAST(N'2023-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (14, 4, 5, 670000, CAST(N'2023-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (15, 1, 5, 35000, CAST(N'2024-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[partnerProducts] ([id], [id_products], [id_partner], [count], [date]) VALUES (16, 2, 5, 25000, CAST(N'2024-06-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[partnerProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[partners] ON 

INSERT [dbo].[partners] ([id], [id_partnerType], [id_contact], [id_adress], [name], [inn], [rating]) VALUES (1, 1, 1, 1, N'База Строитель', N'2222455179
', 7)
INSERT [dbo].[partners] ([id], [id_partnerType], [id_contact], [id_adress], [name], [inn], [rating]) VALUES (2, 2, 2, 2, N'Паркет 29', N'3333888520
', 7)
INSERT [dbo].[partners] ([id], [id_partnerType], [id_contact], [id_adress], [name], [inn], [rating]) VALUES (3, 3, 3, 3, N'Стройсервис', N'4440391035
', 7)
INSERT [dbo].[partners] ([id], [id_partnerType], [id_contact], [id_adress], [name], [inn], [rating]) VALUES (4, 2, 4, 4, N'АААААААААААААААА', N'1111520857
', 5)
INSERT [dbo].[partners] ([id], [id_partnerType], [id_contact], [id_adress], [name], [inn], [rating]) VALUES (5, 1, 5, 5, N'МонтажПро', N'5552431140
', 10)
INSERT [dbo].[partners] ([id], [id_partnerType], [id_contact], [id_adress], [name], [inn], [rating]) VALUES (13, 1, NULL, NULL, N'ТОКАРЕва', N'123', 213)
INSERT [dbo].[partners] ([id], [id_partnerType], [id_contact], [id_adress], [name], [inn], [rating]) VALUES (14, 2, 14, 13, N'Токарева', N'34587534570', 6)
SET IDENTITY_INSERT [dbo].[partners] OFF
GO
SET IDENTITY_INSERT [dbo].[partnerType] ON 

INSERT [dbo].[partnerType] ([id], [name]) VALUES (1, N'ЗАО')
INSERT [dbo].[partnerType] ([id], [name]) VALUES (2, N'ООО')
INSERT [dbo].[partnerType] ([id], [name]) VALUES (3, N'ПАО')
INSERT [dbo].[partnerType] ([id], [name]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[partnerType] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [id_productType], [name], [articule], [minimalCost]) VALUES (1, 3, N'Паркетная доска Ясень темный однополосная 14 мм', 8758385, CAST(4456.90 AS Decimal(18, 2)))
INSERT [dbo].[products] ([id], [id_productType], [name], [articule], [minimalCost]) VALUES (2, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 8858958, CAST(7330.99 AS Decimal(18, 2)))
INSERT [dbo].[products] ([id], [id_productType], [name], [articule], [minimalCost]) VALUES (3, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 7750282, CAST(1799.33 AS Decimal(18, 2)))
INSERT [dbo].[products] ([id], [id_productType], [name], [articule], [minimalCost]) VALUES (4, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 7028748, CAST(3890.41 AS Decimal(18, 2)))
INSERT [dbo].[products] ([id], [id_productType], [name], [articule], [minimalCost]) VALUES (5, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 5012543, CAST(5450.59 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[productType] ON 

INSERT [dbo].[productType] ([id], [name], [coefficient]) VALUES (1, N'Ламинат', 2)
INSERT [dbo].[productType] ([id], [name], [coefficient]) VALUES (2, N'Массивная доска', 5)
INSERT [dbo].[productType] ([id], [name], [coefficient]) VALUES (3, N'Паркетная доска', 4)
INSERT [dbo].[productType] ([id], [name], [coefficient]) VALUES (4, N'Пробковое покрытие', 1)
SET IDENTITY_INSERT [dbo].[productType] OFF
GO
ALTER TABLE [dbo].[cex]  WITH CHECK ADD  CONSTRAINT [FK_cex_adress] FOREIGN KEY([id_adress])
REFERENCES [dbo].[adress] ([id])
GO
ALTER TABLE [dbo].[cex] CHECK CONSTRAINT [FK_cex_adress]
GO
ALTER TABLE [dbo].[history_changing_minimal_price]  WITH CHECK ADD  CONSTRAINT [FK_history_changing_minimal_price_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[history_changing_minimal_price] CHECK CONSTRAINT [FK_history_changing_minimal_price_products]
GO
ALTER TABLE [dbo].[history_provide_material]  WITH CHECK ADD  CONSTRAINT [FK_history_provide_material_products] FOREIGN KEY([id_production])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[history_provide_material] CHECK CONSTRAINT [FK_history_provide_material_products]
GO
ALTER TABLE [dbo].[history_provide_material]  WITH CHECK ADD  CONSTRAINT [FK_history_provide_material_provider] FOREIGN KEY([id_provider])
REFERENCES [dbo].[provider] ([id])
GO
ALTER TABLE [dbo].[history_provide_material] CHECK CONSTRAINT [FK_history_provide_material_provider]
GO
ALTER TABLE [dbo].[history_sale_product]  WITH CHECK ADD  CONSTRAINT [FK_history_sale_product_partners] FOREIGN KEY([id_partner])
REFERENCES [dbo].[partners] ([id])
GO
ALTER TABLE [dbo].[history_sale_product] CHECK CONSTRAINT [FK_history_sale_product_partners]
GO
ALTER TABLE [dbo].[history_sale_product]  WITH CHECK ADD  CONSTRAINT [FK_history_sale_product_products] FOREIGN KEY([id_product])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[history_sale_product] CHECK CONSTRAINT [FK_history_sale_product_products]
GO
ALTER TABLE [dbo].[material]  WITH CHECK ADD  CONSTRAINT [FK_material_materialType] FOREIGN KEY([id_typeMaterial])
REFERENCES [dbo].[materialType] ([id])
GO
ALTER TABLE [dbo].[material] CHECK CONSTRAINT [FK_material_materialType]
GO
ALTER TABLE [dbo].[material]  WITH CHECK ADD  CONSTRAINT [FK_material_measurement] FOREIGN KEY([id_measurement])
REFERENCES [dbo].[measurement] ([id])
GO
ALTER TABLE [dbo].[material] CHECK CONSTRAINT [FK_material_measurement]
GO
ALTER TABLE [dbo].[material]  WITH CHECK ADD  CONSTRAINT [FK_material_provider] FOREIGN KEY([id_provider])
REFERENCES [dbo].[provider] ([id])
GO
ALTER TABLE [dbo].[material] CHECK CONSTRAINT [FK_material_provider]
GO
ALTER TABLE [dbo].[partnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_partnerProducts_partners] FOREIGN KEY([id_partner])
REFERENCES [dbo].[partners] ([id])
GO
ALTER TABLE [dbo].[partnerProducts] CHECK CONSTRAINT [FK_partnerProducts_partners]
GO
ALTER TABLE [dbo].[partnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_partnerProducts_products] FOREIGN KEY([id_products])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[partnerProducts] CHECK CONSTRAINT [FK_partnerProducts_products]
GO
ALTER TABLE [dbo].[partners]  WITH CHECK ADD  CONSTRAINT [FK_partners_adress] FOREIGN KEY([id_adress])
REFERENCES [dbo].[adress] ([id])
GO
ALTER TABLE [dbo].[partners] CHECK CONSTRAINT [FK_partners_adress]
GO
ALTER TABLE [dbo].[partners]  WITH CHECK ADD  CONSTRAINT [FK_partners_partnerContact] FOREIGN KEY([id_contact])
REFERENCES [dbo].[partnerContact] ([id])
GO
ALTER TABLE [dbo].[partners] CHECK CONSTRAINT [FK_partners_partnerContact]
GO
ALTER TABLE [dbo].[partners]  WITH CHECK ADD  CONSTRAINT [FK_partners_partnerType] FOREIGN KEY([id_partnerType])
REFERENCES [dbo].[partnerType] ([id])
GO
ALTER TABLE [dbo].[partners] CHECK CONSTRAINT [FK_partners_partnerType]
GO
ALTER TABLE [dbo].[passport]  WITH CHECK ADD  CONSTRAINT [FK_passport_family_status] FOREIGN KEY([id_familyStatus])
REFERENCES [dbo].[family_status] ([id])
GO
ALTER TABLE [dbo].[passport] CHECK CONSTRAINT [FK_passport_family_status]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_productType] FOREIGN KEY([id_productType])
REFERENCES [dbo].[productType] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_productType]
GO
ALTER TABLE [dbo].[provider]  WITH CHECK ADD  CONSTRAINT [FK_provider_typeProvider] FOREIGN KEY([id_typeProvider])
REFERENCES [dbo].[typeProvider] ([id])
GO
ALTER TABLE [dbo].[provider] CHECK CONSTRAINT [FK_provider_typeProvider]
GO
ALTER TABLE [dbo].[salesPoints]  WITH CHECK ADD  CONSTRAINT [FK_salesPoints_adress] FOREIGN KEY([id_adress])
REFERENCES [dbo].[adress] ([id])
GO
ALTER TABLE [dbo].[salesPoints] CHECK CONSTRAINT [FK_salesPoints_adress]
GO
ALTER TABLE [dbo].[salesPoints]  WITH CHECK ADD  CONSTRAINT [FK_salesPoints_partners] FOREIGN KEY([id_partner])
REFERENCES [dbo].[partners] ([id])
GO
ALTER TABLE [dbo].[salesPoints] CHECK CONSTRAINT [FK_salesPoints_partners]
GO
