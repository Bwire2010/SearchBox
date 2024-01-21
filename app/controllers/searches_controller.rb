# require 'trie'

# class SearchesController < ApplicationController
#   before_action :initialize_search_analytics

#   def index
#     query = params[:query]
#     if query.present?
#       user_ip = request.headers['X-Forwarded-For'] || request.remote_ip
#       Search.create(query: query, user_ip: user_ip)
#     end

#     @searches = Search.order(created_at: :desc).limit(20)
#     render json: @searches
#   end


#   def create
#     query = params[:query]
#     user_ip = request.headers['X-Forwarded-For'] || request.remote_ip

#     if query.present?
#       last_complete_query = @search_analytics.get_last_complete_query(query)

#       if last_complete_query.present?
#         Search.create(query: last_complete_query, user_ip: user_ip)
#         render json: { status: 'success', message: 'Search recorded successfully' }, status: :created
#       else
#         render json: { status: 'error', message: 'Incomplete search query' }, status: :unprocessable_entity
#       end
#     else
#       render json: { status: 'error', message: 'Empty search query' }, status: :unprocessable_entity
#     end
#   end

#   private

#   def initialize_search_analytics
#     @search_analytics = SearchAnalytics.new
#   end
# end

# app/controllers/searches_controller.rb

class SearchesController < ApplicationController
  before_action :initialize_search_analytics

  # def index
  #   query = params[:query]
  #   if query.present?
  #     user_ip = request.headers['X-Forwarded-For'] || request.remote_ip
  #     last_complete_query = @search_analytics.get_last_complete_query(query)

  #     if last_complete_query.present?
  #       Search.create(query: last_complete_query, user_ip: user_ip)
  #     else
  #       Rails.logger.debug("Not saving search: #{query}")
  #     end
  #   end

  #   @searches = Search.order(created_at: :desc).limit(20)
  #   render json: @searches
  # end

  def index
    query = params[:query]
    search_analytics = SearchAnalytics.new

    if query.present?
      last_complete_query = search_analytics.get_last_complete_query(query)

      if last_complete_query.nil? || last_complete_query.strip != query.strip
        # Save the query only if it's a new and complete query
        Search.create(query: query, user_ip: request.remote_ip)
      end
    end

    # Fetch recent searches based on creation timestamp
    @searches = Search.order(created_at: :desc).limit(20)

    render json: @searches
  end
    
  private

  def initialize_search_analytics
    @search_analytics = SearchAnalytics.new
  end
end






