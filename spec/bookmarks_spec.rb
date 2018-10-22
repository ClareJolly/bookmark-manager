require 'bookmarks'

describe Bookmarks do
  # subject(:bookmarks) { described_class.new }

  it 'returns array of bookmarks' do
    bookmarks = Bookmarks.all
    expect(bookmarks).to eq ['https://www.google.com', 'https://www.bbc.co.uk']
  end
end
