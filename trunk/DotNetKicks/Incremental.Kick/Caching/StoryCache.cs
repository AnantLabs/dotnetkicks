using System;
using System.Collections.Generic;
using System.Text;
using Incremental.Kick.Dal;
using Incremental.Kick.Common.Enums;

namespace Incremental.Kick.Caching
{
    public class StoryCache
    {

        public static void RemoveStory(int storyID, string storyIdentifier)
        {
            GetStoryCache().Remove(GetStoryCacheKey(storyIdentifier));
            GetCommentCollectionCache().Remove(GetCommentCacheKey(storyID));
        }

        public static Story GetStory(string storyIdentifier)
        {
            string cacheKey = GetStoryCacheKey(storyIdentifier);
            CacheManager<string, Story> storyCache = GetStoryCache();

            Story story = storyCache[cacheKey];

            if (story == null)
            {
                story = Story.FetchStoryByIdentifier(storyIdentifier);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                storyCache.Insert(cacheKey, story, 500); //TODO: config
            }

            return story;
        }

        private static string GetStoryCacheKey(string storyIdentifier)
        {
            return String.Format("Story_{0}", storyIdentifier); ;
        }

        public static CommentCollection GetComments(int storyID)
        {
            string cacheKey = GetCommentCacheKey(storyID);
            CacheManager<string, CommentCollection> commentCache = GetCommentCollectionCache();

            CommentCollection comments = commentCache[cacheKey];

            if (comments == null)
            {
                comments = Comment.FetchCommentsByStoryID(storyID);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                commentCache.Insert(cacheKey, comments, 500); //TODO: config
            }

            return comments;
        }

        private static string GetCommentCacheKey(int storyID)
        {
            return String.Format("CommentCollection_{0}", storyID);
        }


        public static StoryCollection GetAllStories(bool isPublished, int hostID, int pageNumber, int pageSize)
        {
            string cacheKey = String.Format("StoryCollection_{0}_{1}_{2}_{3}", isPublished, hostID, pageNumber, pageSize);

            CacheManager<string, StoryCollection> storyCache = GetStoryCollectionCache();

            StoryCollection stories = storyCache[cacheKey];
            if (stories == null)
            {
                stories = Story.GetStoriesByIsPublishedAndHostID(isPublished, hostID, pageNumber, pageSize);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                storyCache.Insert(cacheKey, stories, 500); //TODO: GJ: config
            }

            return stories;
        }

        public static StoryCollection GetPopularStories(int hostID, StoryListSortBy sortBy, int pageNumber, int pageSize)
        {
            string cacheKey = String.Format("StoryCollection_{0}_{1}_{2}_{3}", hostID, sortBy, pageNumber, pageSize);

            CacheManager<string, StoryCollection> storyCache = GetStoryCollectionCache();

            StoryCollection stories = storyCache[cacheKey];
            if (stories == null)
            {
                stories = Story.GetPopularStories(hostID, sortBy, pageNumber, pageSize);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                storyCache.Insert(cacheKey, stories, 500); //TODO: GJ: config
            }


            return stories;
        }

        public static int GetPopularStoriesCount(int hostID, StoryListSortBy sortBy)
        {
            string cacheKey = String.Format("Kick_PopularStoryCount_{0}_{1}", hostID, sortBy);
            CacheManager<string, int?> countCache = GetCountCache();

            int? count = countCache[cacheKey];
            if (count == null)
            {
                count = Story.GetPopularStoriesCount(hostID, sortBy);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                countCache.Insert(cacheKey, count, 500); //TODO: GJ: config
            }

            return count.Value;
        }
        /*
        public static Kick_StoryTable GetUserKickedStories(string userIdentifier, int hostID, int pageNumber, int pageSize)
        {
            string cacheKey = String.Format("Kick_StoryTable_UserKicked_{0}_{1}_{2}_{3}", userIdentifier, hostID, pageNumber, pageSize);

            CacheManager<string, Kick_StoryTable> storyCache = GetStoryTableCache();

            Kick_StoryTable storyTable = storyCache[cacheKey];

            if (storyTable == null)
            {
                storyTable = Kick_StoryBR.GetUserKickedStories(UserCache.GetUserID(userIdentifier), hostID, pageNumber, pageSize);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                storyCache.Insert(cacheKey, storyTable, WebUIConfigReader.GetConfig().CategoryStoryListCacheDurationInSeconds);
            }

            return storyTable;
        }

        public static int GetUserKickedStoriesCount(string userIdentifier, int hostID)
        {
            string cacheKey = String.Format("Kick_Story_UserKickedCount_{0}_{1}", userIdentifier, hostID);
            CacheManager<string, int> userKickedStoryCountCache = GetCountCache();

            int userKickedStoryCount;
            if (userKickedStoryCountCache.ContainsKey(cacheKey))
            {
                userKickedStoryCount = userKickedStoryCountCache[cacheKey];
            }
            else
            {
                userKickedStoryCount = new Kick_StoryKickBR().GetStoryKicksByUserIDAndHostID_Count(UserCache.GetUserID(userIdentifier), hostID);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                userKickedStoryCountCache.Insert(cacheKey, userKickedStoryCount, WebUIConfigReader.GetConfig().CategoryStoryCountCacheDurationInSeconds);
            }

            return userKickedStoryCount;
        }


        public static Kick_StoryTable GetCategoryStories(short categoryID, bool isKicked, int hostID, int pageNumber, int pageSize)
        {
            string cacheKey = String.Format("Kick_StoryTable_{0}_{1}_{2}_{3}_{4}", categoryID, isKicked, hostID, pageNumber, pageSize);

            CacheManager<string, Kick_StoryTable> storyCache = GetStoryTableCache();

            Kick_StoryTable storyTable = storyCache[cacheKey];

            if (storyTable == null)
            {
                storyTable = new Kick_StoryBR().GetStoriesByCategoryKickedStateAndHostID(categoryID, isKicked, hostID, pageNumber, pageSize).Kick_Story;
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                storyCache.Insert(cacheKey, storyTable, WebUIConfigReader.GetConfig().CategoryStoryListCacheDurationInSeconds);
            }

            return storyTable;
        }

        public static int GetCategoryStoryCount(short categoryID, bool isKicked, int hostID)
        {
            string cacheKey = String.Format("Kick_CategoryStoryCount_{0}_{1}_{2}", categoryID, isKicked, hostID);
            CacheManager<string, int> storyCountCache = GetCountCache();

            int storyCount;
            if (storyCountCache.ContainsKey(cacheKey))
            {
                storyCount = storyCountCache[cacheKey];
            }
            else
            {
                storyCount = new Kick_StoryBR().GetStoriesByCategoryKickedStateAndHostID_Count(categoryID, isKicked, hostID);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                storyCountCache.Insert(cacheKey, storyCount, WebUIConfigReader.GetConfig().CategoryStoryCountCacheDurationInSeconds);
            }

            return storyCount;
        }

        public static Kick_StoryTable GetTaggedStories(string tagIdentifier, int hostID, int pageNumber, int pageSize)
        {
            string cacheKey = String.Format("Kick_TaggedStoryTable_{0}_{1}_{2}_{3}", tagIdentifier, hostID, pageNumber, pageSize);

            CacheManager<string, Kick_StoryTable> storyCache = GetStoryTableCache();

            Kick_StoryTable storyTable = storyCache[cacheKey];

            if (storyTable == null)
            {
                storyTable = Kick_StoryBR.GetTaggedStories(tagIdentifier, hostID, pageNumber, pageSize);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                storyCache.Insert(cacheKey, storyTable, WebUIConfigReader.GetConfig().CategoryStoryListCacheDurationInSeconds);
            }

            return storyTable;
        }

        public static int GetTaggedStoryCount(string tagIdentifier, int hostID)
        {
            string cacheKey = String.Format("Kick_TaggedStoryCount_{0}_{1}", tagIdentifier, hostID);
            CacheManager<string, int> storyCountCache = GetCountCache();

            //TODO: GJ: use nullable types to remove the race condition
            int storyCount;
            if (storyCountCache.ContainsKey(cacheKey))
            {
                storyCount = storyCountCache[cacheKey];
            }
            else
            {
                storyCount = Kick_StoryBR.GetTaggedStoryCount(tagIdentifier, hostID);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                storyCountCache.Insert(cacheKey, storyCount, WebUIConfigReader.GetConfig().CategoryStoryCountCacheDurationInSeconds);
            }

            return storyCount;
        }

        public static void ClearUserTaggedStories(string tagIdentifier, int userID, int hostID)
        {
            //TODO: GJ: refactor: the cache keys are used below too
            GetStoryTableCache().Remove(String.Format("Kick_UserTaggedStoryTable_{0}_{1}_{2}_{3}", tagIdentifier, userID, hostID, 1));
            GetCountCache().Remove(String.Format("Kick_UserTaggedStoryCount_{0}_{1}_{2}", tagIdentifier, userID, hostID));
        }

        public static Kick_StoryTable GetUserTaggedStories(string tagIdentifier, int userID, int hostID, int pageNumber, int pageSize)
        {
            string cacheKey = String.Format("Kick_UserTaggedStoryTable_{0}_{1}_{2}_{3}", tagIdentifier, userID, hostID, pageNumber);

            CacheManager<string, Kick_StoryTable> storyCache = GetStoryTableCache();

            Kick_StoryTable storyTable = storyCache[cacheKey];

            if (storyTable == null)
            {
                storyTable = Kick_StoryBR.GetUserTaggedStories(tagIdentifier, userID, hostID, pageNumber, pageSize);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                storyCache.Insert(cacheKey, storyTable, WebUIConfigReader.GetConfig().CategoryStoryListCacheDurationInSeconds);
            }

            return storyTable;
        }

        public static int GetUserTaggedStoryCount(string tagIdentifier, int userID, int hostID)
        {
            string cacheKey = String.Format("Kick_UserTaggedStoryCount_{0}_{1}_{2}", tagIdentifier, userID, hostID);
            CacheManager<string, int> storyCountCache = GetCountCache();

            //TODO: GJ: use nullable types to remove the race condition
            int storyCount;
            if (storyCountCache.ContainsKey(cacheKey))
            {
                storyCount = storyCountCache[cacheKey];
            }
            else
            {
                storyCount = Kick_StoryBR.GetUserTaggedStoryCount(tagIdentifier, userID, hostID);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                storyCountCache.Insert(cacheKey, storyCount, WebUIConfigReader.GetConfig().CategoryStoryCountCacheDurationInSeconds);
            }

            return storyCount;
        }

        

        public static int GetUpcomingStoryCount(HostProfile hostProfile)
        {
            return GetStoryCount(hostProfile.HostID, false, DateTime.Now.AddHours(-hostProfile.Publish_MaximumStoryAgeInHours), DateTime.Now);
        }


        
         */

        public static int GetStoryCount(int hostID, bool isPublished) {
            string cacheKey = String.Format("Kick_StoryCount_{0}_{1}", isPublished, hostID);
            CacheManager<string, int?> storyCountCache = GetCountCache();

            int storyCount;
            if (storyCountCache.ContainsKey(cacheKey)) {
                storyCount = storyCountCache[cacheKey].Value;
            } else {
                storyCount = Story.GetStoryCount(hostID, isPublished);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                storyCountCache.Insert(cacheKey, storyCount, 500);
            }

            return storyCount;
        }

        public static int GetStoryCount(int hostID, bool isPublished, DateTime startDate, DateTime endDate) {
            string cacheKey = String.Format("Kick_StoryCount_{0}_{1}_{2}_{3}", isPublished, hostID, CacheHelper.DateTimeToCacheKey(startDate), CacheHelper.DateTimeToCacheKey(endDate));
            CacheManager<string, int?> storyCountCache = GetCountCache();

            int storyCount;
            if (storyCountCache.ContainsKey(cacheKey)) {
                storyCount = storyCountCache[cacheKey].Value;
            } else {
                storyCount = Story.GetStoryCount(hostID, isPublished, startDate, endDate);
                System.Diagnostics.Trace.Write("Cache: inserting [" + cacheKey + "]");
                storyCountCache.Insert(cacheKey, storyCount, 500);
            }

            return storyCount;
        }

        private static CacheManager<string, StoryCollection> GetStoryCollectionCache()
        {
            return CacheManager<string, StoryCollection>.GetInstance();
        }

        private static CacheManager<string, Story> GetStoryCache()
        {
            return CacheManager<string, Story>.GetInstance();
        }

        private static CacheManager<string, CommentCollection> GetCommentCollectionCache()
        {
            return CacheManager<string, CommentCollection>.GetInstance();
        }

        private static CacheManager<string, int?> GetCountCache()
        {
            return CacheManager<string, int?>.GetInstance();
        }

        public static int GetUpcomingStoryCount(Host host)
        {
            return 999; //TODO: GJ: implement
        }

        public static StoryCollection GetTaggedStories(string p, int p_2, int p_3, int p_4) {
            throw new Exception("The method or operation is not implemented.");
        }

        public static int GetTaggedStoryCount(string p, int p_2) {
            throw new Exception("The method or operation is not implemented.");
        }

        public static StoryCollection GetUserTaggedStories(string p, int p_2, int p_3, int p_4, int p_5) {
            throw new Exception("The method or operation is not implemented.");
        }

        public static int GetUserTaggedStoryCount(string p, int p_2, int p_3) {
            throw new Exception("The method or operation is not implemented.");
        }

        public static StoryCollection GetUserKickedStories(string p, int p_2, int p_3, int p_4) {
            throw new Exception("The method or operation is not implemented.");
        }

        public static int GetUserKickedStoriesCount(string p, int p_2) {
            throw new Exception("The method or operation is not implemented.");
        }

        public static StoryCollection GetCategoryStories(short p, bool p_2, int p_3, int p_4, int p_5) {
            throw new Exception("The method or operation is not implemented.");
        }

        public static int GetCategoryStoryCount(short p, bool p_2, int p_3) {
            throw new Exception("The method or operation is not implemented.");
        }
    }
}
