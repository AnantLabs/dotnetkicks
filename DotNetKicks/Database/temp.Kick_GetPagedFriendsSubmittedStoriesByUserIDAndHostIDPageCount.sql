USE [DotNetKicks]
GO
/****** Object:  StoredProcedure [dbo].[Kick_GetPagedFriendsSubmittedStoriesByUserIDAndHostIDPageCount]    Script Date: 09/13/2007 17:58:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	returns count of a user's friends submitted stories
-- =============================================
CREATE PROCEDURE [dbo].[Kick_GetPagedFriendsSubmittedStoriesByUserIDAndHostIDPageCount] 
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
	FROM         
		dbo.Kick_Story INNER JOIN dbo.Kick_UserFriend ON 
			dbo.Kick_UserFriend.FriendID = dbo.Kick_Story.UserID
	WHERE dbo.Kick_UserFriend.UserID=@UserID AND dbo.Kick_Story.HostID=@HostID)


SELECT @PageCount = (@TotalRows + (@PageSize - 1) ) / @PageSize

RETURN @PageCount

END
