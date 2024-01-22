# require 'rails-controller-testing'
# require 'rails_helper'

# RSpec.describe SearchesController, type: :controller do
#   describe 'GET #index' do
#     it 'creates a new search and removes similar queries' do
#       allow_any_instance_of(SearchAnalytics).to receive(:get_last_complete_query).and_return(nil)
#       allow(controller).to receive(:is_similar_query?).and_return(false)

#       expect {
#         get :index, params: { query: 'test query' }
#       }.to change(Search, :count).by(1)

#       expect(response).to have_http_status(:success)
#     end

#     it 'does not create a new search if the query is not new and more complete' do
#       allow_any_instance_of(SearchAnalytics).to receive(:get_last_complete_query).and_return('existing query')
#       allow(controller).to receive(:is_similar_query?).and_return(true)

#       expect {
#         get :index, params: { query: 'existing query' }
#       }.to_not change(Search, :count)

#       expect(response).to have_http_status(:success)
#     end

#     it 'fetches recent searches for the current user' do
#       user_ip = '127.0.0.1'
#       allow(controller.request).to receive(:headers).and_return({ 'X-Forwarded-For' => user_ip })
#       allow(controller.request).to receive(:remote_ip).and_return(user_ip)

#       get :index, params: { query: 'test query' }

#       expect(assigns(:searches)).to be_a(ActiveRecord::Relation)
#       expect(response).to have_http_status(:success)
#     end
#   end
# end

# spec/controllers/searches_controller_spec.rb

require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe SearchesController, type: :controller do
  describe 'GET #index' do
    it 'creates a new search and removes similar queries when the query is new and more complete' do
      allow_any_instance_of(SearchAnalytics).to receive(:get_last_complete_query).and_return(nil)
      allow(controller).to receive(:is_similar_query?).and_return(false)

      expect {
        get :index, params: { query: 'What is a good car' }
      }.to change { Search.where(query: 'What is a good car').count }.by(1)

      expect(response).to have_http_status(:success)
    end

    it 'does not create a new search if the query is not new and more complete' do
      allow_any_instance_of(SearchAnalytics).to receive(:get_last_complete_query).and_return('What is a good car')
      allow(controller).to receive(:is_similar_query?).and_return(true)

      expect {
        get :index, params: { query: 'What is' }
      }.to_not change(Search, :count)

      expect(response).to have_http_status(:success)
    end

    it 'fetches recent searches for the current user' do
      user_ip = '127.0.0.1'
      allow(controller.request).to receive(:headers).and_return({ 'X-Forwarded-For' => user_ip })
      allow(controller.request).to receive(:remote_ip).and_return(user_ip)

      get :index, params: { query: 'What is a good car' }

      expect(assigns(:searches)).to be_a(ActiveRecord::Relation)
      expect(response).to have_http_status(:success)
    end

    it 'does not record incomplete searches' do
      allow_any_instance_of(SearchAnalytics).to receive(:get_last_complete_query).and_return('What is a good car')
      allow(controller).to receive(:is_similar_query?).and_return(true)

      expect {
        get :index, params: { query: 'What is' }
      }.to_not change(Search, :count)

      expect(response).to have_http_status(:success)
    end
  end
end
