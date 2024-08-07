CREATE DATABASE [sqldatabase_uberrideanalytics]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_S_Gen5_1', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET ARITHABORT OFF 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET  MULTI_USER 
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET ENCRYPTION ON
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET QUERY_STORE = ON
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  User [USER_MAIL_ADDRESS]    Script Date: 4.07.2024 00:04:35 ******/
CREATE USER [USER_MAIL_ADDRESS] FROM  EXTERNAL PROVIDER  WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ADFUberRideAnalytics]    Script Date: 4.07.2024 00:04:35 ******/
CREATE USER [ADFUberRideAnalytics] FROM  EXTERNAL PROVIDER  WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [THE_OTHER_USER_MAIL_ADDRESS]    Script Date: 4.07.2024 00:04:35 ******/
CREATE USER [THE_OTHER_USER_MAIL_ADDRESS] FROM  EXTERNAL PROVIDER  WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'USER_MAIL_ADDRESS'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'USER_MAIL_ADDRESS'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'ADFUberRideAnalytics'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'ADFUberRideAnalytics'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'THE_OTHER_USER_MAIL_ADDRESS'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'THE_OTHER_USER_MAIL_ADDRESS'
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ride_Rating_Table](
	[trip_id] [int] NOT NULL,
	[customer_rating] [int] NULL,
	[driver_rating] [int] NULL,
	[customer_id] [int] NULL,
	[driver_id] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[trip_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trip_Transaction_Table]    Script Date: 4.07.2024 00:04:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trip_Transaction_Table](
	[trip_id] [int] NOT NULL,
	[trip_start_timestamp] [datetime2](7) NULL,
	[trip_end_timestamp] [datetime2](7) NULL,
	[driver_id] [varchar](255) NULL,
	[driver_name] [varchar](255) NULL,
	[source_location_address1] [varchar](255) NULL,
	[source_city] [varchar](255) NULL,
	[source_province_state] [varchar](255) NULL,
	[source_country] [varchar](255) NULL,
	[destination_location_address1] [varchar](255) NULL,
	[destination_city] [varchar](255) NULL,
	[destination_province_state] [varchar](255) NULL,
	[destination_country] [varchar](255) NULL,
	[total_distance] [int] NULL,
	[total_fare] [int] NULL,
	[trip_status] [varchar](255) NULL,
	[delay_start_time_mins] [int] NULL,
	[payment_method] [varchar](255) NULL,
	[payment_status] [varchar](255) NULL,
	[customer_id] [int] NULL,
	[customer_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[trip_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER DATABASE [sqldatabase_uberrideanalytics] SET  READ_WRITE 
GO
