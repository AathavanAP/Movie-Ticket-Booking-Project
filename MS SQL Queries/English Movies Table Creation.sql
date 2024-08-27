USE [MovieDB]
GO

/****** Object:  Table [dbo].[EnglishMovies]    Script Date: 8/26/2024 10:59:32 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EnglishMovies]') AND type in (N'U'))
DROP TABLE [dbo].[EnglishMovies]
GO

/****** Object:  Table [dbo].[EnglishMovies]    Script Date: 8/26/2024 10:59:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EnglishMovies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


