using System;
using System.Web;
using Incremental.Kick.Common.Entities;
using Incremental.Kick.Dal;
//using Incremental.Kick.Common.Entities;

namespace Incremental.Kick.Web.Helpers {
    public class UrlFactory {

        public enum PageName {
            Home,
            HomeRss,
            Login,
            LoginSwitch,
            Logout,
            ForgotPassword,
            ChangePassword,
            Register,
            About,
            EarnMoney,
            Contribute,
            JavaScriptFeeds,
            Tools,
            Search,
            ViewUser,
            ViewUserRss,
            ViewUserTag,
            ViewUserTags,
            Users,
            ViewCategory,
            ViewCategoryRss,
            ViewCategoryNewStories,
            ViewCategoryNewStoriesRss,
            ViewTag,
            ViewTags,
            NewStories,
            ViewStory,
            SubmitStory
        }

        public static string CreateUrl(PageName pageName) {
            switch (pageName) {
                case PageName.Home:
                    return MapPath("/");
                case PageName.HomeRss:
                    return MapPath("/feeds/rss");
                case PageName.Login:
                    return MapPath("/login");
                case PageName.LoginSwitch:
                    return MapPath("/loginswitch");
                case PageName.Logout:
                    return MapPath("/logout");
                case PageName.Register:
                    return MapPath("/register");
                case PageName.About:
                    return MapPath("/docs/about");
                case PageName.EarnMoney:
                    return MapPath("/docs/earnmoney");
                case PageName.Contribute:
                    return MapPath("/docs/contribute");
                case PageName.JavaScriptFeeds:
                    return MapPath("/docs/webfeeds");
                case PageName.Tools:
                    return MapPath("/docs/tools");
                case PageName.Search:
                    return MapPath("/search");
                case PageName.Users:
                    return MapPath("/users");
                case PageName.SubmitStory:
                    return MapPath("/submit");
                case PageName.NewStories:
                    return MapPath("/upcoming");
                case PageName.ChangePassword:
                    return MapPath("/changepassword");
                case PageName.ViewTags:
                    return MapPath("/tags");
                default:
                    throw new Exception("not enough params to create url");
            }
        }

        public static string CreateUrl(PageName pageName, string value) {
            switch (pageName) {
                case PageName.ViewUser:
                    return MapPath(String.Format("/users/{0}", value));
                case PageName.ViewUserRss:
                    return MapPath(String.Format("/users/{0}/rss", value));
                case PageName.ViewUserTags:
                    return MapPath(String.Format("/users/{0}/tags", value));
                case PageName.ViewCategory:
                    return MapPath(String.Format("/{0}", value));
                case PageName.ViewCategoryRss:
                    return MapPath(String.Format("/{0}/rss", value));
                case PageName.ViewCategoryNewStories:
                    return MapPath(String.Format("/{0}/upcoming", value));
                case PageName.ViewCategoryNewStoriesRss:
                    if (String.IsNullOrEmpty(value))
                        return MapPath(String.Format("/upcoming/rss", value));
                    else
                        return MapPath(String.Format("/{0}/upcoming/rss", value));
                case PageName.LoginSwitch:
                    //return MapPath(String.Format("/loginswitch/?url={0}", HttpUtility.UrlEncode(value)));
                    return MapPath("/loginswitch");
                case PageName.ViewTag:
                    return MapPath(String.Format("/tags/{0}", value));

                default:
                    throw new Exception("not enough params to create url");
            }
        }

        public static string CreateUrl(PageName pageName, string identifier1, string identifier2) {
            switch (pageName) {
                case PageName.ViewStory:
                    return MapPath(String.Format("/{1}/{0}", identifier1, identifier2));
                case PageName.ViewUserTag:
                    return MapPath(String.Format("/users/{0}/tags/{1}", identifier1, identifier2));
                default:
                    throw new Exception("not enough params to create url");
            }
        }

        public static string CreateUrl(PageName pageName, string storyIdentifier, string categoryIdentifier, int commentID) {
            switch (pageName) {
                case PageName.ViewStory:
                    return MapPath(String.Format("/{0}/{1}#Comment_{2}", categoryIdentifier, storyIdentifier, commentID));
                default:
                    throw new Exception("not enough params to create url");
            }
        }

        public static string CreateUrl(PageName pageName, string storyIdentifier, string categoryIdentifier, Host hostProfile) {
            switch (pageName) {
                case PageName.ViewStory:
                    return hostProfile.RootUrl + String.Format("/{0}/{1}", categoryIdentifier, storyIdentifier);
                default:
                    throw new Exception("not enough params to create url");
            }
        }

        private static string MapPath(string relativeUrl) {
            string mappedPath;
            if (HttpContext.Current.Request.ApplicationPath.Length > 1) {
                mappedPath = HttpContext.Current.Request.ApplicationPath + relativeUrl;
            } else {
                mappedPath = relativeUrl;
            }

            mappedPath = mappedPath.TrimEnd("/".ToCharArray());

            if (mappedPath.Length == 0)
                mappedPath = "/";

            //System.Diagnostics.Trace.WriteLine("MapPath Url:  " + mappedPath);

            return mappedPath;
        }
    }
}