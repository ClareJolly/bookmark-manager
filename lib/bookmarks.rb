require 'pg'

class Bookmarks

  if ENV['ENVIRONMENT'] == 'test'
    @connection = PG.connect(dbname: 'bookmark_manager_test')
  else
    @connection = PG.connect(dbname: 'bookmark_manager')
  end

  def self.all
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(bookmark)
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'bookmark_manager_test')
    # else
    #   connection = PG.connect(dbname: 'bookmark_manager')
    # end
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{bookmark}')")
  end
end
