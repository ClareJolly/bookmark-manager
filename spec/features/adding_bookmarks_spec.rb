feature 'Adding bookmarks' do
  scenario 'Can add a URL to bookmarks' do
    visit('/')
    click_button('View Bookmarks')
    fill_in :bookmark, with: 'http://www.facebook.com'
    fill_in :title, with: 'facebook'
    click_button('Submit')
    expect(page).to have_link('facebook', href: 'http://www.facebook.com')
  end
end
