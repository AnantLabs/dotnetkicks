USE [DotNetKicks]
GO

ALTER TABLE dbo.Kick_Host ADD [SubmitAStoryMessage] [nvarchar](2000) NULL
GO

ALTER TABLE dbo.Kick_Host ADD [JoinTheCommunityMessage] [nvarchar](2000) NULL
GO

