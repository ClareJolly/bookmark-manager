require 'pg'

feature 'Feature - Viewing bookmarks' do

  scenario 'shows bookmarks' do

    Bookmarks.create("https://www.google.co.uk", "google")
    Bookmarks.create("https://www.bbc.co.uk", "bbc")
    Bookmarks.create("https://www.youtube.com", "youtube")

    visit('/bookmarks')
    expect(page).to have_link('google', href: 'https://www.google.co.uk')
    expect(page).to have_link('bbc', href: 'https://www.bbc.co.uk')
    expect(page).to have_link('youtube', href: 'https://www.youtube.com')
  end

end
