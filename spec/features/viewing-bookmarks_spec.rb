require 'pg'

feature 'Feature - Viewing bookmarks' do

  scenario 'shows bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.co.uk');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.bbc.co.uk');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.youtube.com');")
    
    visit('/bookmarks')
    expect(page).to have_content "https://www.google.co.uk"
    expect(page).to have_content "https://www.bbc.co.uk"
    expect(page).to have_content "https://www.youtube.com"
  end

end
