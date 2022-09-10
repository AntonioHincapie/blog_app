require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users page #index' do
    before(:each) do
      get '/users'
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
      get '/users/1'
    end

    it 'Response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'Correct template was rendered' do
      expect(response).to render_template('show')
    end

    it 'The response body includes correct placeholder text' do
      expect(response.body).to include 'User'
    end
  end
end
