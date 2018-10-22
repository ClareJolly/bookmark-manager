require 'bookmarks'

describe Bookmarks do

  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.co.uk');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.bbc.co.uk');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.youtube.com');")
    bookmarks = Bookmarks.all
    expect(bookmarks).to include 'https://www.google.co.uk'
    expect(bookmarks).to include 'https://www.bbc.co.uk'
    expect(bookmarks).to include 'https://www.youtube.com'
  end
end

describe '.create' do
  it 'creates a new bookmark' do
    Bookmarks.create('http://www.testbookmark.com')

    expect(Bookmarks.all).to include 'http://www.testbookmark.com'
  end
end
