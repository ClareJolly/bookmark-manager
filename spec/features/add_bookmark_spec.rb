feature 'add bookmark' do
  scenario 'user adds a bookmark' do
    visit('/add-bookmark')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button 'submit'
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end
end
