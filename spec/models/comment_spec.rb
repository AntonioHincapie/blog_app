require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'AuthorId should be present' do
    subject.AuthorId = nil
    expect(subject).to_not be_valid
  end

  it 'PostId should be present' do
    subject.PostId = nil
    expect(subject).to_not be_valid
  end
end
