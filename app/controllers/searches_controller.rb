require 'text'
class SearchesController < ApplicationController
  include ActiveRecord::Sanitization

  before_action :initialize_search_analytics

  def index
    query = params[:query]
    search_analytics = SearchAnalytics.new

    if query.present?
      last_complete_query = search_analytics.get_last_complete_query(query)

      if last_complete_query.nil? || !is_similar_query?(query, last_complete_query)
        # Save the query only if it's a new and more complete query
        user_ip = request.headers['X-Forwarded-For'] || request.remote_ip
        Search.create(query: query, user_ip: user_ip)

        # Remove existing similar queries with fewer words
        remove_similar_queries(query)
      end
    end

    # Fetch recent searches for the current user based on user_ip
    user_ip = request.headers['X-Forwarded-For'] || request.remote_ip
    @searches = Search.where(user_ip: user_ip).order(created_at: :desc).limit(20)

    render json: @searches.map { |search| { query: search.query, user_ip: search.user_ip } }
  end

  private

  def initialize_search_analytics
    @search_analytics = SearchAnalytics.new
  end

  def is_similar_query?(query, last_query)
    # Set a similarity threshold based on the requirements
    similarity_threshold = 0.8

    # Check if the queries are similar based on Jaro-Winkler similarity
    similarity = Text::Levenshtein.jaro_winkler(query.downcase, last_query.downcase)
    
    similarity >= similarity_threshold
  end

  def remove_similar_queries(query)
    # Find and delete queries where the existing query is a prefix of the new query
    # but has fewer words
    Search.where("LOWER(?) ILIKE CONCAT(LOWER(query), '%')", query).where.not(query: query).delete_all
  end
end






