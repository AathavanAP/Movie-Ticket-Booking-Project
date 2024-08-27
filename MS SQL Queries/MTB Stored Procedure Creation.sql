USE [MovieDB]
GO

/****** Object:  StoredProcedure [dbo].[MTB]    Script Date: 8/26/2024 11:02:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTB]
    @Type NVARCHAR(20),
    @Name NVARCHAR(100) = NULL,
    @PhoneNumber NVARCHAR(15) = NULL,
    @Language NVARCHAR(50) = NULL,
    @MovieName NVARCHAR(100) = NULL,
    @Location NVARCHAR(100) = NULL,
    @Date DATE = NULL,
    @Time TIME = NULL,
    @TicketCount INT = NULL,
    @BookingStatus NVARCHAR(20) = NULL
AS
BEGIN
    IF @Type = 'FinalBooking'
    BEGIN
        INSERT INTO BookingTable (Name, PhoneNumber, Language, MovieName, Location, Date, Time, TicketCount, BookingStatus)
        VALUES (@Name, @PhoneNumber, @Language, @MovieName, @Location, @Date, @Time, @TicketCount, @BookingStatus);
    END
    ELSE IF @Type = 'SELECT'
    BEGIN
        SELECT * FROM BookingTable;
    END
END;
GO


