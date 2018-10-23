require 'pg'

feature 'Viewing bookmarks' do
  scenario 'visiting the main page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'view bookmarks button leads to another page' do
    visit('/')
    click_button('View Bookmarks')
    expect(page).to have_content 'Favourite Websites'
  end

  scenario 'shows bookmarks on webpage' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "makers")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "destroy all software")
    Bookmark.create(url: "http://www.google.com", title: "google")
    visit('/bookmarks')

    expect(page).to have_link('makers', href: 'http://www.makersacademy.com')
    expect(page).to have_link('destroy all software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('google', href: 'http://www.google.com')
  end

end
