require 'rails_helper'

RSpec.describe 'Posts content', type: :system do
  it 'Check photo' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_selector('img.user-photo')
  end

  it 'Check author' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Lilly')
  end

  it 'Check post counter' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Number of post: 4')
  end

  it 'Check the post title' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('My first Post')
  end

  it 'Check the post text' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('This is my')
  end

  it 'Check comments text' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Antonio: Hi Lilly!')
    expect(page).to have_content('Tom: Hello Lilly!')
  end

  it 'Check comments counter' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Comments: 2')
  end

  it 'Check likes counter' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Likes: 0')
  end

  it 'Check section for pagination' do
    visit('http://localhost:3000/users/1/posts')
    expect(page).to have_content('Pagination')
  end

  scenario 'When I click on a post, it redirects to that post\'s show page' do
    visit('http://localhost:3000/users/1/posts')
    click_link('My first Post')
    expect(page).to have_content('My first Post Lilly')
  end
end
