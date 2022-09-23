require 'rails_helper'

RSpec.describe 'Post content', type: :system do
  it 'Check post\'s title' do
    visit('http://localhost:3000/users/1/posts/1')
    expect(page).to have_content('My first Post')
  end
  
  it 'Check author' do
    visit('http://localhost:3000/users/1/posts/1')
    expect(page).to have_content('Lilly')
  end

  it 'Check comments counter' do
    visit('http://localhost:3000/users/1/posts/1')
    expect(page).to have_content('Comments: 2')
  end

  it 'Check likes counter' do
    visit('http://localhost:3000/users/1/posts/1')
    expect(page).to have_content('Likes: 0')
  end

  it 'Check comment author' do
    visit('http://localhost:3000/users/1/posts/1')
    expect(page).to have_content('Antonio:')
    expect(page).to have_content('Tom:')
  end

  it 'Check comment text' do
    visit('http://localhost:3000/users/1/posts/1')
    expect(page).to have_content('Hi Lilly')
    expect(page).to have_content('Hello Lilly!')
  end
end