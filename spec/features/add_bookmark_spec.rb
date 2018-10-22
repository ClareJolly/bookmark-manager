feature 'add bookmark' do
  scenario 'user adds a bookmark' do
    visit('/add-bookmark')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button 'submit'
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/add-bookmark')
    fill_in('title', with: 'not a real bookmark')
    fill_in('url', with: 'not a real bookmark')
    click_button('submit')
    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end
