# # lib/trie.rb

# class TrieNode
#     attr_accessor :children, :is_end_of_word
  
#     def initialize
#       @children = {}
#       @is_end_of_word = false
#     end
#   end
  
#   class SearchAnalytics
#     attr_accessor :root
  
#     def initialize
#       @root = TrieNode.new
#     end
  
#     def insert(query)
#       node = @root
#       query.split.each do |word|
#         node.children[word] ||= TrieNode.new
#         node = node.children[word]
#       end
#       node.is_end_of_word = true
#     end

#       def get_last_complete_query(query)
#         node = @root
#         last_complete_query = ''
      
#         query.split.each do |word|
#           node = node.children[word] if node.children.key?(word)
#           last_complete_query += "#{word} " if node&.is_end_of_word
#         end
#       last_complete_query
#     end
#   end
  


  
  