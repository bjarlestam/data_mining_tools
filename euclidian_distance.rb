##source: https://www.bionicspirit.com/blog/2012/01/16/cosine-similarity-euclidean-distance.html

# Returns the Euclidean distance between 2 points
#
# Params:
#  - a, b: list of coordinates (float or integer)
#
def euclidean_distance(a, b)
  sq = a.zip(b).map{|a,b| (a - b) ** 2}
  Math.sqrt(sq.inject(0) {|s,c| s + c})
end

# Returns the associated point of our tags_set, relative to our
# tags_space.
#
# Params:
#  - tags_set: list of tags
#  - tags_space: _ordered_ list of tags
def tags_to_point(tags_set, tags_space)
  tags_space.map{|c| tags_set.member?(c) ? 1 : 0}
end

# Returns other_items sorted by similarity to this_item
# (most relevant are first in the returned list)
#
# Params:
#  - items: list of hashes that have [:tags]
#  - by_these_tags: list of tags to compare with
def sort_by_similarity(items, by_these_tags)
  tags_space = by_these_tags + items.map{|x| x[:tags]}
  tags_space.flatten!.sort!.uniq!

  this_point = tags_to_point(by_these_tags, tags_space)
  other_points = items.map{|i|
    [i, tags_to_point(i[:tags], tags_space)]
  }

  similarities = other_points.map{|item, that_point|
    [item, euclidean_distance(this_point, that_point)]
  }

  sorted = similarities.sort {|a,b| a[1] <=> b[1]}
  return sorted.map{|point,s| point}
end


# SAMPLE DATA

all_articles = [
  {
   :article => "Data Mining: Finding Similar Items",
   :tags => ["Algorithms", "Programming", "Mining",
     "Python", "Ruby"]
  },
  {
   :article => "Blogging Platform for Hackers",
   :tags => ["Publishing", "Server", "Cloud", "Heroku",
     "Jekyll", "GAE"]
  },
  {
   :article => "UX Tip: Don't Hurt Me On Sign-Up",
   :tags => ["Web", "Design", "UX"]
  },
  {
   :article => "Crawling the Android Marketplace",
   :tags => ["Python", "Android", "Mining",
     "Web", "API"]
  }
]

# SORTING these articles by similarity with an article
# tagged with Publishing + Web + API
#
#
# The list is returned in this order:
#
# 1. article: Crawling the Android Marketplace
#    similarity: 2.0
#
# 2. article: "UX Tip: Don't Hurt Me On Sign-Up"
#    similarity: 2.0
#
# 3. article: Blogging Platform for Hackers
#    similarity: 2.645751
#
# 4. article: "Data Mining: Finding Similar Items"
#    similarity: 2.828427
#

sorted = sort_by_similarity(
    all_articles, ['Publishing', 'Web', 'API'])

require 'yaml'
puts YAML.dump(sorted)
