require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users page #index' do
    before(:all) do
      get '/users'
    end

    it 'Is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders and get the placeholder text' do
      expect(response.body).to include 'new post'
    end
  end

  describe 'GET user page #show' do
    before(:all) do
      @user = User.create(name: 'Antonio', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Colombia')
      get "/users/#{@user.id}"
    end

    it 'Is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders and get the placeholder text' do
      expect(response.body).to include 'Antonio'
    end
  end
end
