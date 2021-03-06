USE [master]
GO
/****** Object:  Database [FinMarketsAppDB]    Script Date: 07.01.2019 12:15:09 ******/
CREATE DATABASE [FinMarketsAppDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinMarketsAppDB', FILENAME = N'D:\FinMarketsAppDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinMarketsAppDB_log', FILENAME = N'D:\FinMarketsAppDB.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FinMarketsAppDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinMarketsAppDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinMarketsAppDB] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [FinMarketsAppDB] SET ANSI_NULLS ON 
GO
ALTER DATABASE [FinMarketsAppDB] SET ANSI_PADDING ON 
GO
ALTER DATABASE [FinMarketsAppDB] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [FinMarketsAppDB] SET ARITHABORT ON 
GO
ALTER DATABASE [FinMarketsAppDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FinMarketsAppDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinMarketsAppDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinMarketsAppDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinMarketsAppDB] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [FinMarketsAppDB] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [FinMarketsAppDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinMarketsAppDB] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [FinMarketsAppDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinMarketsAppDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinMarketsAppDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinMarketsAppDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinMarketsAppDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinMarketsAppDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinMarketsAppDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinMarketsAppDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinMarketsAppDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinMarketsAppDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FinMarketsAppDB] SET  MULTI_USER 
GO
ALTER DATABASE [FinMarketsAppDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinMarketsAppDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinMarketsAppDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinMarketsAppDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinMarketsAppDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinMarketsAppDB] SET QUERY_STORE = OFF
GO
USE [FinMarketsAppDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [FinMarketsAppDB]
GO
/****** Object:  Table [dbo].[WalletsC]    Script Date: 07.01.2019 12:15:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WalletsC](
	[idUser] [int] NOT NULL,
	[idWalletC] [int] NULL,
	[idCrypto] [int] NULL,
	[quantity] [varchar](50) NULL,
	[sum] [varchar](50) NULL,
	[idAlert] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cryptocurrencies]    Script Date: 07.01.2019 12:15:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cryptocurrencies](
	[idCrypto] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[symbol] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[change24h] [varchar](50) NULL,
	[change7d] [varchar](50) NULL,
 CONSTRAINT [PK_Cryptocurrencies] PRIMARY KEY CLUSTERED 
(
	[idCrypto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07.01.2019 12:15:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUsers] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[isLogged] [int] NOT NULL,
	[isAdmin] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[idUsers] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewWallet]    Script Date: 07.01.2019 12:15:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewWallet]
AS
SELECT        dbo.Cryptocurrencies.name, dbo.Cryptocurrencies.symbol, dbo.Cryptocurrencies.price, dbo.WalletsC.quantity, dbo.WalletsC.sum
FROM            dbo.Cryptocurrencies INNER JOIN
                         dbo.WalletsC ON dbo.Cryptocurrencies.idCrypto = dbo.WalletsC.idCrypto INNER JOIN
                         dbo.Users ON dbo.WalletsC.idUser = dbo.Users.idUsers
WHERE        (dbo.Users.idUsers IN
                             (SELECT        idUsers
                               FROM            dbo.Users AS Users_1
                               WHERE        (isLogged = 1)))
GO
/****** Object:  Table [dbo].[Alerts]    Script Date: 07.01.2019 12:15:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alerts](
	[idAlert] [int] NOT NULL,
	[alertNr] [int] NULL,
	[alertValue] [varchar](50) NULL,
 CONSTRAINT [PK_Alerts] PRIMARY KEY CLUSTERED 
(
	[idAlert] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Others]    Script Date: 07.01.2019 12:15:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Others](
	[idOther] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[symbol] [varchar](50) NULL,
	[price] [varchar](50) NULL,
 CONSTRAINT [PK_Others] PRIMARY KEY CLUSTERED 
(
	[idOther] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cryptocurrencies] ON 

INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (300, N'Bitcoin', N'BTC', N'3892,66263028', N'-0,442318', N'-3,53591')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (305, N'Bitcoin Cash', N'BCH', N'164,053783004', N'-1,67794', N'-16,7412')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (307, N'EOS', N'EOS', N'2,65739143614', N'0,41726', N'-5,50826')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (308, N'Litecoin', N'LTC', N'32,206750999', N'0,320022', N'-2,67431')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (309, N'TRON', N'TRX', N'0,0202181010877', N'-0,52182', N'-4,50435')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (310, N'Cardano', N'ADA', N'0,0430005769275', N'3,2222', N'-1,01594')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (311, N'Monero', N'XMR', N'48,6664092959', N'0,154728', N'-9,28893')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (312, N'IOTA', N'MIOTA', N'0,361269644008', N'1,3614', N'-1,79251')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (313, N'NEM', N'XEM', N'0,0695346467478', N'1,16744', N'-6,69651')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (314, N'Binance Coin', N'BNB', N'5,99307868695', N'0,716183', N'-1,40428')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (315, N'Dash', N'DASH', N'83,4362955523', N'1,22775', N'-7,1306')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (316, N'Ethereum Classic', N'ETC', N'5,33008549417', N'0,33399', N'8,65438')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (317, N'NEO', N'NEO', N'8,19005350698', N'4,34836', N'7,47791')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (318, N'Zcash', N'ZEC', N'61,0166319964', N'-0,189924', N'-7,06417')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (319, N'Maker', N'MKR', N'468,5856699', N'-0,607449', N'6,83843')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (320, N'Dogecoin', N'DOGE', N'0,00239780069128', N'-0,42688', N'-5,95276')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (321, N'Tezos', N'XTZ', N'0,50725452803', N'1,06546', N'1,82003')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (322, N'VeChain', N'VET', N'0,00427494011074', N'-0,288876', N'-10,8151')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (323, N'TrueUSD', N'TUSD', N'1,01570666113', N'0,105502', N'0,296')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (324, N'Bitcoin Gold', N'BTG', N'14,1061299625', N'-1,3719', N'-8,39376')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (325, N'USD Coin', N'USDC', N'1,01667065638', N'0,420796', N'0,586305')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (326, N'OmiseGO', N'OMG', N'1,44152326298', N'-0,0834777', N'-12,2951')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (327, N'0x', N'ZRX', N'0,326585970441', N'-2,71011', N'-5,44502')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (328, N'Paxos Standard Token', N'PAX', N'1,0130958399', N'0,22435', N'0,0616691')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (329, N'Basic Attention Token', N'BAT', N'0,138765902375', N'-0,494059', N'-7,54364')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (330, N'Ontology', N'ONT', N'0,619191129512', N'-0,864632', N'-18,0087')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (331, N'Waves', N'WAVES', N'3,10472767892', N'-3,34265', N'-18,4304')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (332, N'Decred', N'DCR', N'18,5218475511', N'-3,7716', N'-2,86408')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (333, N'Qtum', N'QTUM', N'2,33320326501', N'0,366929', N'-6,91229')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (334, N'Lisk', N'LSK', N'1,48413835164', N'0,587879', N'-2,76167')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (335, N'Factom', N'FCT', N'9,14870011027', N'-4,31911', N'-4,53964')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (336, N'Nano', N'NANO', N'0,984125601075', N'-1,02307', N'-8,04701')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (337, N'Bitcoin Diamond', N'BCD', N'0,937514130723', N'1,13222', N'-3,97996')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (338, N'Zilliqa', N'ZIL', N'0,0213093140801', N'2,55811', N'9,37268')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (339, N'Bytecoin', N'BCN', N'0,000737634191654', N'-2,03701', N'-6,30559')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (340, N'DigiByte', N'DGB', N'0,0107649876553', N'0,394352', N'-6,20843')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (341, N'ICON', N'ICX', N'0,243914406902', N'-1,01425', N'-7,08089')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (342, N'BitShares', N'BTS', N'0,040108354295', N'1,21165', N'-9,00289')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (343, N'Aurora', N'AOA', N'0,0119287358813', N'2,13139', N'-7,99743')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (344, N'Siacoin', N'SC', N'0,00273431330757', N'-0,851161', N'-7,98015')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (345, N'Verge', N'XVG', N'0,00740302371222', N'0,333637', N'-9,99263')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (346, N'Aeternity', N'AE', N'0,409471948109', N'0,420869', N'-12,8601')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (347, N'Pundi X', N'NPXS', N'0,000448370717341', N'-8,42429', N'-24,0351')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (348, N'Gemini Dollar', N'GUSD', N'1,00875686508', N'-2,0096', N'-0,225032')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (349, N'Chainlink', N'LINK', N'0,305524743079', N'3,63837', N'-2,03254')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (351, N'QASH', N'QASH', N'0,121233616935', N'0,128959', N'-23,2619')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (352, N'Bytom', N'BTM', N'0,0815423094707', N'0,266061', N'-16,0777')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (353, N'Populous', N'PPT', N'1,60183042632', N'1,21352', N'0,466803')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (354, N'Augur', N'REP', N'8,29456327526', N'-1,04296', N'-1,79405')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (355, N'Komodo', N'KMD', N'0,888070762252', N'8,78108', N'18,6297')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (356, N'Revain', N'R', N'0,187216161454', N'-4,45988', N'-4,8416')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (358, N'Golem', N'GNT', N'0,0752616529206', N'-1,37727', N'3,19334')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (359, N'MaidSafeCoin', N'MAID', N'0,136502201254', N'-4,09147', N'-10,8941')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (360, N'Holo', N'HOT', N'0,000480092608925', N'1,82524', N'-8,98939')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (361, N'Decentraland', N'MANA', N'0,0495003635674', N'-1,8369', N'-15,3439')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (362, N'Cryptonex', N'CNX', N'1,129258485', N'-0,541999', N'-4,13059')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (363, N'Huobi Token', N'HT', N'1,10359792762', N'-0,869698', N'-11,1131')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (364, N'Dai', N'DAI', N'1,00905220056', N'-1,0906', N'0,379914')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (365, N'Electroneum', N'ETN', N'0,00765977439249', N'-1,92399', N'-5,01048')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (366, N'Ardor', N'ARDR', N'0,0554846715467', N'1,62887', N'-1,73467')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (367, N'WAX', N'WAX', N'0,0405995977419', N'-0,174794', N'-3,3758')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (368, N'Status', N'SNT', N'0,0186670684143', N'1,68066', N'-6,04142')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (369, N'MobileGo', N'MGO', N'0,449897284736', N'1,05371', N'4,65607')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (370, N'IOST', N'IOST', N'0,00534403406388', N'6,18093', N'-4,48918')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (371, N'KuCoin Shares', N'KCS', N'0,636150027815', N'-0,0124876', N'-3,80607')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (372, N'ODEM', N'ODE', N'0,208275789654', N'-8,85189', N'-26,3138')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (373, N'Nexo', N'NEXO', N'0,0866336271364', N'-0,456816', N'6,95946')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (374, N'Insight Chain', N'INB', N'0,318825395186', N'-3,93756', N'6,22072')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (375, N'MOAC', N'MOAC', N'0,551636094572', N'6,63563', N'9,11819')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (376, N'Waltonchain', N'WTC', N'1,206657114', N'6,35907', N'-5,63637')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (377, N'Metaverse ETP', N'ETP', N'0,614460838613', N'4,42104', N'1,24292')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (378, N'Elastos', N'ELA', N'2,76994641137', N'-1,64096', N'-6,80141')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (379, N'Wanchain', N'WAN', N'0,362511261393', N'0,236013', N'-10,6158')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (380, N'Bitcoin Private', N'BTCP', N'1,67808635349', N'3,20716', N'-30,0473')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (381, N'Linkey', N'LKY', N'0,886739850499', N'17,0282', N'22,3422')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (382, N'Polymath', N'POLY', N'0,149710520196', N'0,559299', N'-0,286514')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (383, N'Ark', N'ARK', N'0,41838344196', N'2,44858', N'0,681687')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (384, N'STASIS EURS', N'EURS', N'1,17072966662', N'-2,3559', N'0,880976')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (385, N'QuarkChain', N'QKC', N'0,0459844426599', N'0,249134', N'6,34435')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (386, N'ReddCoin', N'RDD', N'0,00132364348899', N'-2,53286', N'-3,89883')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (387, N'Aion', N'AION', N'0,155155795853', N'2,294', N'-10,89')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (388, N'PIVX', N'PIVX', N'1,0010923938', N'16,9411', N'50,7859')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (389, N'Bancor', N'BNT', N'0,66752240988', N'3,25944', N'4,95232')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (390, N'Ravencoin', N'RVN', N'0,0138526147629', N'-3,58341', N'-16,6205')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (391, N'THETA', N'THETA', N'0,0504619630323', N'-0,789545', N'-9,40199')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (392, N'MonaCoin', N'MONA', N'0,662728238144', N'-0,968295', N'-5,98392')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (393, N'GXChain', N'GXS', N'0,532441123661', N'4,98274', N'7,11937')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (394, N'Mithril', N'MITH', N'0,0696421002071', N'-1,33519', N'-9,34004')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (395, N'Crypto.com', N'MCO', N'2,32044323217', N'3,32089', N'3,42915')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (396, N'aelf', N'ELF', N'0,1133736877', N'3,69264', N'4,22089')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (397, N'Zcoin', N'XZC', N'5,77165834746', N'7,35145', N'3,62502')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (399, N'DigixDAO', N'DGD', N'19,6456880093', N'-0,284602', N'-12,1137')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (400, N'DEX', N'DEX', N'0,359673065164', N'68,3949', N'99,3808')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (401, N'Nxt', N'NXT', N'0,0280895714752', N'2,73332', N'-0,244366')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (402, N'TenX', N'PAY', N'0,413190548225', N'10,6268', N'-9,66268')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (404, N'Credo', N'CREDO', N'0,0321911328996', N'-3,70917', N'-26,4119')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (406, N'Mixin', N'XIN', N'87,1083561795', N'11,3626', N'5,66285')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (407, N'HyperCash', N'HC', N'0,881406534438', N'1,33452', N'-5,9719')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (409, N'Dentacoin', N'DCN', N'0,00014828950709', N'6,7259', N'9,84154')
GO
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (410, N'Digitex Futures', N'DGTX', N'0,0658138798596', N'-0,133478', N'8,94955')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (411, N'Loopring', N'LRC', N'0,0415382588338', N'10,3826', N'14,1852')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1405, N'XYO Network', N'XYO', N'0,00588459298449', N'20,8938', N'22,0788')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1406, N'ProximaX', N'XPX', N'0,00505338370333', N'15,86', N'14,0614')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1407, N'Power Ledger', N'POWR', N'0,0766254588365', N'10,7579', N'15,9733')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1408, N'Enjin Coin', N'ENJ', N'0,0366298698583', N'9,00317', N'24,4218')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1409, N'Veros', N'VRS', N'0,501100202314', N'12,5534', N'353,329')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1410, N'Veritaseum', N'VERI', N'17,8672406156', N'6,44589', N'-2,70589')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1411, N'Nebulas', N'NAS', N'0,594888177432', N'5,63564', N'7,91579')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1412, N'Horizen', N'ZEN', N'5,00847900855', N'4,73715', N'6,03743')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1413, N'Buggyra Coin Zero', N'BCZERO', N'0,0330638192457', N'-3,63149', N'-7,42433')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1414, N'Syscoin', N'SYS', N'0,0477502987088', N'2,7492', N'54,725')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1415, N'Centrality', N'CENNZ', N'0,032236397437', N'0,957925', N'-16,044')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1416, N'WaykiChain', N'WICC', N'0,123003838987', N'3,35677', N'8,55529')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1417, N'Loom Network', N'LOOM', N'0,0426224058404', N'1,0858', N'-3,49573')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1418, N'E-Dinar Coin', N'EDR', N'0,00929373713885', N'1,19488', N'1,27198')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1420, N'BOScoin', N'BOS', N'0,052225121825', N'3,83104', N'16,5836')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1421, N'Nectar', N'NEC', N'0,284419992662', N'-7,92592', N'-3,29044')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1422, N'FunFair', N'FUN', N'0,00417941307719', N'6,33574', N'8,19036')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1423, N'Eidoo', N'EDO', N'0,794033991208', N'4,93878', N'21,678')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1424, N'SingularityNET', N'AGI', N'0,04258187856', N'7,6796', N'18,0671')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1425, N'Spectre.ai Dividend Token', N'SXDT', N'0,25960591048', N'16,323', N'3,59305')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1426, N'Byteball Bytes', N'GBYTE', N'30,6150441486', N'15,626', N'-12,9013')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1427, N'CyberMiles', N'CMT', N'0,0254320374101', N'5,29839', N'0,671117')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1428, N'Swarm', N'SWM', N'0,292920411381', N'-0,012333', N'76,438')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1429, N'Gas', N'GAS', N'1,98696714128', N'6,15414', N'15,8294')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1430, N'Dragonchain', N'DRGN', N'0,0827737509123', N'8,41416', N'16,822')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1431, N'Nasdacoin', N'NSD', N'1,03007202218', N'-6,12878', N'-2,42544')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1432, N'SIRIN LABS Token', N'SRN', N'0,0394027681537', N'4,68929', N'-5,62149')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1433, N'Moeda Loyalty Points', N'MDA', N'0,980369690247', N'5,65351', N'45,2804')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1434, N'Storj', N'STORJ', N'0,141139956138', N'5,57626', N'9,16955')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1435, N'Bibox Token', N'BIX', N'0,181896474119', N'6,76336', N'5,28008')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1436, N'Kyber Network', N'KNC', N'0,140219223726', N'6,02888', N'6,33595')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1437, N'Smartlands', N'SLT', N'3,64809535444', N'3,99585', N'-10,5738')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1438, N'Nuls', N'NULS', N'0,465419105039', N'7,34352', N'17,4838')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1439, N'Civic', N'CVC', N'0,0542291113063', N'3,54492', N'1,10795')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1440, N'Maximine Coin', N'MXM', N'0,00966367658462', N'-1,04728', N'-12,212')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1441, N'Dynamic Trading Rights', N'DTR', N'0,0147470275979', N'5,91527', N'11,1339')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1442, N'Nexus', N'NXS', N'0,303723947259', N'11,7402', N'26,3128')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1444, N'PumaPay', N'PMA', N'0,000858048083038', N'0,19227', N'18,1014')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1445, N'Bread', N'BRD', N'0,200874683417', N'7,18686', N'10,6573')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1446, N'Dent', N'DENT', N'0,00100763551897', N'3,96537', N'0,76692')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1447, N'Substratum', N'SUB', N'0,0457915255487', N'5,1827', N'7,98794')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1448, N'Genesis Vision', N'GVT', N'3,95219383812', N'8,35062', N'23,8138')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1449, N'Enigma', N'ENG', N'0,230976867157', N'4,91659', N'-5,0999')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1450, N'SALT', N'SALT', N'0,213150594642', N'1,47241', N'0,99215')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1451, N'SmartCash', N'SMART', N'0,0161559734044', N'-0,668642', N'-29,8274')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1452, N'GoChain', N'GO', N'0,0259154605746', N'3,08104', N'12,9763')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1453, N'BridgeCoin', N'BCO', N'0,624972533905', N'11,0073', N'63,7701')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1454, N'THEKEY', N'TKY', N'0,00331000157137', N'17,5612', N'36,2328')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1455, N'Groestlcoin', N'GRS', N'0,234305180062', N'8,3453', N'6,70943')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1456, N'Credits', N'CS', N'0,109753035107', N'11,8327', N'28,152')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1457, N'Request Network', N'REQ', N'0,0227136411423', N'5,42868', N'7,09618')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1458, N'ETERNAL TOKEN', N'XET', N'0,241529266087', N'7,86358', N'29,1348')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1459, N'Cortex', N'CTXC', N'0,10930931483', N'4,23755', N'5,72348')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1460, N'Santiment Network Token', N'SAN', N'0,256192984616', N'10,5622', N'35,0981')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1461, N'Iconomi', N'ICN', N'0,160742676926', N'7,35518', N'-6,2874')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1462, N'Tokenomy', N'TEN', N'0,0790915942103', N'6,6767', N'3,34624')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1463, N'Unobtanium', N'UNO', N'78,408809804', N'-2,48031', N'8,96196')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1464, N'Telcoin', N'TEL', N'0,000446745495586', N'8,6181', N'13,998')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1465, N'APIS', N'APIS', N'0,00317142367459', N'9,97421', N'20,2421')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1466, N'Neblio', N'NEBL', N'1,11493343583', N'10,2293', N'26,414')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1467, N'Pillar', N'PLR', N'0,0591614701383', N'10,8196', N'44,7897')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1468, N'OneRoot Network', N'RNT', N'0,056082994939', N'-1,01206', N'15,7703')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1469, N'Emercoin', N'EMC', N'0,34858294806', N'3,22132', N'11,5601')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1470, N'Fusion', N'FSN', N'0,504256159637', N'15,6384', N'-13,0544')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1471, N'iExec RLC', N'RLC', N'0,183253572352', N'3,67033', N'5,84336')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1472, N'Cindicator', N'CND', N'0,0101124932315', N'6,68423', N'11,4744')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1473, N'Optimal Shelf Availability Token', N'OSA', N'0,0455260134188', N'3,90263', N'7,0202')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1474, N'Quant', N'QNT', N'1,47626397032', N'11,3667', N'22,424')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1475, N'BnkToTheFuture', N'BFT', N'0,0226209272939', N'8,4434', N'14,5056')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1476, N'Storm', N'STORM', N'0,00309881235031', N'2,45731', N'12,7968')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1477, N'Bezant', N'BZNT', N'0,0274823167766', N'9,13966', N'18,3506')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1478, N'Mainframe', N'MFT', N'0,00309491672405', N'3,94902', N'6,04937')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1479, N'Peercoin', N'PPC', N'0,531891045153', N'4,35674', N'-6,04721')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1480, N'Vitae', N'VITAE', N'1,24707734036', N'-11,9148', N'12,3941')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1481, N'Energi', N'NRG', N'1,2285894861', N'2,8414', N'1,60477')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1482, N'CRYPTO20', N'C20', N'0,333305558846', N'5,72375', N'16,6763')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1483, N'Dropil', N'DROP', N'0,000606862478043', N'0,315129', N'-32,1003')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1484, N'DMarket', N'DMT', N'0,266588118166', N'-3,54279', N'16,3355')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1485, N'Particl', N'PART', N'1,65347313143', N'-3,65287', N'0,326084')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1486, N'STACS', N'STACS', N'0,0273585207693', N'8,23153', N'11,7958')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1487, N'Gifto', N'GTO', N'0,0246875895625', N'6,00223', N'15,8946')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1488, N'Republic Protocol', N'REN', N'0,0208294103853', N'2,10704', N'-9,81487')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1489, N'Gnosis', N'GNO', N'11,8125480322', N'5,69975', N'0,265133')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1490, N'Vertcoin', N'VTC', N'0,269906519786', N'6,22617', N'18,4186')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1491, N'Wagerr', N'WGR', N'0,0683244201899', N'5,45783', N'4,5393')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1492, N'Odyssey', N'OCN', N'0,00265802061939', N'6,10991', N'-2,49399')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1493, N'Po.et', N'POE', N'0,00514634039101', N'6,79418', N'10,6043')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1494, N'Matrix AI Network', N'MAN', N'0,0834099571545', N'21,0079', N'18,4697')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1496, N'IoTeX', N'IOTX', N'0,00800043551331', N'4,36585', N'12,8186')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1497, N'CasinoCoin', N'CSC', N'0,000335735910952', N'31,344', N'38,1599')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1498, N'RChain', N'RHOC', N'0,032298160513', N'12,8346', N'1,51691')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1499, N'Ignis', N'IGNIS', N'0,0157750860941', N'6,32295', N'2,73585')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1500, N'Everipedia', N'IQ', N'0,00264012708023', N'4,27264', N'9,14132')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1501, N'Streamr DATAcoin', N'DATA', N'0,0174761789183', N'1,81618', N'8,55908')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1502, N'TokenClub', N'TCT', N'0,0245846257576', N'0,451703', N'7,03349')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1503, N'TrueChain', N'TRUE', N'0,254509405801', N'5,4248', N'19,3321')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1504, N'MediBloc [ERC20]', N'MEDX', N'0,00372202041161', N'3,87055', N'38,3805')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1505, N'Skycoin', N'SKY', N'1,07191140255', N'12,4727', N'21,7986')
GO
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1506, N'Aragon', N'ANT', N'0,404281562936', N'3,41873', N'0,305791')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1507, N'OST', N'OST', N'0,0254667733804', N'3,12879', N'6,75003')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1508, N'TokenPay', N'TPAY', N'0,734612284142', N'2,81918', N'-5,19173')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1509, N'TomoChain', N'TOMO', N'0,209807646499', N'6,92522', N'18,2965')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1510, N'Noah Coin', N'NOAH', N'0,000349779274423', N'5,50181', N'0,908342')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1511, N'Edgeless', N'EDG', N'0,114304575447', N'24,6717', N'71,9129')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1512, N'ZrCoin', N'ZRC', N'2,83109236626', N'23,9872', N'50,6564')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1513, N'UTRUST', N'UTK', N'0,0245823841941', N'6,69585', N'15,1326')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1514, N'PRIZM', N'PZM', N'0,155138263576', N'-14,1674', N'-20,6818')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1515, N'Cube', N'AUTO', N'0,00157501824422', N'4,33681', N'-0,819743')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1516, N'Nucleus Vision', N'NCASH', N'0,00190785747701', N'6,07809', N'14,9628')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1517, N'Scry.info', N'DDD', N'0,0240961269218', N'5,15594', N'-3,12087')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1518, N'Safe Exchange Coin', N'SAFEX', N'0,00678763476964', N'6,47071', N'11,4133')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1519, N'Jibrel Network', N'JNT', N'0,0616861394876', N'33,7262', N'20,6348')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1520, N'WhiteCoin', N'XWC', N'0,0410422745629', N'4,69838', N'7,44638')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1521, N'SaluS', N'SLS', N'9,98862830271', N'9,45936', N'9,3922')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1522, N'AMO Coin', N'AMO', N'0,00115573326549', N'10,1329', N'0,949954')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1523, N'SmartMesh', N'SMT', N'0,00710460500139', N'6,5493', N'20,5612')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1524, N'Gulden', N'NLG', N'0,0241675711156', N'2,44287', N'4,2172')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1525, N'MediBloc [QRC20]', N'MED', N'0,00337791818033', N'9,72885', N'43,412')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1526, N'Ubiq', N'UBQ', N'0,234411969375', N'4,3358', N'-5,24313')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1527, N'NavCoin', N'NAV', N'0,155273975464', N'3,32012', N'25,3546')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1528, N'High Performance Blockchain', N'HPB', N'0,260209701868', N'4,95704', N'14,7353')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1529, N'Blocknet', N'BLOCK', N'1,79963429211', N'3,41352', N'9,03928')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1530, N'Einsteinium', N'EMC2', N'0,0447752301458', N'3,35987', N'-5,27506')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1531, N'Genaro Network', N'GNX', N'0,0163843454457', N'-2,18025', N'-15,0931')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1532, N'Quantstamp', N'QSP', N'0,0156130503601', N'8,7184', N'14,6541')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1533, N'ETHLend', N'LEND', N'0,00880409867876', N'14,2244', N'31,7319')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1534, N'Ambrosus', N'AMB', N'0,0661102358278', N'7,1513', N'21,2531')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1535, N'Quantum Resistant Ledger', N'QRL', N'0,179952419532', N'1,06647', N'13,5576')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1536, N'Raiden Network Token', N'RDN', N'0,186672019741', N'3,6968', N'1,34136')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1537, N'Sakura Bloom', N'SKB', N'0,00362986799789', N'-3,62064', N'24,3007')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1538, N'Moss Coin', N'MOC', N'0,0428111967436', N'0,626135', N'-0,568725')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1539, N'Cryptaur', N'CPT', N'0,00127207589945', N'8,54208', N'14,4355')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1540, N'BitBay', N'BAY', N'0,00910476068695', N'13,4771', N'16,8149')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1541, N'BLOCKv', N'VEE', N'0,00393033884919', N'14,6401', N'8,39092')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1542, N'Own', N'CHX', N'0,124572577483', N'12,593', N'14,9842')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1543, N'Bluzelle', N'BLZ', N'0,0448473318969', N'5,04241', N'0,707337')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1544, N'Ethos', N'ETHOS', N'0,100450421049', N'4,09725', N'13,162')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1545, N'Ruff', N'RUFF', N'0,00931865215931', N'8,27207', N'15,9525')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1546, N'BABB', N'BAX', N'0,000415452693812', N'11,2893', N'20,2331')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1547, N'Crypterium', N'CRPT', N'0,110118195674', N'4,31368', N'19,0478')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1548, N'Loopring [NEO]', N'LRN', N'0,0762166156729', N'24,9092', N'35,6608')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1549, N'Burst', N'BURST', N'0,00431753400815', N'10,4708', N'-21,1003')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1550, N'Namecoin', N'NMC', N'0,580673708411', N'4,08966', N'16,4777')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1551, N'Apollo Currency', N'APL', N'0,000581128669208', N'9,91963', N'19,1774')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1552, N'DigitalNote', N'XDN', N'0,00123103167349', N'8,79834', N'10,1244')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1553, N'Metal', N'MTL', N'0,254172820757', N'4,46464', N'5,98013')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1554, N'Cred', N'LBA', N'0,018103113048', N'16,9949', N'20,5223')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1555, N'AurumCoin', N'AU', N'27,9779179714', N'4,99031', N'38,3463')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1556, N'Time New Bank', N'TNB', N'0,0032076127067', N'3,35221', N'11,9935')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1557, N'Internet Node Token', N'INT', N'0,0224424302367', N'17,7462', N'35,676')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1558, N'COSS', N'COSS', N'0,0691126641689', N'3,13352', N'16,11')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1559, N'TrueDeck', N'TDP', N'0,811608130805', N'10,7945', N'25,6109')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1560, N'Breezecoin', N'BRZC', N'0,206400000134', N'-12,9702', N'-6,97609')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1561, N'IoT Chain', N'ITC', N'0,12665969657', N'-1,45919', N'23,5017')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1562, N'Insolar', N'INS', N'0,243066909417', N'4,71598', N'20,3486')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1563, N'LEOcoin', N'LEO', N'0,0771199684547', N'2,48839', N'9,43027')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1564, N'Arcblock', N'ABT', N'0,0781362416095', N'5,82953', N'12,1745')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1565, N'Fantom', N'FTM', N'0,00605178652072', N'4,60858', N'18,9828')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1566, N'SONM', N'SNM', N'0,0210890876164', N'9,10956', N'7,81611')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1567, N'Loki', N'LOKI', N'0,237408306075', N'1,31403', N'1,92815')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1568, N'bitCNY', N'BITCNY', N'0,160125270334', N'5,6124', N'8,43288')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1569, N'Quanta Utility Token', N'QNTU', N'0,000254043899831', N'-0,178891', N'9,12663')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1570, N'WePower', N'WPR', N'0,0144777734865', N'7,43272', N'14,4448')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1571, N'Red Pulse Phoenix', N'PHX', N'0,00891723868843', N'4,47462', N'9,93246')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1572, N'DATA', N'DTA', N'0,00100470157488', N'3,86212', N'14,4497')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1573, N'Wings', N'WINGS', N'0,0756280738564', N'5,5714', N'12,8159')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1574, N'Steem Dollars', N'SBD', N'0,583824009402', N'6,13232', N'-2,12035')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1575, N'AdEx', N'ADX', N'0,100633284819', N'7,0221', N'11,7393')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1576, N'BitNewChain', N'BTN', N'0,0409036051956', N'23,5639', N'25,092')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1577, N'Wowbit', N'WWB', N'0,0258261506091', N'-6,65418', N'-4,25309')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1578, N'Zipper', N'ZIP', N'0,000451376914792', N'3,66261', N'-4,87136')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1579, N'Propy', N'PRO', N'0,128151053963', N'10,8011', N'-1,88171')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1580, N'Modum', N'MOD', N'0,341674176838', N'1,66034', N'8,56949')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1581, N'EvenCoin', N'EVN', N'0,217085001694', N'-8,32649', N'-12,5164')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1582, N'Rotharium', N'RTH', N'2,16071910663', N'2,56357', N'10,622')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1583, N'NAGA', N'NGC', N'0,121430066209', N'5,56101', N'8,43472')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1584, N'district0x', N'DNT', N'0,0119931457934', N'0,383477', N'-10,0299')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1585, N'Stakenet', N'XSN', N'0,0958807332499', N'8,48284', N'15,9275')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1586, N'VIBE', N'VIBE', N'0,0271849018929', N'10,2093', N'17,4463')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1587, N'LockTrip', N'LOC', N'0,755742393342', N'3,69336', N'11,7678')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1588, N'Timicoin', N'TMC', N'0,022758818743', N'20,8356', N'-13,4269')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1589, N'Wabi', N'WABI', N'0,129622482464', N'5,48348', N'13,9495')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1590, N'Cashaa', N'CAS', N'0,011461049391', N'-1,85394', N'7,33846')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1591, N'Viacoin', N'VIA', N'0,299634275216', N'5,53977', N'9,30928')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1592, N'Cosmo Coin', N'COSM', N'0,0102929669285', N'5,78505', N'-1,25366')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1593, N'Selfkey', N'KEY', N'0,0027970267245', N'6,20073', N'13,1411')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1594, N'Mobius', N'MOBI', N'0,0133535494411', N'5,70613', N'15,0986')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1595, N'ToaCoin', N'TOA', N'0,00207864175372', N'7,33419', N'19,2657')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1596, N'CyberVein', N'CVT', N'0,00640291162555', N'-6,33082', N'-10,908')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1597, N'LoyalCoin', N'LYL', N'0,00126826377182', N'8,25326', N'12,3533')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1598, N'GINcoin', N'GIN', N'1,52578868349', N'5,45345', N'10,1529')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1599, N'Covesting', N'COV', N'0,386036833023', N'7,77596', N'14,1173')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1600, N'OriginTrail', N'TRAC', N'0,0236113383542', N'4,55064', N'17,6577')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1601, N'Restart Energy MWAT', N'MWAT', N'0,01485137012', N'11,9369', N'33,4727')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1602, N'Qubitica', N'QBIT', N'2,699901469', N'9,92138', N'1377,06')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1603, N'BOX Token', N'BOX', N'0,0880453913594', N'-5,71208', N'-10,2298')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1605, N'Counterparty', N'XCP', N'2,53802466871', N'5,14925', N'14,2889')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1606, N'ZClassic', N'ZCL', N'1,19521648869', N'10,7247', N'18,8254')
GO
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1607, N'TokenCard', N'TKN', N'0,272968955757', N'-4,98821', N'-0,531049')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1608, N'Bitcoin Interest', N'BCI', N'0,356452873039', N'3,29928', N'-4,70877')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1609, N'Clams', N'CLAM', N'1,93259000286', N'9,02115', N'18,6129')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1610, N'POA Network', N'POA', N'0,0294073684458', N'7,35844', N'9,20135')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1611, N'Achain', N'ACT', N'0,00819586980212', N'11,5802', N'11,4345')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1612, N'Ripio Credit Network', N'RCN', N'0,0127866476719', N'6,27624', N'11,1979')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1613, N'NIX', N'NIX', N'0,150835110114', N'3,25559', N'-9,04735')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1614, N'SCRL', N'SCRL', N'0,0421113830444', N'8,25609', N'6,44955')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1615, N'CloakCoin', N'CLOAK', N'1,19562157378', N'5,35876', N'15,9019')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1616, N'Tripio', N'TRIO', N'0,00273060242528', N'1,93969', N'8,67413')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1617, N'Pascal Coin', N'PASC', N'0,25377904469', N'12,255', N'17,5255')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1618, N'XTRABYTES', N'XBY', N'0,0141755162402', N'-5,01802', N'2,91898')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1619, N'SingularDTV', N'SNGLS', N'0,0101334114905', N'4,80684', N'11,5066')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1620, N'Boolberry', N'BBR', N'0,488007922196', N'5,66694', N'4,57193')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1621, N'TTC Protocol', N'TTC', N'0,0215449544488', N'9,16541', N'4,30464')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1622, N'Electra', N'ECA', N'0,000211328629901', N'6,46349', N'0,978685')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1623, N'Hydro', N'HYDRO', N'0,00204021381262', N'7,95106', N'11,1789')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1624, N'DEW', N'DEW', N'0,0575600861503', N'7,44667', N'12,6662')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1625, N'GoNetwork', N'GOT', N'0,0239085459297', N'5,54683', N'10,4914')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1626, N'Litecoin Cash', N'LCC', N'0,00962744138779', N'6,20162', N'7,57785')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1627, N'Content Neutrality Network', N'CNN', N'0,000145965033375', N'4,01332', N'7,28827')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1628, N'Fortuna', N'FOTA', N'0,0117661388658', N'-1,92696', N'0,507135')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1629, N'Asch', N'XAS', N'0,059724912372', N'-3,10737', N'13,9787')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1630, N'Waves Community Token', N'WCT', N'0,560903744881', N'9,84781', N'98,2709')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1631, N'Tierion', N'TNT', N'0,0130032146593', N'0,677952', N'6,90536')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1632, N'Linda', N'LINDA', N'0,000484417736118', N'14,1903', N'15,7124')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1633, N'doc.com Token', N'MTC', N'0,0180403353493', N'6,20762', N'4,01995')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1634, N'Refereum', N'RFR', N'0,00216775436819', N'3,31855', N'13,0074')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1635, N'BitKan', N'KAN', N'0,00158921780978', N'5,83631', N'-0,163747')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1636, N'IHT Real Estate Protocol', N'IHT', N'0,00950342360957', N'5,57011', N'14,2525')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1637, N'Blox', N'CDT', N'0,00795855869052', N'3,55298', N'8,33149')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1638, N'Bitcore', N'BTX', N'0,321623339006', N'6,76356', N'16,1138')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1639, N'QLC Chain', N'QLC', N'0,0221774900111', N'4,25424', N'22,4222')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1640, N'DECENT', N'DCT', N'0,102872701631', N'14,7233', N'34,0189')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1641, N'Darico Ecosystem Coin', N'DEC', N'0,102363468808', N'-31,18', N'-63,4465')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1642, N'Dero', N'DERO', N'0,885209382998', N'2,67263', N'4,18705')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1643, N'Metronome', N'MET', N'0,610406765615', N'4,20497', N'9,98473')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1644, N'Humanscape', N'HUM', N'0,000160131257867', N'9,07293', N'22,1713')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1645, N'FLO', N'FLO', N'0,0349165347391', N'11,7025', N'33,6728')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1646, N'FairCoin', N'FAIR', N'0,0973634141762', N'-4,47088', N'-3,68711')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1647, N'bitUSD', N'BITUSD', N'0,774983411578', N'1,38135', N'8,30392')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1648, N'VITE', N'VITE', N'0,0122101896612', N'10,96', N'-0,0245661')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1649, N'NaPoleonX', N'NPX', N'0,232761787947', N'3,0937', N'4,07931')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1650, N'Travala.com', N'AVA', N'0,14461994211', N'1,47514', N'25,4957')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1651, N'PCHAIN', N'PAI', N'0,00677298337017', N'6,28314', N'1,52675')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1652, N'CPChain', N'CPC', N'0,0132921098913', N'7,19097', N'18,9186')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1653, N'Blocktix', N'TIX', N'0,126120269939', N'9,92306', N'15,821')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1654, N'MediShares', N'MDS', N'0,00490885644779', N'8,49738', N'11,6533')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1655, N'Mothership', N'MSP', N'0,0358022016234', N'8,48855', N'14,6776')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1656, N'smARTOFGIVING', N'AOG', N'0,0830728529301', N'2,90939', N'-5,60564')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1657, N'ION', N'ION', N'0,23344796615', N'4,66542', N'8,00931')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1658, N'PACcoin', N'$PAC', N'0,000942192090361', N'5,3055', N'3,75001')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1659, N'Mercury', N'MER', N'0,0493817920346', N'5,49414', N'6,4788')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1660, N'Paragon', N'PRG', N'0,0740925974973', N'-3,63607', N'-26,2747')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1661, N'All Sports', N'SOC', N'0,00333370775679', N'3,57138', N'3,60356')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1662, N'Lympo', N'LYM', N'0,00651034645081', N'4,07322', N'-1,11579')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1663, N'REPO', N'REPO', N'0,0442543848627', N'0,949999', N'2,47506')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1664, N'Aeron', N'ARN', N'0,277396935788', N'9,63358', N'18,9991')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1665, N'SophiaTX', N'SPHTX', N'0,0251229427315', N'5,80176', N'18,5077')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1666, N'Rublix', N'RBLX', N'0,230449074722', N'4,00394', N'13,4373')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1667, N'Presearch', N'PRE', N'0,0305997503222', N'1,88869', N'4,744')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1668, N'Metadium', N'META', N'0,00438259206754', N'0,290208', N'2,03601')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1669, N'Bitcoin Atom', N'BCA', N'0,254537898067', N'17,9597', N'-0,640612')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1670, N'Omnitude', N'ECOM', N'0,0896962460351', N'2,66585', N'8,44133')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1671, N'LGO Exchange', N'LGO', N'0,0365334491641', N'6,06098', N'-4,45898')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1672, N'Polybius', N'PLBT', N'1,17485834794', N'5,8436', N'5,62918')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1673, N'Universa', N'UTNP', N'0,002494715656', N'-12,5725', N'12,4026')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1674, N'XcelToken', N'XCEL', N'0,0622773351519', N'95,7378', N'938,685')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1675, N'CrypticCoin', N'CRYP', N'0,0018036807503', N'6,83582', N'-11,251')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1676, N'GameCredits', N'GAME', N'0,0656909972098', N'10,3389', N'7,08242')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1677, N'Primas', N'PST', N'0,0866993537096', N'-5,80233', N'2,73548')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1678, N'Sentinel Protocol', N'UPP', N'0,0160558032007', N'0,989834', N'24,3121')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1679, N'MinexCoin', N'MNX', N'0,960039653082', N'18,6693', N'53,4134')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1680, N'LATOKEN', N'LA', N'0,056031539054', N'8,92964', N'23,2737')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1681, N'Primecoin', N'XPM', N'0,180650415495', N'1,48405', N'-0,519807')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1682, N'Game.com', N'GTC', N'0,00585534412227', N'1,56798', N'-4,13807')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1683, N'Everex', N'EVX', N'0,221249303358', N'7,94067', N'7,73194')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1684, N'Storiqa', N'STQ', N'0,000450350983754', N'2,36946', N'-24,084')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1685, N'TE-FOOD', N'TFD', N'0,00873777375936', N'9,98103', N'10,1072')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1686, N'Numeraire', N'NMR', N'3,25319995064', N'2,15503', N'18,2468')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1687, N'Aeon', N'AEON', N'0,276713281986', N'-4,40203', N'6,50812')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1688, N'Cobinhood', N'COB', N'0,0112238390223', N'6,39937', N'21,7927')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1689, N'Haven Protocol', N'XHV', N'0,678383621294', N'1,7697', N'-17,3026')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1690, N'LBRY Credits', N'LBC', N'0,0205156108299', N'4,33718', N'-10,04')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1691, N'YOYOW', N'YOYOW', N'0,0144462613071', N'4,38578', N'12,1836')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1692, N'Apex', N'CPX', N'0,009650743528', N'9,30229', N'3,32829')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1693, N'Bottos', N'BTO', N'0,0085264893969', N'4,81185', N'8,26017')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1694, N'Bitcoin Green', N'BITG', N'0,683423403603', N'8,08579', N'-4,09436')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1695, N'Etherparty', N'FUEL', N'0,00812930884631', N'3,65303', N'13,7785')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1696, N'AppCoins', N'APPC', N'0,0426717102051', N'6,8396', N'12,4737')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1697, N'Dock', N'DOCK', N'0,00977810623913', N'3,97751', N'5,56218')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1698, N'DecentBet', N'DBET', N'0,0253848278109', N'45,0247', N'60,7246')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1699, N'Six Domain Chain', N'SDA', N'0,00609409152398', N'-1,9669', N'37,2788')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1700, N'Melon', N'MLN', N'5,43553316858', N'7,06696', N'11,7462')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1702, N'Flash', N'FLASH', N'0,00466317859068', N'7,59646', N'4,00736')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1704, N'Robotina', N'ROX', N'0,0155568056001', N'13,1331', N'11,4981')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1705, N'NKN', N'NKN', N'0,0193912497517', N'23,1169', N'41,9224')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1706, N'Viberate', N'VIB', N'0,0233094044751', N'6,24015', N'11,1112')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1707, N'Feathercoin', N'FTC', N'0,0188292877671', N'7,36695', N'9,91685')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1708, N'AirSwap', N'AST', N'0,0274184297441', N'2,94636', N'7,4402')
GO
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1709, N'Primalbase Token', N'PBT', N'3266,81192747', N'14,2984', N'6,62933')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1710, N'Monetha', N'MTH', N'0,0185316710218', N'4,02465', N'8,8864')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1711, N'eosDAC', N'EOSDAC', N'0,00606467436006', N'6,8209', N'18,2845')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1712, N'PayPie', N'PPP', N'0,0483640340475', N'-0,767299', N'26,0488')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1713, N'Seele', N'SEELE', N'0,00586245587825', N'5,57707', N'6,289')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1714, N'Global Currency Reserve', N'GCR', N'0,0376024220267', N'-13,5229', N'44,3355')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1715, N'Shift', N'SHIFT', N'0,311085722633', N'2,07503', N'7,71581')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1716, N'Everus', N'EVR', N'0,00769889108166', N'5,0351', N'32,2662')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1717, N'Happycoin', N'HPC', N'0,221809525169', N'5,43007', N'-17,8895')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1718, N'Xaurum', N'XAUR', N'0,0403127822106', N'-0,657889', N'6,01463')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1720, N'Synthetix Network Token', N'SNX', N'0,0576135361408', N'-3,55287', N'15,7017')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1721, N'Bit-Z Token', N'BZ', N'0,085765499005', N'2,40108', N'-4,42657')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1722, N'Unikoin Gold', N'UKG', N'0,0266103427062', N'5,93522', N'10,8948')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1723, N'B2BX', N'B2B', N'0,229877425417', N'11,8279', N'-11,2088')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1724, N'SPINDLE', N'SPD', N'0,00106744518179', N'2,71278', N'-8,2303')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1725, N'ICE ROCK MINING', N'ROCK2', N'0,239875861284', N'-4,39826', N'-14,2345')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1726, N'Lunyr', N'LUN', N'1,63385538967', N'11,2488', N'21,7073')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1727, N'Digix Gold Token', N'DGX', N'45,7296821898', N'4,31', N'10,1952')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1728, N'Bismuth', N'BIS', N'0,25998489728', N'2,16965', N'5,82767')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1729, N'Scorum Coins', N'SCR', N'0,126172251426', N'23,9148', N'36,919')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1730, N'SpankChain', N'SPANK', N'0,0122800233658', N'0,531595', N'-4,85186')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1731, N'Patron', N'PAT', N'0,0131750674968', N'-20,7079', N'-20,6602')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1732, N'ALQO', N'XLQ', N'0,0637367883673', N'-0,715917', N'-11,8765')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1733, N'HalalChain', N'HLC', N'0,00937623374087', N'5,04172', N'-0,00927813')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1734, N'ATN', N'ATN', N'0,0429006570924', N'10,0736', N'11,6368')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1735, N'Callisto Network', N'CLO', N'0,00472761745542', N'10,2324', N'21,7576')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1736, N'Bulwark', N'BWK', N'0,244931524632', N'-2,68295', N'-6,95609')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1737, N'Lamden', N'TAU', N'0,0253745640683', N'-13,2223', N'17,7032')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1738, N'Blue Whale Token', N'BWX', N'0,000112188137206', N'1,44114', N'9,42929')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1739, N'Aurora DAO', N'AURA', N'0,0234797969675', N'7,51934', N'16,9105')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1740, N'0chain', N'ZCN', N'0,0892465129179', N'14,2067', N'11,1926')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1741, N'BlackCoin', N'BLK', N'0,0598744095916', N'11,1708', N'-0,419362')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1742, N'SwissBorg', N'CHSB', N'0,00616452900983', N'-2,31021', N'10,9279')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1743, N'BlockMason Credit Protocol', N'BCPT', N'0,0353141233579', N'8,04656', N'18,2707')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1744, N'SwftCoin', N'SWFTC', N'0,000959258425172', N'3,25948', N'15,266')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1745, N'Moneytoken', N'IMT', N'0,000363655643314', N'19,0302', N'-10,551')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1746, N'Ternio', N'TERN', N'0,0102320831993', N'0,0547268', N'-20,3782')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1747, N'BitTube', N'TUBE', N'0,0323106049281', N'3,52204', N'6,29393')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1748, N'Zeepin', N'ZPT', N'0,00682920215773', N'6,09725', N'14,2159')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1749, N'SpaceChain', N'SPC', N'0,00654465300503', N'8,88425', N'18,75')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1750, N'Myriad', N'XMY', N'0,00202749705307', N'11,8045', N'33,8142')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1751, N'adToken', N'ADT', N'0,00549891314241', N'2,04618', N'3,35875')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1752, N'INO COIN', N'INO', N'0,163618986922', N'5,19795', N'7,03028')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1753, N'Ecoreal Estate', N'ECOREAL', N'0,0207626878312', N'-34,0676', N'-19,3461')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1754, N'RevolutionVR', N'RVR', N'0,0154439072319', N'-0,564496', N'1,92633')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1755, N'Consensus', N'SEN', N'0,00200839548462', N'21,9249', N'25,5008')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1756, N'Peerplays', N'PPY', N'0,714930970378', N'-5,00264', N'-22,3616')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1757, N'Phore', N'PHR', N'0,202364229241', N'4,71948', N'8,60626')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1758, N'BitCapitalVendor', N'BCV', N'0,00576033544843', N'8,99734', N'8,02974')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1759, N'Pepe Cash', N'PEPECASH', N'0,00446757981651', N'2,76492', N'-4,91829')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1760, N'Bean Cash', N'BITB', N'0,00119378036147', N'8,63143', N'18,1246')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1761, N'Hiveterminal Token', N'HVN', N'0,00755061167443', N'12,4282', N'17,2466')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1762, N'KickCoin', N'KICK', N'0,00570414763978', N'6,38577', N'0,290917')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1763, N'BrahmaOS', N'BRM', N'0,00497820293937', N'-1,84585', N'2,25895')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1764, N'XinFin Network', N'XDCE', N'0,000791915448375', N'1,45652', N'5,7996')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1765, N'Agrello', N'DLT', N'0,0355100906489', N'8,23896', N'9,96686')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1766, N'Hi Mutual Society', N'HMC', N'0,00755422397895', N'4,61432', N'6,89295')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1767, N'Diamond', N'DMD', N'0,99922389158', N'2,33101', N'-3,53413')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1768, N'NANJCOIN', N'NANJ', N'0,000156936971674', N'-14,3124', N'-2,72329')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1769, N'DeepBrain Chain', N'DBC', N'0,002010252106', N'4,2182', N'-11,7889')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1770, N'GET Protocol', N'GET', N'0,263153802046', N'-0,952002', N'20,9583')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1771, N'Blackmoon', N'BMC', N'0,135441108167', N'4,20106', N'22,3314')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1772, N'Smartshare', N'SSP', N'0,000651327027226', N'7,53108', N'12,9186')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1773, N'PotCoin', N'POT', N'0,0133690743442', N'8,32747', N'13,9743')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1774, N'Lendingblock', N'LND', N'0,00485675333257', N'15,6478', N'19,3851')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1775, N'Eden', N'EDN', N'0,00355834790863', N'6,90433', N'4,90549')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1776, N'QunQun', N'QUN', N'0,00405742725541', N'5,87858', N'4,33707')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1778, N'Crown', N'CRW', N'0,138355042193', N'2,91084', N'10,4235')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1779, N'Dignity', N'DIG', N'0,00555012128544', N'-5,43991', N'-8,26058')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1780, N'Graft', N'GRFT', N'0,00651449075798', N'12,1151', N'6,32642')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1781, N'DADI', N'DADI', N'0,0386890893688', N'1,04455', N'1,20503')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1782, N'Polis', N'POLIS', N'0,601410020566', N'-0,2494', N'8,95557')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1783, N'Spectrecoin', N'XSPEC', N'0,137535933537', N'16,0722', N'39,8437')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1784, N'ColossusXT', N'COLX', N'0,000261215994798', N'9,36488', N'14,9732')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1785, N'XEL', N'XEL', N'0,0308681817405', N'3,77377', N'6,73119')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1786, N'TaTaTu', N'TTU', N'0,0289949943748', N'-11,7622', N'-23,2687')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1787, N'GridCoin', N'GRC', N'0,00678776556456', N'6,90046', N'20,554')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1788, N'TV-TWO', N'TTV', N'0,00684759992119', N'-18,115', N'7,28069')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1789, N'Zebi', N'ZCO', N'0,00548267308301', N'6,86494', N'24,4645')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1790, N'FirstBlood', N'1ST', N'0,0319706773921', N'17,6183', N'-1,25171')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1791, N'IXT', N'IXT', N'0,0763774924795', N'1,32384', N'48,6257')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1792, N'SafeInsure', N'SINS', N'2,60263986372', N'-2,67346', N'-7,38622')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1793, N'HorusPay', N'HORUS', N'0,00312478032802', N'-4,83985', N'-25,7668')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1794, N'Peculium', N'PCL', N'0,00138510709257', N'8,12283', N'37,9628')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1795, N'Bezop', N'BEZ', N'0,0530754443233', N'3,08044', N'18,8477')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1796, N'Ink', N'INK', N'0,00578000085702', N'-0,888895', N'-0,268272')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1797, N'Distributed Credit Chain', N'DCC', N'0,00145349046052', N'12,6764', N'10,886')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1798, N'Olympus Labs', N'MOT', N'0,0690324566517', N'4,12792', N'10,7442')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1799, N'MonetaryUnit', N'MUE', N'0,0180704251226', N'7,19789', N'-7,32773')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1800, N'Pal Network', N'PAL', N'0,00573852132697', N'3,88921', N'29,3117')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1801, N'CEEK VR', N'CEEK', N'0,00381715779505', N'25,9196', N'5,44077')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1802, N'Soarcoin', N'SOAR', N'0,00242475935688', N'1,86012', N'34,0513')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1803, N'BANKEX', N'BKX', N'0,0280282256958', N'-20,4981', N'-35,926')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1804, N'BitDice', N'CSNO', N'0,0373166208239', N'5,03056', N'8,77083')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1806, N'WeShow Token', N'WET', N'0,0142031775675', N'-15,1157', N'-17,517')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1807, N'Switcheo', N'SWTH', N'0,00495947970836', N'15,3646', N'11,3487')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1808, N'ThoreCoin', N'THR', N'29,9212790055', N'9,99781', N'18,6132')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1809, N'Hubii Network', N'HBT', N'0,169734216606', N'43,7304', N'3,47434')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1810, N'FansTime', N'FTI', N'0,000935563087959', N'23,2579', N'14,5028')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1811, N'Blockport', N'BPT', N'0,048528380267', N'11,6163', N'18,398')
GO
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1812, N'Incent', N'INCNT', N'0,0556554485927', N'29,6674', N'24,9832')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1813, N'TaaS', N'TAAS', N'0,313948038411', N'11,6599', N'26,752')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1814, N'SIX', N'SIX', N'0,00934424264832', N'-2,76908', N'27,7732')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1815, N'Insureum', N'ISR', N'0,0146442978957', N'-10,3331', N'-9,67391')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1816, N'Ulord', N'UT', N'0,0499009605957', N'4,27767', N'13,009')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1817, N'CargoX', N'CXO', N'0,0194753563879', N'18,0113', N'32,7127')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1818, N'DxChain Token', N'DX', N'0,000165722283435', N'8,22901', N'1,30241')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1819, N'Zen Protocol', N'ZP', N'0,15371877126', N'-10,3733', N'-28,0562')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1820, N'Business Credit Alliance Chain', N'BCAC', N'0,0055916741525', N'9,9706', N'-9,05773')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1821, N'CanonChain', N'CZR', N'0,00501633925421', N'28,8799', N'-8,74756')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1822, N'Sentinel', N'SENT', N'0,00123173619117', N'-5,89864', N'-2,07579')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1823, N'DeepOnion', N'ONION', N'0,152506701424', N'11,036', N'36,8843')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1824, N'EBCoin', N'EBC', N'0,000653795405686', N'17,1718', N'25,1163')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1825, N'BaaSid', N'BAAS', N'0,00115681451849', N'-4,38379', N'-9,64554')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1826, N'Remme', N'REM', N'0,00394476019797', N'16,1838', N'26,0968')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1827, N'Welltrado', N'WTL', N'0,0651779417091', N'31,7518', N'22,1422')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1828, N'Stealth', N'XST', N'0,0787860271035', N'9,21997', N'12,4708')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1829, N'PolySwarm', N'NCT', N'0,00155577902455', N'15,1571', N'24,1013')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1830, N'MktCoin', N'MLM', N'0,002199210947', N'20,2849', N'26,5034')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1831, N'MARK.SPACE', N'MRK', N'0,00438372219137', N'8,55807', N'22,4962')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1832, N'Brickblock', N'BBK', N'0,0318537654546', N'8,11666', N'-4,94793')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1834, N'HempCoin', N'THC', N'0,00977600391504', N'4,31518', N'2,4519')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1835, N'EDUCare', N'EKT', N'0,00529835352862', N'0,230632', N'24,4577')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1836, N'SureRemit', N'RMT', N'0,00476981257714', N'5,23627', N'1,79804')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1837, N'Electrify.Asia', N'ELEC', N'0,00494832640373', N'3,25718', N'-3,90518')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1838, N'QChi', N'QCH', N'0,101314565607', N'13,4296', N'143,494')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1839, N'Yocoin', N'YOC', N'0,00733661206727', N'2,56694', N'34,0475')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1840, N'Global Social Chain', N'GSC', N'0,00492046274261', N'25,0475', N'33,901')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1841, N'DIMCOIN', N'DIM', N'0,00110768379663', N'1,34742', N'4,97636')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1842, N'carVertical', N'CV', N'0,000300545445862', N'9,75579', N'11,0033')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1843, N'Birake', N'BIR', N'0,0800636472949', N'36,6546', N'-2,92636')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1844, N'OAX', N'OAX', N'0,0923829540604', N'-1,86557', N'23,7129')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1845, N'YEE', N'YEE', N'0,00168024202307', N'5,89835', N'2,13557')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1846, N'AVINOC', N'AVINOC', N'0,00603237496967', N'-13,3606', N'-15,359')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1847, N'Leverj', N'LEV', N'0,0191352462604', N'-25,3756', N'228,478')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1848, N'Radium', N'RADS', N'0,634675238212', N'7,37119', N'-3,5269')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1849, N'Skrumble Network', N'SKM', N'0,003028483366', N'10,7708', N'21,3554')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1850, N'Etheroll', N'DICE', N'0,320704617132', N'30,3477', N'-11,0577')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1851, N'Decision Token', N'HST', N'0,0677087014903', N'6,48485', N'16,2671')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1852, N'Bloom', N'BLT', N'0,0455813280829', N'2,8643', N'-18,6539')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1853, N'Divi', N'DIVI', N'0,00286239944318', N'-1,84376', N'-17,5906')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1854, N'VeriCoin', N'VRC', N'0,0691019767449', N'3,98126', N'11,1726')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1855, N'CashBet Coin', N'CBC', N'0,0140384176867', N'12,3733', N'18,1632')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1856, N'U Network', N'UUU', N'0,00036408941457', N'1,18052', N'7,59561')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1857, N'KARMA', N'KARMA', N'0,000648887079637', N'15,4308', N'18,8317')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1858, N'Nimiq', N'NIM', N'0,000778462208518', N'0,813278', N'15,8308')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1859, N'Rise', N'RISE', N'0,0161363323175', N'-3,45382', N'2,26079')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1860, N'DATx', N'DATX', N'0,00152911832488', N'8,95247', N'8,37773')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1861, N'UpToken', N'UP', N'0,0144487579393', N'-0,216117', N'5,15411')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1862, N'Delphy', N'DPY', N'0,0425682692457', N'7,7146', N'16,9245')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1863, N'NoLimitCoin', N'NLC2', N'0,00986545893978', N'-0,218153', N'95,8676')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1864, N'Dovu', N'DOV', N'0,00518597461516', N'-14,7119', N'99,5087')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1865, N'TRAXIA', N'TMT', N'0,00420129995971', N'-6,89085', N'7,90059')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1866, N'Online', N'OIO', N'0,00234739792165', N'-11,7569', N'-13,2575')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1867, N'Ubex', N'UBEX', N'0,000671519037998', N'7,03105', N'16,2676')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1868, N'Unibright', N'UBT', N'0,0145028109301', N'22,0832', N'23,5034')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1869, N'DAEX', N'DAX', N'0,00787270834004', N'105,049', N'102,05')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1870, N'YGGDRASH', N'YEED', N'0,000412234480893', N'3,6477', N'-10,8037')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1871, N'LinkEye', N'LET', N'0,00336980406706', N'5,36568', N'-7,40502')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1872, N'Blocktrade Token', N'BTT', N'0,0370006352308', N'7,30213', N'1,13917')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1873, N'LUXCoin', N'LUX', N'0,627431801642', N'2,2774', N'-4,30095')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1875, N'ChatCoin', N'CHAT', N'0,00286627566054', N'4,56038', N'7,67224')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1876, N'Lightpaycoin', N'LPC', N'0,424426012729', N'-4,5755', N'-16,327')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1877, N'aXpire', N'AXPR', N'0,00719055075503', N'4,16118', N'16,7924')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1878, N'ATC Coin', N'ATCC', N'0,00801670478128', N'4,17149', N'-0,528122')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1879, N'HashCoin', N'HSC', N'0,000153143504899', N'-1,58891', N'15,5638')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1880, N'XMax', N'XMX', N'0,000251257313878', N'6,62112', N'-3,4681')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1881, N'AI Doctor', N'AIDOC', N'0,00434804900927', N'-4,39025', N'-1,06296')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1882, N'Anoncoin', N'ANC', N'0,900270133336', N'-1,96897', N'-8,70076')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1883, N'DACSEE', N'DACS', N'0,00252440787351', N'4,45191', N'10,3651')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1884, N'Starta', N'STA', N'0,364566889951', N'-7,73557', N'9,92914')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1885, N'Pura', N'PURA', N'0,0107262529665', N'15,6262', N'15,5366')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1886, N'Snetwork', N'SNET', N'0,0139529084355', N'-6,47974', N'7,21485')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1887, N'HyperSpace', N'AMP', N'0,0182848673052', N'4,70473', N'-2,67421')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1888, N'FuzeX', N'FXT', N'0,00243362508733', N'-22,5408', N'-15,6311')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1890, N'Dotcoin', N'DOT', N'0,00574427500361', N'5,05769', N'7,02266')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1891, N'Phantasma', N'SOUL', N'0,0306573529684', N'2,09612', N'26,4496')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1892, N'OracleChain', N'OCT', N'0,0591744245375', N'9,63419', N'12,7768')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1893, N'Global Cryptocurrency', N'GCC', N'0,00146388332927', N'16,4635', N'114,049')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1894, N'Cardstack', N'CARD', N'0,000739621703454', N'14,7875', N'18,4367')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1895, N'DAOstack', N'GEN', N'0,0458897964355', N'23,5652', N'30,6302')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1896, N'CVCoin', N'CVN', N'0,142521672786', N'7,20958', N'-6,26177')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1897, N'Hacken', N'HKN', N'0,328492758796', N'9,01058', N'12,4464')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1898, N'Liquidity Network', N'LQD', N'0,0401413838126', N'-5,62782', N'-1,82607')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1899, N'Litex', N'LXT', N'0,00209600257634', N'22,6768', N'37,5264')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1900, N'ZMINE', N'ZMN', N'0,0125382270481', N'21,409', N'10,1179')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1901, N'Molecule', N'MOL', N'0,000133510127642', N'7,77188', N'37,9391')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1902, N'POPCHAIN', N'PCH', N'0,00348377787339', N'1,34323', N'9,69434')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1903, N'SunContract', N'SNC', N'0,01385305993', N'8,13624', N'21,6142')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1904, N'Niobium Coin', N'NBC', N'0,0342714146554', N'6,67467', N'-3,49004')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1905, N'Paypex', N'PAYX', N'0,0246712422726', N'5,80205', N'10,8189')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1906, N'Auroracoin', N'AUR', N'0,0986264225507', N'-4,42507', N'-19,8977')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1908, N'Gambit', N'GAM', N'1,45847410117', N'-3,07923', N'-2,1365')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1909, N'Tolar', N'TOL', N'0,00528309643246', N'3,74772', N'23,1486')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1910, N'Flixxo', N'FLIXX', N'0,0208145439737', N'10,3622', N'-5,30807')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1911, N'Vexanium', N'VEX', N'0,00553060117256', N'68,5109', N'59,4806')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1912, N'Cappasity', N'CAPP', N'0,00329016006851', N'8,76538', N'31,4215')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1913, N'EnergiToken', N'ETK', N'0,000895061905533', N'6,92122', N'-17,5495')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1914, N'Bodhi', N'BOT', N'0,0413247694709', N'8,02744', N'20,3564')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1915, N'Humaniq', N'HMQ', N'0,00893455116782', N'4,79067', N'-4,24186')
GO
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1916, N'LINA', N'LINA', N'0,0153469148798', N'4,88006', N'9,1018')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1918, N'Spectre.ai Utility Token', N'SXUT', N'0,0659759463358', N'9,30439', N'25,3571')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1919, N'Kcash', N'KCASH', N'0,00508123166111', N'4,69678', N'7,33384')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1920, N'NeuroChain', N'NCC', N'0,00629475544661', N'2,8663', N'-2,20108')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1921, N'FarmaTrust', N'FTT', N'0,00266481239501', N'12,5972', N'3,50433')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1923, N'OWNDATA', N'OWN', N'0,000144772595242', N'-21,8382', N'-23,1231')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1924, N'CommerceBlock', N'CBT', N'0,0090960358103', N'13,5313', N'28,4323')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1925, N'Neurotoken', N'NTK', N'0,0198759624873', N'13,1768', N'25,2407')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1926, N'Airbloc', N'ABL', N'0,00737537035058', N'11,4093', N'8,1697')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1927, N'Solaris', N'XLR', N'0,947169367773', N'2,49453', N'15,4835')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1928, N'UNIVERSAL CASH', N'UCASH', N'0,000184866255054', N'5,87175', N'9,37405')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1929, N'Morpheus.Network', N'MRPH', N'0,0519251054348', N'5,15156', N'5,91434')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1930, N'Eroscoin', N'ERO', N'0,00820445971051', N'4,97739', N'7,10413')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1931, N'Dynamic', N'DYN', N'0,503603866429', N'39,9634', N'59,2501')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1932, N'Xriba', N'XRA', N'0,0232026983381', N'-12,0804', N'-23,125')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1933, N'BitSend', N'BSD', N'0,0706218161113', N'2,93228', N'3,42218')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1934, N'Swarm City', N'SWT', N'0,182066741846', N'10,4633', N'25,0257')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1935, N'SolarCoin', N'SLR', N'0,0303013920253', N'-2,03971', N'25,2816')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1936, N'VINchain', N'VIN', N'0,00310022897901', N'7,6296', N'16,7698')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1937, N'Musicoin', N'MUSIC', N'0,00119417798578', N'11,9938', N'4,70899')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1938, N'DAV Coin', N'DAV', N'0,00323209957367', N'10,7341', N'9,60156')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1939, N'Effect.AI', N'EFX', N'0,00710322614544', N'11,484', N'2,04448')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1940, N'Zeusshield', N'ZSC', N'0,00127332790437', N'9,11336', N'15,8945')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1941, N'TrueFlip', N'TFL', N'0,234456950982', N'3,75283', N'17,8227')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1942, N'ZPER', N'ZPR', N'0,00109378043875', N'3,15699', N'-0,596299')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1943, N'Gentarium', N'GTM', N'0,720966051034', N'-0,0874005', N'6,53261')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1944, N'Howdoo', N'UDOO', N'0,0163819965417', N'8,26615', N'15,5757')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1945, N'MidasProtocol', N'MAS', N'0,00553853301332', N'5,94285', N'6,91008')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1947, N'Nebula AI', N'NBAI', N'0,00122055832144', N'-8,39562', N'12,1667')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1948, N'ZelCash', N'ZEL', N'0,0299505218856', N'-1,63314', N'-12,0697')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1950, N'Expanse', N'EXP', N'0,131560048001', N'-1,39669', N'14,6836')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1951, N'Circuits of Value', N'COVAL', N'0,00138024763392', N'9,26047', N'-12,4872')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1952, N'Puregold Token', N'PGT', N'0,128141477413', N'93,2555', N'-47,46')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1953, N'Ifoods Chain', N'IFOOD', N'0,000549326106576', N'6,13128', N'38,1615')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1954, N'LogisCoin', N'LGS', N'0,921464137613', N'7,27192', N'44,0723')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1955, N'GoByte', N'GBX', N'0,432568956978', N'7,15223', N'12,9197')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1956, N'Stellite', N'XTL', N'0,000188700222956', N'-11,5013', N'-1,53079')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1957, N'Playgroundz', N'IOG', N'0,0501791063392', N'-21,0769', N'-53,2549')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1958, N'BitMart Token', N'BMX', N'0,0115529121331', N'18,7467', N'4,78073')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1959, N'XRP', N'XRP', N'0,369618118493', N'-0,709998', N'-0,46349')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1960, N'Ethereum', N'ETH', N'139,35536997', N'2,61272', N'7,5443')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1961, N'Tether', N'USDT', N'1,0241322626', N'-0,456165', N'0,529277')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1962, N'Bitcoin SV', N'BSV', N'89,9705537692', N'-1,3403', N'-16,1151')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1963, N'Stellar', N'XLM', N'0,11908391839', N'-0,801545', N'-5,28888')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1964, N'Stratis', N'STRAT', N'1,20900229489', N'-3,18442', N'-12,9155')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (1965, N'Steem', N'STEEM', N'0,277729726012', N'1,97607', N'-14,3193')
SET IDENTITY_INSERT [dbo].[Cryptocurrencies] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUsers], [login], [password], [email], [isLogged], [isAdmin]) VALUES (3, N'karol     ', N'123       ', N'karolabc  ', 0, 0)
INSERT [dbo].[Users] ([idUsers], [login], [password], [email], [isLogged], [isAdmin]) VALUES (4, N'user2     ', N'pass2     ', N'abcde     ', 0, 0)
INSERT [dbo].[Users] ([idUsers], [login], [password], [email], [isLogged], [isAdmin]) VALUES (5, N'user      ', N'pass      ', N'mail      ', 1, 0)
INSERT [dbo].[Users] ([idUsers], [login], [password], [email], [isLogged], [isAdmin]) VALUES (2006, N'admin', N'admin', N'admin@gmail.com', 0, 1)
INSERT [dbo].[Users] ([idUsers], [login], [password], [email], [isLogged], [isAdmin]) VALUES (2007, N'1', N'1', N'1mail', 0, 0)
INSERT [dbo].[Users] ([idUsers], [login], [password], [email], [isLogged], [isAdmin]) VALUES (2008, N'admin2', N'admin2', N'admin2@', 0, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[WalletsC] ([idUser], [idWalletC], [idCrypto], [quantity], [sum], [idAlert]) VALUES (5, 1, 300, N'20', N'77853,25', 1)
INSERT [dbo].[WalletsC] ([idUser], [idWalletC], [idCrypto], [quantity], [sum], [idAlert]) VALUES (5, 1, 312, N'259,5', N'76,73441', 1)
INSERT [dbo].[WalletsC] ([idUser], [idWalletC], [idCrypto], [quantity], [sum], [idAlert]) VALUES (3, 1, 307, N'11', N'29,40215', 1)
INSERT [dbo].[WalletsC] ([idUser], [idWalletC], [idCrypto], [quantity], [sum], [idAlert]) VALUES (3, 1, 308, N'10', N'326,3637', 1)
INSERT [dbo].[WalletsC] ([idUser], [idWalletC], [idCrypto], [quantity], [sum], [idAlert]) VALUES (4, 1, 308, N'0', N'0', 1)
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_isLogged]  DEFAULT ((0)) FOR [isLogged]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_isAdmin]  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[WalletsC] ADD  CONSTRAINT [DF_WalletsC_quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[WalletsC] ADD  CONSTRAINT [DF_WalletsC_sum]  DEFAULT ((0)) FOR [sum]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[19] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -3
      End
      Begin Tables = 
         Begin Table = "Cryptocurrencies"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WalletsC"
            Begin Extent = 
               Top = 10
               Left = 282
               Bottom = 140
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 490
               Bottom = 136
               Right = 660
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 1275
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewWallet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewWallet'
GO
USE [master]
GO
ALTER DATABASE [FinMarketsAppDB] SET  READ_WRITE 
GO
