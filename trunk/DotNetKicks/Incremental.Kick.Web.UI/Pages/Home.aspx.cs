using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Incremental.Kick.Web.Helpers;
using Incremental.Kick.Common.Enums;
using Incremental.Kick.Caching;

namespace Incremental.Kick.Web.UI.Pages {
    public partial class Home : Incremental.Kick.Web.Controls.KickUIPage {
        protected Home() {
            //this.IsCachedPage = true;
            this.DisplayAds = true; //and watch the millions pour in!!!
        }

        protected void Page_Init(object sender, EventArgs e) {
            this.Title = this.HostProfile.SiteTitle + " - " + this.HostProfile.TagLine + ".";
            this.Caption = "Latest popular stories";
            this.PageName = UrlFactory.PageName.Home;
            this.RssFeedUrl = UrlFactory.CreateUrl(UrlFactory.PageName.HomeRss);
        }

        protected void Page_Load(object sender, EventArgs e) {
            if (this.UrlParameters.PageNumber == 1)
                this.PopularStoryListHeader.UseAjaxLinks = true;

            switch (this.UrlParameters.StoryListSortBy) {
                case StoryListSortBy.RecentlyPromoted:
                    this.PopularStoryNavigator.DataBind(StoryCache.GetAllStories(true, this.HostProfile.HostID, this.UrlParameters.PageNumber, this.UrlParameters.PageSize), StoryCache.GetStoryCount(this.HostProfile.HostID, true));
                    break;
                default:
                    this.PopularStoryNavigator.DataBind(StoryCache.GetPopularStories(this.HostProfile.HostID, this.UrlParameters.StoryListSortBy, this.UrlParameters.PageNumber, this.UrlParameters.PageSize), StoryCache.GetPopularStoriesCount(this.HostProfile.HostID, this.UrlParameters.StoryListSortBy));
                    break;
            }

            this.SubCaption = String.Format(@"<a href=""{0}"">View {1} upcoming stories >></a>", UrlFactory.CreateUrl(UrlFactory.PageName.NewStories), StoryCache.GetUpcomingStoryCount(this.HostProfile));
        }
    }
}