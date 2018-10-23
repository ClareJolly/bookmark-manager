feature 'Deleting a bookmark' do
  scenario 'A user can delete a bookmark' do
    Bookmarks.create('http://www.makersacademy.com', 'Makers A')
    visit('/bookmarks')
    expect(page).to have_content('Makers A')
    first('.bookmark').click_button 'Delete'
    # p current_path
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
