USE [MovieDB]
GO

/****** Object:  Table [dbo].[BookingTable]    Script Date: 8/26/2024 10:56:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BookingTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[Language] [nvarchar](50) NULL,
	[MovieName] [nvarchar](100) NULL,
	[Location] [nvarchar](100) NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
	[TicketCount] [int] NULL,
	[BookingStatus] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


