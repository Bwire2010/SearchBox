class SearchesController < ApplicationController
  before_action :initialize_searches

  # def index
  #   query = params[:query]
  #   if query.present?
  #     user_ip = request.headers['X-Forwarded-For'] || request.remote_ip
  #     Search.create(query: query, user_ip: user_ip) if complete_and_longest_search?(query)
  #   end

  #   @searches = Search.order(created_at: :desc).limit(10)
  #   render json: @searches
  # end
 # Add debugging statements

 def index
  query = params[:query]
  if query.present?
    user_ip = request.headers['X-Forwarded-For'] || request.remote_ip
    if complete_and_longest_search?(query)
      Search.create(query: query, user_ip: user_ip)
    else
      Rails.logger.debug("Not saving search: #{query}")
    end
  end

  @searches = Search.order(created_at: :desc).limit(10)
  render json: @searches
end





  def create
    query = params[:query]
    user_ip = request.headers['X-Forwarded-For'] || request.remote_ip

    if query.present?
      Search.create(query: query, user_ip: user_ip) if complete_and_longest_search?(query)
      render json: { status: 'success', message: 'Search recorded successfully' }, status: :created
    else
      render json: { status: 'error', message: 'Empty search query' }, status: :unprocessable_entity
    end
  end

  private

  def initialize_searches
    @search_queries = Search.order(created_at: :desc).limit(10).pluck(:query)
  end

  def complete_and_longest_search?(query)
    existing_longer = @search_queries.any? { |existing_query| query.downcase.include?(existing_query.downcase) && query.length > existing_query.length }

    if existing_longer
      true
    else
      @search_queries.reject! { |existing_query| query.downcase.include?(existing_query.downcase) && query.length > existing_query.length }
      @search_queries << query
      false
    end
  end
end
