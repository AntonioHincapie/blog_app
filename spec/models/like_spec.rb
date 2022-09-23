require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @author = User.create(name: 'name', photo: 'photo', bio: 'bio')
    @post = Post.create(author: @author, title: 'title', text: 'post text')
    @like = Like.create(author: @author, post: @post)
  end

  context 'Testing the Like class' do
    it 'Should update likes counter' do
      expect(@post.likes_counter).to eq(1)
    end
  end
end
