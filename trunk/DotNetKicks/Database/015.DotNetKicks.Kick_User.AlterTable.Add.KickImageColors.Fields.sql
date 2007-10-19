USE DotNetKicks

GO

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Kick_User ADD
	KickItTextColor nvarchar(50) NULL,
	KickItBackgroundColor nvarchar(50) NULL,
	KickCountTextColor nvarchar(50) NULL,
	KickCountBackgroundColor nvarchar(50) NULL,
	KickImageBorderColor nvarchar(50) NULL
GO
COMMIT
