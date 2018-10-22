require 'pg'

feature 'Feature - Viewing bookmarks' do

  scenario 'shows bookmarks' do

    Bookmarks.create(url: "https://www.google.co.uk")
    Bookmarks.create(url: "https://www.bbc.co.uk")
    Bookmarks.create(url: "https://www.youtube.com")

    # connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.co.uk');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.bbc.co.uk');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.youtube.com');")

    visit('/bookmarks')
    expect(page).to have_content "https://www.google.co.uk"
    expect(page).to have_content "https://www.bbc.co.uk"
    expect(page).to have_content "https://www.youtube.com"
  end

end
