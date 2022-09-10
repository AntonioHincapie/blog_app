require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
  post = Post.create(author: first_user, Title: 'Title', Text: 'Text')

  before { first_user.save }
  before { post.save }

  it 'Title shold be present' do
    post.Title = nil
    expect(post).to_not be_valid
  end

  it 'Title shonldn`t be too long' do
    post.Title = 'T' * 251
    expect(post).to_not be_valid
  end

  it 'CommentsCounter should be greater than 0' do
    post.CommentsCounter = 0
    expect(post).to_not be_valid
  end

  it 'LikesCounter should be greater than 0' do
    post.LikesCounter = 0
    expect(post).to_not be_valid
  end
end
