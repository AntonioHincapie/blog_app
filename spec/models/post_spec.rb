require 'rails_helper'

RSpec.describe Post do
  let(:user) { User.new(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from EE.UU.') }
  let(:post) { Post.new(author: user, title: 'title', text: 'text') }

  before { post.save }

  context 'When testing the Posts class' do
    it 'should contain an author' do
      expect(post.author).to eq(user)
    end

    it 'should contain a title' do
      expect(post.title).to eq('title')
    end

    it 'should contain a text' do
      expect(post.text).to eq('text')
    end
  end

  context 'When testing the Posts methods' do
    it 'should return the lenght of comments in comments_counter' do
      expect(post.most_recent_comments.length).to eq(0)
    end

    it 'should update post countersr' do
      post.save
      expect(user.post_counter).to eq(1)
    end
  end

  context 'When testing Validations' do
    it 'should validate that title exist' do
      post.title = nil
      expect(post).not_to be_valid
    end

    it 'should validate that title is less than 250 characters lenght' do
      post.title = 'a' * 251
      expect(post).not_to be_valid
    end
  end
end
