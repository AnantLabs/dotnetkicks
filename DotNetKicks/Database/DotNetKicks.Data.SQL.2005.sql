/****** Generated by: Easy SQL tools 2.3 Script Date: 06/07/2007 11:05 ******/

SET NOCOUNT ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO

-- [*Begin transaction]
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
GO

-- [Constraints DISABLE]
ALTER TABLE [dbo].[Kick_Category] NOCHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_Category] DISABLE TRIGGER    ALL
ALTER TABLE [dbo].[Kick_Comment] NOCHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_Comment] DISABLE TRIGGER    ALL
ALTER TABLE [dbo].[Kick_Host] NOCHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_Host] DISABLE TRIGGER    ALL
ALTER TABLE [dbo].[Kick_Story] NOCHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_Story] DISABLE TRIGGER    ALL
ALTER TABLE [dbo].[Kick_StoryKick] NOCHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_StoryKick] DISABLE TRIGGER    ALL
ALTER TABLE [dbo].[Kick_User] NOCHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_User] DISABLE TRIGGER    ALL
ALTER TABLE [dbo].[Kick_Setting] NOCHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_Setting] DISABLE TRIGGER    ALL
GO

-- [dbo].[Kick_Category] (3 rows)
SET IDENTITY_INSERT [dbo].[Kick_Category] ON
INSERT INTO [dbo].[Kick_Category] ([CategoryID], [HostID], [CategoryIdentifier], [Name], [Description], [IconName], [OrderPriority]) VALUES (1, 1, N'opensource', N'Open Source', N'', N'opensource.png', 100)
INSERT INTO [dbo].[Kick_Category] ([CategoryID], [HostID], [CategoryIdentifier], [Name], [Description], [IconName], [OrderPriority]) VALUES (2, 1, N'dotnetkicks', N'DotNetKicks.com', N'', N'createuser.png', 100)
INSERT INTO [dbo].[Kick_Category] ([CategoryID], [HostID], [CategoryIdentifier], [Name], [Description], [IconName], [OrderPriority]) VALUES (3, 1, N'subsonic', N'Sub Sonic', N'', N'dotnet.png', 100)
SET IDENTITY_INSERT [dbo].[Kick_Category] OFF
GO

-- [dbo].[Kick_Comment] (1 rows)
SET IDENTITY_INSERT [dbo].[Kick_Comment] ON
INSERT INTO [dbo].[Kick_Comment] ([CommentID], [StoryID], [UserID], [Username], [Comment], [CreatedOn]) VALUES (1, 1, 3, N'user1', N'Vaporware!!!<br/><br/>http://en.wikipedia.org/wiki/Vaporware', '2007-07-06T10:44:43')
SET IDENTITY_INSERT [dbo].[Kick_Comment] OFF
GO

-- [dbo].[Kick_Host] (1 rows)
SET IDENTITY_INSERT [dbo].[Kick_Host] ON
INSERT INTO [dbo].[Kick_Host] ([HostID], [HostName], [RootUrl], [SiteTitle], [SiteDescription], [TagLine], [LogoPath], [CreatedOn], [BlogUrl], [Email], [Template], [ShowAds], [Culture], [UICulture], [Publish_MinimumStoryAgeInHours], [Publish_MaximumStoryAgeInHours], [Publish_MaximumSimultaneousStoryPublishCount], [Publish_MinimumStoryScore], [Publish_MinimumStoryKickCount], [Publish_MinimumStoryCommentCount], [Publish_MinimumAverageStoryKicksPerHour], [Publish_MinimunAverageCommentsPerHour], [Publish_MinimumViewCount], [Publish_KickScore], [Publish_CommentScore], [AdsenseID], [TrackingHtml], [AnnouncementHtml], [SmtpHost], [SmtpPort], [SmtpUsername], [SmtpPassword], [SmtpEnableSsl]) VALUES (1, N'localhost:8080', N'http://localhost:8080', N'localhost:8080', N'localhost:8080 is a testbed of a community based  news site edited by our members (we have only one).', N'Test news, with no real community', N'', '2007-07-06T00:00:00', N'http://blog.incremental.ie/', N'gavin@incremental.ie', N'Default', 1, N'EN', N'EN', 0, 300, 8, 2, 0, 0, 0, 0, 0, 5, 2, N'pub-2786188635346157', N'', N'', N'smtp.server.com', 25, N'auto@server.com', N'password', 0)
SET IDENTITY_INSERT [dbo].[Kick_Host] OFF
GO

-- [dbo].[Kick_Story] (1 rows)
SET IDENTITY_INSERT [dbo].[Kick_Story] ON
INSERT INTO [dbo].[Kick_Story] ([StoryID], [HostID], [StoryIdentifier], [Title], [Description], [Url], [CategoryID], [UserID], [Username], [KickCount], [SpamCount], [ViewCount], [CommentCount], [IsPublishedToHomepage], [IsSpam], [AdsenseID], [CreatedOn], [PublishedOn]) VALUES (1, 1, N'DotNetKicks_to_be_Open_Sourced', N'DotNetKicks to be Open Sourced?', N'It has been months since Gavin announced his plan to open source the DotNetKicks.com codebase. Very little has been heard on the subject recently. Will we ever get to see the code?', N'http://weblogs.asp.net/gavinjoyce/archive/2007/03/20/dotnetkicks-to-be-open-source.aspx', 2, 1, N'admin', 2, 0, 0, 1, 1, 0, N'', '2007-07-06T10:43:04', '2007-07-06T10:43:04')
SET IDENTITY_INSERT [dbo].[Kick_Story] OFF
GO

-- [dbo].[Kick_StoryKick] (2 rows)
SET IDENTITY_INSERT [dbo].[Kick_StoryKick] ON
INSERT INTO [dbo].[Kick_StoryKick] ([StoryKickID], [StoryID], [UserID], [HostID], [CreatedOn]) VALUES (1, 1, 1, 1, '2007-07-06T10:43:04')
INSERT INTO [dbo].[Kick_StoryKick] ([StoryKickID], [StoryID], [UserID], [HostID], [CreatedOn]) VALUES (2, 1, 3, 1, '2007-07-06T10:43:58')
SET IDENTITY_INSERT [dbo].[Kick_StoryKick] OFF
GO

-- [dbo].[Kick_User] (2 rows)
SET IDENTITY_INSERT [dbo].[Kick_User] ON
INSERT INTO [dbo].[Kick_User] ([UserID], [Username], [Email], [Password], [PasswordSalt], [IsGeneratedPassword], [IsValidated], [IsBanned], [AdsenseID], [ReceiveEmailNewsletter], [Roles], [HostID], [LastActiveOn], [CreatedOn], [ModifiedOn]) VALUES (1, N'admin', N'gavinjoyce@gmail.com', N'3BHux4iNBgtpmAQDDabctr1dCK4=', N'/xwEvNw0yYJLlbTs5jwHMg==', 0, 1, 0, N'', 1, N'administrator|debugger|moderator', 1, '2007-07-06T10:40:02', '2007-07-06T10:35:14', '2007-07-06T10:40:02')
INSERT INTO [dbo].[Kick_User] ([UserID], [Username], [Email], [Password], [PasswordSalt], [IsGeneratedPassword], [IsValidated], [IsBanned], [AdsenseID], [ReceiveEmailNewsletter], [Roles], [HostID], [LastActiveOn], [CreatedOn], [ModifiedOn]) VALUES (3, N'user1', N'user1@gavinjoyce.com', N'qWRcJUMbLhtceS27Ua7BcvOc8Lw=', N'IxtyBW7CpTZoI8VSXjKyDA==', 0, 1, 0, N'', 1, N'', 1, '2007-07-06T10:43:51', '2007-07-06T10:37:20', '2007-07-06T10:43:51')
SET IDENTITY_INSERT [dbo].[Kick_User] OFF
GO
-- [dbo].[Kick_Setting] (3 rows)
SET IDENTITY_INSERT [dbo].[Kick_Setting] ON
INSERT INTO [dbo].[Kick_Setting] ([SettingID], [Name], [Value]) VALUES (1, N'Security.Cipher.PassPhrase', N'TODO**change')
INSERT INTO [dbo].[Kick_Setting] ([SettingID], [Name], [Value]) VALUES (2, N'Security.Cipher.Salt', N'TODO**change')
INSERT INTO [dbo].[Kick_Setting] ([SettingID], [Name], [Value]) VALUES (3, N'Security.Cipher.InitVector', N'abcdefghijklmnop')
SET IDENTITY_INSERT [dbo].[Kick_Setting] OFF
GO


-- [Constraints ENABLE]
ALTER TABLE [dbo].[Kick_Category] CHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_Category] ENABLE TRIGGER    ALL
ALTER TABLE [dbo].[Kick_Comment] CHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_Comment] ENABLE TRIGGER    ALL
ALTER TABLE [dbo].[Kick_Host] CHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_Host] ENABLE TRIGGER    ALL
ALTER TABLE [dbo].[Kick_Story] CHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_Story] ENABLE TRIGGER    ALL
ALTER TABLE [dbo].[Kick_Setting] CHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_Setting] ENABLE TRIGGER    ALL
ALTER TABLE [dbo].[Kick_StoryKick] CHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_StoryKick] ENABLE TRIGGER    ALL
ALTER TABLE [dbo].[Kick_User] CHECK CONSTRAINT ALL
ALTER TABLE [dbo].[Kick_User] ENABLE TRIGGER    ALL
GO

-- [Script End]
IF @@TRANCOUNT>0 COMMIT TRANSACTION
