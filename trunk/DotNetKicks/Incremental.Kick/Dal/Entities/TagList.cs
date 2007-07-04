using System;
using System.Collections.Generic;
using System.Text;

namespace Incremental.Kick.Common.Entities {

    //TODO: GJ: sort this using the ReverseComparer
    public class TagList : List<Tag> {

        public int TotalTagUsageCount {
            get {
                int total = 0;
                foreach (Tag tag in this) {
                    total += tag.UsageCount;
                }

                return total;
            }
        }

        public int MinTagUsageCount {
            get {
                if (this.Count == 0)
                    return 1;
                else
                    return this[this.Count-1].UsageCount;
            }
        }

        public int MaxTagUsageCount {
            get {
                if (this.Count == 0)
                    return 1;
                else
                    return this[0].UsageCount;
            }
        }

        public int TagUsageCountDistributionStepCount {
            get {
                if (this.Count < 5)
                    return this.Count;
                else
                    return 5;
            }
        }

        public decimal TagUsageCountDistributionStepSize {
            get {
                decimal ff = (decimal)(this.MaxTagUsageCount - this.MinTagUsageCount) / this.TagUsageCountDistributionStepCount;

                if (ff == 0)
                    ff = 1;

                return ff;
            }
        }

        public decimal GetTagWeight(int tagUsageCount) {
            decimal dd = (decimal)0.05;
            decimal oneandten = (tagUsageCount / this.TagUsageCountDistributionStepSize); //this should be a number between 1 and 10
            return Math.Round(oneandten * dd + 1, 1);

        }


        public TagList GetTopTags(int tagCount) {
            if (tagCount > this.Count)
                tagCount = this.Count;

            TagList topTags = new TagList();
            for (int i = 0; i < tagCount; i++) {
                topTags.Add(this[i]);
            }

            return topTags;
        }

        public class UsageCountComparer : IComparer<Tag> {
            int IComparer<Tag>.Compare(Tag x, Tag y) {
                return y.UsageCount.CompareTo(x.UsageCount);
            }
        }

        public class AlphabeticalComparer : IComparer<Tag> {
            int IComparer<Tag>.Compare(Tag x, Tag y) {
                return x.TagName.CompareTo(y.TagName);
            }
        }
    }

    
}
