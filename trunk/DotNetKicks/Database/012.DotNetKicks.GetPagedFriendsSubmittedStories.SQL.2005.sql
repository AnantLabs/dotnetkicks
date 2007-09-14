USE [DotNetKicks]
GO
/****** Object:  StoredProcedure [dbo].[Kick_GetPagedFriendsSubmittedStoriesByUserIDAndHostID]    Script Date: 09/13/2007 17:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Kick_GetPagedFriendsSubmittedStoriesByUserIDAndHostID]
	@UserID int,
	@HostID int,
	@PageNumber int,
	@PageSize int
AS
BEGIN

DECLARE @StartRow int, @EndRow int
SET @StartRow = (((@PageNumber - 1) * @PageSize) + 1);
SET @EndRow = (@StartRow + @PageSize - 1);


WITH SubmittedStories 
	AS (SELECT ROW_NUMBER() OVER (ORDER BY Kick_Story.CreatedOn DESC) AS 
		Row, dbo.Kick_Story.*
	FROM         
		dbo.Kick_Story INNER JOIN dbo.Kick_UserFriend ON 
			dbo.Kick_UserFriend.FriendID = dbo.Kick_Story.UserID
	WHERE dbo.Kick_UserFriend.UserID=@UserID AND dbo.Kick_Story.HostID=@HostID)

SELECT * FROM SubmittedStories
WHERE ROW between @StartRow AND @EndRow


END
