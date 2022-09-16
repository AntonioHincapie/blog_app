require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Get page post #index' do
    before(:each) do
      get '/users/64/posts'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template('index')
    end

    it 'renders and get the placeholder text' do
      expect(response.body).to include 'Here'
    end
  end

  describe 'GET user page #show' do
    before(:each) do
      get '/users/64/posts/90'
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template('show')
    end

    it 'renders and get the placeholder text' do
      expect(response.body).to include 'Here'
    end
  end
end
