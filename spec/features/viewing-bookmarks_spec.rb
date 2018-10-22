feature 'Feature - Viewing bookmarks' do

  scenario 'shows bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "https://www.google.co.uk"
    expect(page).to have_content "https://www.bbc.co.uk"
    expect(page).to have_content "https://www.youtube.com"
  end

end
