require 'bookmarks'

describe Bookmarks do
  # subject(:bookmarks) { described_class.new }

  it 'returns a list of bookmarks' do
    bookmarks = Bookmarks.all
    expect(bookmarks).to include 'https://www.google.co.uk'
    expect(bookmarks).to include 'https://www.bbc.co.uk'
    expect(bookmarks).to include 'https://www.youtube.com'
  end
end
