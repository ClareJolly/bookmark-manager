require 'bookmarks'
require 'database_helpers'

describe Bookmarks do

  it 'returns a list of bookmarks' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmarks.create("https://www.google.co.uk", "google")
    Bookmarks.create("https://www.bbc.co.uk", "bbc")
    Bookmarks.create("https://www.youtube.com", "youtube")
    bookmark_arr = Bookmarks.all
    expect(bookmark_arr.length).to eq 3
    expect(bookmark_arr.first.title).to eq 'google'
    expect(bookmark_arr.first.url).to eq 'https://www.google.co.uk'
  end
end

describe '.create' do
  it 'creates a new bookmark' do

    bookmarks = Bookmarks.create('http://www.testbookmark.com', 'Test Bookmark')
    persisted_data = persisted_data(id: bookmarks.id)
    expect(bookmarks).to be_a Bookmarks
    expect(bookmarks.id).to eq persisted_data.first['id']
    expect(bookmarks.title).to eq 'Test Bookmark'
    expect(bookmarks.url).to eq 'http://www.testbookmark.com'
  end
end

describe '.delete' do
  it 'deletes the given bookmark' do
    bookmark = Bookmarks.create('Makers', 'http://www.makersacademy.com')
    Bookmarks.delete(id: bookmark.id)
    expect(Bookmarks.all.length).to eq 0
  end
end

describe '.update' do
  it 'updates the bookmark with the given data' do
    bookmark = Bookmarks.create('http://www.makersacademy.com', 'Makers')
    updated_bookmark = Bookmarks.update(
      bookmark.id,
      'http://www.snakersacademy.com',
      'Snakers Academy'
    )

    expect(updated_bookmark).to be_a Bookmarks
    expect(updated_bookmark.id).to eq bookmark.id
    expect(updated_bookmark.title).to eq 'Snakers Academy'
    expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
  end
end

describe '.find' do
  it 'returns the requested bookmark object' do
    bookmark = Bookmarks.create('http://www.makersacademy.com', 'Makers')

    result = Bookmarks.find(bookmark.id)

    expect(result).to be_a Bookmarks
    expect(result.id).to eq bookmark.id
    expect(result.title).to eq 'Makers'
    expect(result.url).to eq 'http://www.makersacademy.com'
  end
end
