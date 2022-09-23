require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Get page post #index' do
    before(:all) do
      @user = User.create(name: 'Antonio', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Colombia')
      @post = Post.create(author: @user, title: 'My Post', text: 'This post')
      get "/users/#{@user.id}/posts"
    end

    it 'Is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'Renders and get the placeholder text' do
      expect(response.body).to include 'Antonio'
    end
  end

  describe 'GET user page #show' do
    before(:all) do
      @user = User.create(name: 'Antonio', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Colombia')
      @post = Post.create(author: @user, title: 'My Post', text: 'This post')
      get "/users/#{@user.id}/posts/#{@post.id}"
    end

    it 'Is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders and get the placeholder text' do
      expect(response.body).to include 'Antonio'
    end
  end
end
