require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Get page post #index' do
    before(:each) do
      get '/users/5/posts'
    end

    it 'Response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'Correct template was rendered' do
      expect(response).to render_template('index')
    end

    it 'The response body includes correct placeholder text' do
      expect(response.body).to include 'List'
    end
  end

  describe 'GET user page #show' do
    before(:each) do
      get '/users/6/posts/5'
    end

    it 'Response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'Correct template was rendered' do
      expect(response).to render_template('show')
    end

    it 'The response body includes correct placeholder text' do
      expect(response.body).to include 'Post'
    end
  end
end
