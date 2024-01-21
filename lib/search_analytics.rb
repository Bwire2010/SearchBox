# lib/search_analytics.rb
# require 'set'

# class SearchAnalytics
#   def initialize
#     @recorded_queries = Set.new
#   end

#   def get_last_complete_query(query)
#     current_length = query.split.size

#     if current_length > 1 && !@recorded_queries.include?(query)
#       @recorded_queries.add(query)
#       return query.strip
#     end

#     @last_complete_query ||= ''
#     if @last_complete_query.split.size < current_length
#       @last_complete_query = query
#     end

#     @last_complete_query.strip
#   end
# end

# lib/search_analytics.rb

# require 'set'

# class SearchAnalytics
#   def initialize
#     @recorded_queries = Set.new
#   end

#   def get_last_complete_query(query)
#     query_words = query.split
#     current_length = query_words.size

#     # Check if the query is complete and not previously recorded
#     if current_length > 1 && !@recorded_queries.include?(query)
#       @recorded_queries.add(query)
#       return query.strip
#     end

#     # If the current query is longer than the last recorded one, update it
#     @last_complete_query ||= ''
#     if @last_complete_query.split.size < current_length
#       @last_complete_query = query
#     end

#     @last_complete_query.strip
#   end
# end

# lib/search_analytics.rb

require 'set'

class SearchAnalytics
  def initialize
    @recorded_queries = Set.new
  end

  def get_last_complete_query(query)
    node = @root
    last_complete_query = ''
  
    query.split.each do |word|
      return nil unless node&.children
      node = node.children[word] if node.children.key?(word)
      last_complete_query += "#{word} " if node&.is_end_of_word
    end
  
    # Check if the last complete query is the same as the input query
    last_complete_query.strip == query.strip ? last_complete_query : nil
  end
  

  private

  def similar_query_exists?(query)
    # Check if a similar complete query is already in the recorded queries
    @recorded_queries.any? { |recorded_query| recorded_query.include?(query) }
  end
end

