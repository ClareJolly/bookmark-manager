feature 'Adding bookmarks' do
  scenario 'Can add a URL to bookmarks' do
    visit('/')
    click_button('View Bookmarks')
    fill_in :bookmark, with: 'http://www.facebook.com'
    fill_in :title, with: 'facebook'
    click_button('Submit')
    # p current_path
    expect(page).to have_link('facebook', href: 'http://www.facebook.com')
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/')
    click_button('View Bookmarks')
    fill_in('bookmark', with: 'not a real bookmark')
    click_button('Submit')

    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end
