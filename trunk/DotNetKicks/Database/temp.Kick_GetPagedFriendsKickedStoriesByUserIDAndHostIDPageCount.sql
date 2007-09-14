USE [DotNetKicks]
GO
/****** Object:  StoredProcedure [dbo].[Kick_GetPagedFriendsKickedStoriesByUserIDAndHostIDPageCount]    Script Date: 09/13/2007 17:57:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	returns count of a user's friends kicked stories
-- =============================================
CREATE PROCEDURE [dbo].[Kick_GetPagedFriendsKickedStoriesByUserIDAndHostIDPageCount] 
	-- Add the parameters for the stored procedure here
	@UserID int,
	@HostID int,
	@PageSize int	
AS
BEGIN

SET NOCOUNT ON;
DECLARE @PageCount int
DECLARE @TotalRows int

SET @TotalRows = (Select count(0) 
	FROM  dbo.Kick_Story INNER JOIN
			dbo.Kick_StoryKick ON dbo.Kick_Story.StoryID = dbo.Kick_StoryKick.StoryID
		INNER JOIN dbo.Kick_UserFriend ON dbo.Kick_UserFriend.FriendID = dbo.Kick_StoryKick.UserID
	WHERE dbo.Kick_UserFriend.UserID=@UserID AND dbo.Kick_StoryKick.HostID=@HostID)


SELECT @PageCount = (@TotalRows + (@PageSize - 1) ) / @PageSize
	
return @PageCount

END
