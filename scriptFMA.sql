USE [master]
GO
/****** Object:  Database [FinMarketsAppDB]    Script Date: 01.02.2019 23:51:17 ******/
CREATE DATABASE [FinMarketsAppDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinMarketsAppDB', FILENAME = N'D:\FinMarketsAppDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinMarketsAppDB_log', FILENAME = N'D:\FinMarketsAppDB.ldf' , SIZE = 401408KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Cryptocurrencies]    Script Date: 01.02.2019 23:51:17 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 01.02.2019 23:51:17 ******/
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
/****** Object:  Table [dbo].[WalletsC]    Script Date: 01.02.2019 23:51:17 ******/
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
	[idAlert] [int] NULL,
	[priceWhenAdded] [varchar](50) NULL,
	[changeWallet] [varchar](50) NULL,
	[alertUp] [varchar](50) NULL,
	[alertDown] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewWallet]    Script Date: 01.02.2019 23:51:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewWallet]
AS
SELECT    dbo.Cryptocurrencies.name, dbo.Cryptocurrencies.symbol, dbo.Cryptocurrencies.price, dbo.WalletsC.quantity, dbo.WalletsC.sum, dbo.WalletsC.priceWhenAdded, dbo.WalletsC.changeWallet
FROM         dbo.Cryptocurrencies INNER JOIN
                      dbo.WalletsC ON dbo.Cryptocurrencies.idCrypto = dbo.WalletsC.idCrypto INNER JOIN
                      dbo.Users ON dbo.WalletsC.idUser = dbo.Users.idUsers
WHERE     (dbo.Users.idUsers IN
                          (SELECT    idUsers
                            FROM         dbo.Users AS Users_1
                            WHERE      (isLogged = 1)))
GO
SET IDENTITY_INSERT [dbo].[Cryptocurrencies] ON 

INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3259, N'Bitcoin', N'BTC', N'3488,69', N'0,61', N'-2,9')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3260, N'XRP', N'XRP', N'0,30760', N'-1,2', N'-2,4')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3261, N'Ethereum', N'ETH', N'107,712', N'0,33', N'-7,3')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3262, N'Bitcoin Cash', N'BCH', N'116,704', N'1,14', N'-8,6')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3263, N'EOS', N'EOS', N'2,34377', N'0,71', N'-4,3')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3264, N'Tether', N'USDT', N'1,00465', N'-0,2', N'-0,4')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3265, N'Litecoin', N'LTC', N'33,2203', N'4,86', N'1,54')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3266, N'Stellar', N'XLM', N'0,08323', N'0,20', N'-17,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3267, N'TRON', N'TRX', N'0,02622', N'1,61', N'-1,9')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3268, N'Bitcoin SV', N'BSV', N'64,3451', N'-0,2', N'-14,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3269, N'Cardano', N'ADA', N'0,03889', N'1,08', N'-8,9')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3270, N'Binance Coin', N'BNB', N'6,55798', N'4,99', N'-2,3')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3271, N'IOTA', N'MIOTA', N'0,25951', N'0,40', N'-10,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3272, N'Monero', N'XMR', N'43,7305', N'0,04', N'-5,9')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3273, N'Dash', N'DASH', N'67,6288', N'-1,4', N'-8,1')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3274, N'NEM', N'XEM', N'0,04102', N'1,07', N'-25,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3275, N'NEO', N'NEO', N'7,03131', N'0,99', N'-7,1')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3276, N'Ethereum Classic', N'ETC', N'3,96437', N'-0,0', N'-8,8')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3277, N'Maker', N'MKR', N'376,778', N'2,45', N'-19,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3278, N'USD Coin', N'USDC', N'1,01224', N'-0,0', N'0,08')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3279, N'Zcash', N'ZEC', N'48,8166', N'-0,7', N'-7,0')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3280, N'Waves', N'WAVES', N'2,72719', N'-3,1', N'-2,9')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3281, N'Tezos', N'XTZ', N'0,37898', N'0,09', N'-8,5')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3282, N'Dogecoin', N'DOGE', N'0,00190', N'-0,9', N'-9,2')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3283, N'VeChain', N'VET', N'0,00393', N'0,61', N'-9,5')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3284, N'TrueUSD', N'TUSD', N'1,01482', N'0,22', N'0,47')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3285, N'Ontology', N'ONT', N'0,54326', N'0,78', N'-12,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3286, N'Bitcoin Gold', N'BTG', N'10,1367', N'1,01', N'-9,7')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3287, N'Qtum', N'QTUM', N'1,84673', N'-0,5', N'-10,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3288, N'Zilliqa', N'ZIL', N'0,01829', N'-2,1', N'-16,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3289, N'OmiseGO', N'OMG', N'1,09557', N'0,24', N'-12,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3290, N'0x', N'ZRX', N'0,24754', N'-1,1', N'-14,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3291, N'Chainlink', N'LINK', N'0,42068', N'7,10', N'-12,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3292, N'Decred', N'DCR', N'15,9424', N'0,70', N'-6,5')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3293, N'Basic Attention Token', N'BAT', N'0,11061', N'-2,6', N'-13,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3294, N'Augur', N'REP', N'13,1521', N'6,99', N'-6,1')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3295, N'Lisk', N'LSK', N'1,11766', N'-0,5', N'-9,0')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3296, N'Nano', N'NANO', N'0,85937', N'1,12', N'-14,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3297, N'Paxos Standard Token', N'PAX', N'1,01036', N'0,01', N'0,21')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3298, N'Holo', N'HOT', N'0,00127', N'19,6', N'23,1')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3299, N'Bitcoin Diamond', N'BCD', N'0,72034', N'1,84', N'-7,5')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3300, N'Bytecoin', N'BCN', N'0,00058', N'-0,0', N'-5,0')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3301, N'Revain', N'R', N'0,16709', N'-3,3', N'-25,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3302, N'Steem', N'STEEM', N'0,27334', N'-2,6', N'-22,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3303, N'ICON', N'ICX', N'0,19296', N'1,01', N'-15,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3304, N'DigiByte', N'DGB', N'0,00884', N'1,02', N'-6,2')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3305, N'BitShares', N'BTS', N'0,03815', N'4,71', N'-0,8')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3306, N'Verge', N'XVG', N'0,00599', N'0,58', N'-10,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3307, N'Siacoin', N'SC', N'0,00228', N'-0,4', N'-8,1')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3308, N'Aeternity', N'AE', N'0,36957', N'0,25', N'-11,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3309, N'Stratis', N'STRAT', N'0,78470', N'2,10', N'-18,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3310, N'Gemini Dollar', N'GUSD', N'1,01693', N'0,59', N'0,62')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3311, N'Pundi X', N'NPXS', N'0,00061', N'5,99', N'14,8')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3312, N'Bytom', N'BTM', N'0,07687', N'-2,2', N'-3,6')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3313, N'IOST', N'IOST', N'0,00574', N'0,79', N'-12,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3314, N'Komodo', N'KMD', N'0,64872', N'3,80', N'-5,8')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3315, N'Dai', N'DAI', N'1,01232', N'0,36', N'0,71')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3316, N'Status', N'SNT', N'0,01840', N'-0,2', N'-12,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3317, N'Populous', N'PPT', N'1,20510', N'1,04', N'-8,4')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3318, N'Golem', N'GNT', N'0,05666', N'-0,7', N'-14,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3319, N'ODEM', N'ODE', N'0,22924', N'-2,9', N'-17,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3320, N'Loopring', N'LRC', N'0,05772', N'4,76', N'-24,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3321, N'Factom', N'FCT', N'5,88368', N'0,69', N'-15,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3322, N'Cryptonex', N'CNX', N'0,99612', N'0,40', N'-6,5')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3323, N'Electroneum', N'ETN', N'0,00677', N'7,40', N'-0,2')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3324, N'PayPie', N'PPP', N'0,71518', N'-7,1', N'1,70')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3325, N'Aurora', N'AOA', N'0,00864', N'13,2', N'10,3')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3326, N'REPO', N'REPO', N'0,50847', N'-1,7', N'-0,5')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3327, N'MaidSafeCoin', N'MAID', N'0,10687', N'-0,7', N'-11,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3328, N'Ardor', N'ARDR', N'0,05246', N'2,50', N'-2,8')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3329, N'Huobi Token', N'HT', N'0,93851', N'0,13', N'-10,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3330, N'Insight Chain', N'INB', N'0,28811', N'-0,4', N'-3,6')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3331, N'HyperCash', N'HC', N'0,92673', N'3,46', N'-16,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3332, N'Mixin', N'XIN', N'94,0966', N'0,68', N'-9,5')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3333, N'Waltonchain', N'WTC', N'0,94260', N'1,20', N'-16,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3334, N'Polymath', N'POLY', N'0,10362', N'3,79', N'-14,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3335, N'PIVX', N'PIVX', N'0,65480', N'1,20', N'-15,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3336, N'Project Pai', N'PAI', N'0,03193', N'-4,6', N'-18,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3337, N'Ark', N'ARK', N'0,39012', N'3,24', N'-3,6')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3338, N'Decentraland', N'MANA', N'0,03493', N'0,42', N'-11,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3339, N'THETA', N'THETA', N'0,05725', N'9,11', N'2,99')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3340, N'Dentacoin', N'DCN', N'0,00012', N'9,13', N'-10,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3341, N'ReddCoin', N'RDD', N'0,00124', N'1,45', N'-8,4')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3342, N'DigixDAO', N'DGD', N'15,6973', N'2,07', N'-16,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3343, N'Aion', N'AION', N'0,11566', N'-0,3', N'-14,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3344, N'Linkey', N'LKY', N'0,75716', N'5,08', N'0,40')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3345, N'KuCoin Shares', N'KCS', N'0,36756', N'3,61', N'-9,3')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3346, N'Power Ledger', N'POWR', N'0,07831', N'0,74', N'-14,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3347, N'Ravencoin', N'RVN', N'0,01100', N'0,41', N'-14,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3348, N'Crypto.com', N'MCO', N'1,97328', N'-1,0', N'-11,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3349, N'MonaCoin', N'MONA', N'0,48993', N'-0,3', N'-9,2')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3350, N'TenX', N'PAY', N'0,24984', N'0,13', N'-19,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3351, N'STASIS EURS', N'EURS', N'1,12025', N'0,11', N'0,20')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3352, N'Nexo', N'NEXO', N'0,05476', N'-1,1', N'-8,6')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3353, N'Bancor', N'BNT', N'0,48412', N'0,40', N'-9,9')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3354, N'Wanchain', N'WAN', N'0,27710', N'-0,1', N'-14,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3355, N'Buggyra Coin Zero', N'BCZERO', N'0,01749', N'13,6', N'-28,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3356, N'GXChain', N'GXS', N'0,54544', N'0,85', N'-2,7')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3357, N'Elastos', N'ELA', N'2,13527', N'0,88', N'-7,5')
GO
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (3358, N'WAX', N'WAX', N'0,03184', N'-2,2', N'-11,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (4259, N'Zcoin', N'XZC', N'4,67935', N'1,08', N'-6,5')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (4260, N'Crypto.com Chain', N'CRO', N'0,01259', N'-1,8', N'-6,6')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (4261, N'Dent', N'DENT', N'0,00101', N'-0,2', N'-7,9')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (4262, N'aelf', N'ELF', N'0,10852', N'5,49', N'-6,3')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (4263, N'MobileGo', N'MGO', N'0,29660', N'1,24', N'33,5')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (4264, N'Everus', N'EVR', N'0,07290', N'14,7', N'201,')
INSERT [dbo].[Cryptocurrencies] ([idCrypto], [name], [symbol], [price], [change24h], [change7d]) VALUES (4265, N'Veritaseum', N'VERI', N'13,3990', N'-2,1', N'5,65')
SET IDENTITY_INSERT [dbo].[Cryptocurrencies] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUsers], [login], [password], [email], [isLogged], [isAdmin]) VALUES (3, N'karol     ', N'123       ', N'karolabc  ', 0, 0)
INSERT [dbo].[Users] ([idUsers], [login], [password], [email], [isLogged], [isAdmin]) VALUES (4, N'user2     ', N'pass2     ', N'abcde     ', 0, 0)
INSERT [dbo].[Users] ([idUsers], [login], [password], [email], [isLogged], [isAdmin]) VALUES (5, N'user      ', N'pass      ', N'mail      ', 0, 0)
INSERT [dbo].[Users] ([idUsers], [login], [password], [email], [isLogged], [isAdmin]) VALUES (2006, N'admin', N'admin', N'admin@gmail.com', 0, 1)
INSERT [dbo].[Users] ([idUsers], [login], [password], [email], [isLogged], [isAdmin]) VALUES (2007, N'1', N'1', N'1mail', 0, 0)
INSERT [dbo].[Users] ([idUsers], [login], [password], [email], [isLogged], [isAdmin]) VALUES (2008, N'admin2', N'admin2', N'admin2@', 0, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[WalletsC] ([idUser], [idWalletC], [idCrypto], [quantity], [sum], [idAlert], [priceWhenAdded], [changeWallet], [alertUp], [alertDown]) VALUES (2006, 1, 3261, N'2', N'215,962', 1, N'107,583', N'0,119', N'0,05', N'0,05')
INSERT [dbo].[WalletsC] ([idUser], [idWalletC], [idCrypto], [quantity], [sum], [idAlert], [priceWhenAdded], [changeWallet], [alertUp], [alertDown]) VALUES (2006, 1, 3259, N'2', N'6980', 1, N'3497,14', N'-0,24', N'1', N'1')
INSERT [dbo].[WalletsC] ([idUser], [idWalletC], [idCrypto], [quantity], [sum], [idAlert], [priceWhenAdded], [changeWallet], [alertUp], [alertDown]) VALUES (2006, 1, 3271, N'300', N'77,838', 1, N'0,25946', N'0,019', N'1', N'1')
INSERT [dbo].[WalletsC] ([idUser], [idWalletC], [idCrypto], [quantity], [sum], [idAlert], [priceWhenAdded], [changeWallet], [alertUp], [alertDown]) VALUES (2006, 1, 3275, N'0', N'0', 1, N'7,02799', N'0,047', N'10', N'10')
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
               Bottom = 230
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "WalletsC"
            Begin Extent = 
               Top = 10
               Left = 282
               Bottom = 228
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 6
               Left = 490
               Bottom = 237
               Right = 681
            End
            DisplayFlags = 280
            TopColumn = 1
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
         Table = 1176
         Output = 1272
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
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
