require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from EE.UU.')
    @post = Post.new(author: @user, title: 'Title', text: 'Text')
    Comment.create(author: @user, post: @post, text: 'Text1')
    Comment.create(author: @user, post: @post, text: 'Text2')

    @user.save
    @post.save
  end

  context 'Testing the Posts class' do
    it 'Should contain an author' do
      expect(@post.author).to eq(@user)
    end

    it 'Should contain a title' do
      expect(@post.title).to eq('Title')
    end

    it 'Should contain a text' do
      expect(@post.text).to eq('Text')
    end
  end

  context 'Testing Posts methods' do
    it 'Should return the comments_counter' do
      expect(@post.most_recent_comments.length).to eq(2)
    end

    it 'Should return the post countersr' do
      expect(@user.post_counter).to eq(1)
    end
  end

  context 'Testing Validations' do
    it 'Should validate that title exist' do
      @post.title = nil
      expect(@post).not_to be_valid
    end

    it 'should validate that title is less than 250 characters' do
      @post.title = 'T' * 251
      expect(@post).not_to be_valid
    end
  end
end
