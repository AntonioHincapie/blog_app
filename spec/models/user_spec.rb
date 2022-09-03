require 'rails_helper'

RSpec.describe User, type: :model do
  first_user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')

  before { first_user.save }

  it 'Title should be present' do
    first_user.Name = nil
    expect(first_user).to_not be_valid
  end

  it 'PostCounter should be greater than 0' do
    first_user.PostCounter = 0
    expect(first_user).to_not be_valid
  end
end