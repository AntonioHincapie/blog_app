require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.new(name: 'Name', photo: 'Photo', bio: 'Bio')
    @post = Post.new(author: @user, title: 'Title', text: 'Post text')
    @comment = Comment.new(author: @user, post: @post, text: 'Comment text')

    @user.save
    @post.save
    @comment.save
  end

  context 'Testing the Comment' do
    it 'Should update comments counter' do
      expect(@post.comments_counter).to eq(1)
    end
  end
end
