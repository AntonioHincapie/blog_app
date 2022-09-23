require 'rails_helper'

RSpec.describe 'Root page', type: :system do
  it 'Shows the static text' do
    visit('http://localhost:3000/users')
    expect(page).to have_selector('div.user-info')
  end

  it 'Check photo' do
    visit('http://localhost:3000/users')
    expect(page).to have_selector('img.user-photo')
  end

  it 'Check post counter' do
    visit('http://localhost:3000/users')
    expect(page).to have_content('Number of post: 4')
  end

  scenario 'Go to user' do
    visit('http://localhost:3000/users')
    click_link('Lilly')
    expect(page).to have_content('Teacher from Poland')
  end
end
