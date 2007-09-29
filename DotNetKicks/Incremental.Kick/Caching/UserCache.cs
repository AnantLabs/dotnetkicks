using System;
using Incremental.Kick.Dal;
using Incremental.Kick.Security;
using Incremental.Kick.BusinessLogic;
using System.Security;

namespace Incremental.Kick.Caching {
    public class UserCache {
        public static User GetUser(string securityToken) {
            int? userID = null;

            if (!String.IsNullOrEmpty(securityToken))
                userID = SecurityToken.FromString(securityToken).UserID;

            return userID.HasValue ? GetUser(userID.Value) : GetUser(0);
        }

        private static readonly object _getUserLock = new object();

        public static User GetUser(int userID) {
            CacheManager<string, User> userCache = GetUserCache();
            string cacheKey = GetUserProfileCacheKey(userID);
            User user = userCache[cacheKey];

            lock (_getUserLock) {
                if (user == null) {
                    if (userID == 0) {
                        user = new User(0);
                        user.Username = "Anonymous";
                    } else {
                        user = User.FetchByID(userID);
                    }
                    userCache.Insert(cacheKey, user, CacheHelper.CACHE_DURATION_IN_SECONDS, System.Web.Caching.CacheItemPriority.NotRemovable);
                }
            }

            return user;
        }


        public static int GetUserID(string username) {
            CacheManager<string, int?> userIDCache = GetUserIDCache();
            string cacheKey = "GetUserID_" + username;

            int? userID = userIDCache[cacheKey];
            if (!userID.HasValue) {
                userID = User.FetchUserByUsername(username).UserID;
                userIDCache.Insert(cacheKey, userID, CacheHelper.CACHE_DURATION_IN_SECONDS, System.Web.Caching.CacheItemPriority.NotRemovable);
            }

            return userID.Value;
        }

        public static User GetUserByUsername(string username) {
            return GetUser(GetUserID(username));
        }


        public static void RemoveUser(string securityToken) {
            RemoveUser(SecurityToken.FromString(securityToken).UserID);
        }

        public static void RemoveUser(int userID) {
            GetUserCache().Remove(GetUserProfileCacheKey(userID));
        }

        private static string GetUserProfileCacheKey() {
            return "UserProfile_Anonymous";
        }

        private static string GetUserProfileCacheKey(int userID) {
            return "UserProfile_" + userID;
        }

        //TODO: GJ: some improvements are needed here - a sproc would be better
        public static int KickStory(int storyID, int userID, int hostID) {
            if (StoryBR.DoesStoryKickExist(storyID, userID, hostID))
                throw new SecurityException("The story has already been kicked!");

            StoryKick storyKick = StoryBR.AddStoryKick(storyID, userID, hostID);
            GetUserStoryKicks(userID).Add(storyKick);
            UserAction.RecordKick(hostID, GetUser(userID), Story.FetchByID(storyID));

            return StoryBR.IncrementKickCount(storyID);
        }
        
        public static int UnKickStory(int storyID, int userID, int hostID) {
            if (StoryBR.DoesStoryKickNotExist(storyID, userID, hostID))
                throw new SecurityException("There is no kick to unkick!");

            StoryBR.DeleteStoryKick(storyID, userID, hostID);
            RemoveStoryKick(storyID, userID, hostID);
            UserAction.RecordUnKick(hostID, GetUser(userID), Story.FetchByID(storyID));
            return StoryBR.DecrementKickCount(storyID);
        }

        public static bool HasUserKickedStory(int storyID, int userID) {
            //PERF: there will be performance benefits if we use a hashtable here
            foreach (StoryKick storyKick in GetUserStoryKicks(userID)) {
                if (storyID == storyKick.StoryID)
                    return true;
            }

            return false;
        }

        public static void RemoveStoryKick(int storyID, int userID, int hostID) {
            //PERF: there will be performance benefits if we use a hashtable here
            StoryKickCollection storyKicks = GetUserStoryKicks(userID);
            foreach (StoryKick storyKick in storyKicks) {
                if (storyID == storyKick.StoryID) {
                    storyKicks.Remove(storyKick);
                    return;
                }
            }
        }

        public static StoryKickCollection GetUserStoryKicks(int userID) {
            string cacheKey = String.Format("Kick_StoryKickTable_{0}", userID);

            CacheManager<string, StoryKickCollection> storyKickCache = GetStoryKickCache();

            StoryKickCollection storyKicks = storyKickCache[cacheKey];

            if (storyKicks == null) {
                //TODO: get the latest n kicks for this userIdentifier
                storyKicks = StoryKick.FetchByUserID(userID);
                storyKickCache.Insert(cacheKey, storyKicks, CacheHelper.CACHE_DURATION_IN_SECONDS, System.Web.Caching.CacheItemPriority.NotRemovable);
            }

            return storyKicks;
        }

        public static UserCollection GetUsersWhoKicked(int? storyId) {
            string cacheKey = String.Format("UsersWhoKicked_Story_{0}", storyId);
            CacheManager<string, UserCollection> userCollectionCache = GetUserCollectionCache();
            UserCollection users = userCollectionCache[cacheKey];

            if (users == null) {
                users = UserBR.GetUsersWhoKicked(storyId);
                userCollectionCache.Insert(cacheKey, users, CacheHelper.CACHE_DURATION_IN_SECONDS);
            }

            return users;
        }

        public static UserCollection GetOnlineUsers(int minutesSinceLastActive, int hostID, User userProfile) {
            string cacheKey = String.Format("OnlineUsers_{0}_{1}", minutesSinceLastActive, hostID);
            CacheManager<string, UserCollection> userCollectionCache = GetUserCollectionCache();
            UserCollection users = userCollectionCache[cacheKey];

            if (users == null) {

                users = User.FetchOnlineUsers(minutesSinceLastActive, hostID);
                userCollectionCache.Insert(cacheKey, users, 60, System.Web.Caching.CacheItemPriority.NotRemovable);
            }

            // If current user has permissions show all online users
            if (userProfile.IsModerator || userProfile.IsAdministrator)
                return users;

            // Otherwise show only users who choose to appear online
            users.RemoveAll(delegate(User user) { return !user.AppearOnline; });
            return users;
        }

        public static int GetOnlineUsersCount(int minutesSinceLastActive, int hostID, User userProfile)
        {
            return GetOnlineUsers(minutesSinceLastActive, hostID, userProfile).Count;
        }

        private static CacheManager<string, UserCollection> GetUserCollectionCache() {
            return CacheManager<string, UserCollection>.GetInstance();
        }

        private static CacheManager<string, StoryKickCollection> GetStoryKickCache() {
            return CacheManager<string, StoryKickCollection>.GetInstance();
        }

        private static CacheManager<string, User> GetUserCache() {
            return CacheManager<string, User>.GetInstance();
        }

        private static CacheManager<string, int?> GetUserIDCache() {
            return CacheManager<string, int?>.GetInstance();
        }
    }
}
