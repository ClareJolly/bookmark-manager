require 'pg'

class Bookmarks

  if ENV['ENVIRONMENT'] == 'test'
    @connection = PG.connect(dbname: 'bookmark_manager_test')
  else
    @connection = PG.connect(dbname: 'bookmark_manager')
  end

  def self.find(id)
    result = @connection.exec("SELECT * FROM bookmarks WHERE id = #{id};")
    Bookmarks.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  def self.all
    bookmarks = @connection.exec('SELECT * FROM bookmarks;')
    bookmarks.map do |bookmark|
      Bookmarks.new(
        bookmark['id'],
        bookmark['title'],
        bookmark['url']
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

    Bookmarks.new(result[0]['id'],
      result[0]['title'],
      result[0]['url'])
  end

  def self.delete(id:)
    # if ENV['ENVIRONMENT'] == 'test'
    #   connection = PG.connect(dbname: 'bookmark_manager_test')
    # else
    #   connection = PG.connect(dbname: 'bookmark_manager')
    # end
    @connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id, url, title)
    sql = %{UPDATE bookmarks SET
      url = '#{url}',
      title = '#{title}'
      WHERE id = #{id} RETURNING id, url, title;}
    
    result = @connection.exec(sql)
    Bookmarks.new(result[0]['id'], result[0]['title'], result[0]['url'])
  end

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end
end
