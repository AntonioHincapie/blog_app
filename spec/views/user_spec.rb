require 'rails_helper'

RSpec.describe 'User content', type: :system do
  it 'Check photo' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_selector('img.user-photo')
  end

  it 'Check author' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('Lilly')
  end

  it 'Check post counter' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('Number of post: 4')
  end

  it 'Check bio' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('Teacher from Poland.')
  end

  it 'Check posts text' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('This is my second post')
    expect(page).to have_content('This is my third post')
    expect(page).to have_content('This is my fourth post')
  end

  it 'Check see all post button' do
    visit('http://localhost:3000/users/1')
    expect(page).to have_content('See all posts')
  end

  scenario 'Go to user post' do
    visit('http://localhost:3000/users/1')
    click_link('My second Post')
    expect(page).to have_content('My second Post')
  end

  scenario 'Go to posts' do
    visit('http://localhost:3000/users/1')
    click_link('See all posts')
    expect(page).to have_content('My fourth post')
    expect(page).to have_content('My third Post')
    expect(page).to have_content('My second Post')
    expect(page).to have_content('My first Post')
  end
end
