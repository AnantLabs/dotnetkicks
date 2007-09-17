USE [DotNetKicks]
GO
/****** Object:  StoredProcedure [dbo].[Kick_GetTopCommentedOnStoriesByYear]    Script Date: 09/16/2007 17:43:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jim Welch
-- Create date: 
-- Description:	returns the top 10 stories by year
-- =============================================
CREATE PROCEDURE [dbo].[Kick_GetTopCommentedOnStoriesByYear] 
	-- Add the parameters for the stored procedure here
	@HostId int,
	@Year int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 10 Kick_Story.StoryID, Kick_Story.HostID ,
		Kick_Story.StoryIdentifier, Kick_Story.Title,
		Kick_Story.CategoryID, Kick_Story.UserID,
		Kick_Story.PublishedOn, Kick_Story.ViewCount,
		Kick_Story.KickCount, Kick_Category.CategoryIdentifier,
		count(0) as ItemCount
	from
		Kick_Story inner join Kick_Comment on 
		Kick_Story.StoryId=Kick_Comment.StoryId inner join
		Kick_Category on Kick_Story.CategoryId=Kick_Category.CategoryId
	where 
		Kick_Story.HostId=@HostId AND
		datepart(year,Kick_Comment.CreatedOn) = @Year		
	group by Kick_Story.StoryID, Kick_Story.HostID ,
		Kick_Story.StoryIdentifier, Kick_Story.Title,
		Kick_Story.CategoryID, Kick_Story.UserID,
		Kick_Story.PublishedOn, 
		Kick_Story.ViewCount, Kick_Story.KickCount,
		Kick_Category.CategoryIdentifier
	order by count(0) desc, Kick_Story.KickCount desc, Kick_Story.ViewCount desc

	--- order by view count & comment count in hopes to break tie-breakers
END
