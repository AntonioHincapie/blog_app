require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from EE.UU.')

    @user.save
  end

  context 'Testing the User class' do
    it 'Should contain a name' do
      expect(@user.name).to eq('John')
    end

    it 'Should contain a photo' do
      expect(@user.photo).to eq('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'Should contain a bio' do
      expect(@user.bio).to eq('Teacher from EE.UU.')
    end
  end

  context 'When testing User methods' do
    posts = []

    before do
      posts << (1..5).each { Post.create(author: @user, title: 'title', text: 'text') }
    end

    it 'Should return most recent comments' do
      expect(@user.recent_posts.count).to eq(3)
    end

    it 'Should return the lenght of posts_counter' do
      expect(@user.post_counter).to eq(5)
    end
  end

  context 'When testing Validations' do
    it 'Should validate that name exist' do
      @user.name = nil
      expect(@user).not_to be_valid
    end

    it 'Should posts_counter must be greater than or equal to zero.' do
      @user.post_counter = -3
      expect(@user).not_to be_valid
    end
  end
end
