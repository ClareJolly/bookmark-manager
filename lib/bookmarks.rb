require 'pg'

class Bookmarks

  if ENV['ENVIRONMENT'] == 'test'
    @connection = PG.connect(dbname: 'bookmark_manager_test')
  else
    @connection = PG.connect(dbname: 'bookmark_manager')
  end

  def self.all
    bookmarks = @connection.exec('SELECT * FROM bookmarks;')
    bookmarks.map do |bookmark|
      Bookmarks.new(
        id: bookmark['id'],
        title: bookmark['title'],
        url: bookmark['url']
      )
    end
  end

  def self.create(url, title)

    sql = %{INSERT INTO bookmarks
      (url, title)
      VALUES
      ('#{url}', '#{title}')
      RETURNING id, title, url;}
    result = @connection.exec(sql)

    Bookmarks.new(id: result[0]['id'],
      title: result[0]['title'],
      url: result[0]['url'])
  end

  def self.delete(id:)
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'bookmark_manager_test')
    # else
    #   connection = PG.connect(dbname: 'bookmark_manager')
    # end
    @connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end
end
