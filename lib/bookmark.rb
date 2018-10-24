require 'database_connection'
require 'uri'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookmarks")
    result.map do |bookmark|
# p result
      Bookmark.new(
      # id: bookmark['id'],
      url: bookmark['url'],
      title: bookmark['title'],
      # url: bookmark['url']
      id: bookmark['id']
      )
    end
  end

  def self.create(url:, title:)
    # p url
    # return false unless !is_url?(url).nil?
    return false unless valid_url?(url)
    # p "test"
    sql = %{INSERT INTO bookmarks
      (url, title) VALUES ('#{url}', '#{title}') RETURNING id, title, url;}
    result = DatabaseConnection.query(sql)
    Bookmark.new(id: result[0]['id'],
      title: result[0]['title'],
      url: result[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)

    sql = %{UPDATE bookmarks SET url = '#{url}', title = '#{title}'
      WHERE id = #{id} RETURNING id, url, title;}
    result = DatabaseConnection.query(sql)
    Bookmark.new(id: result[0]['id'],
      title: result[0]['title'],
      url: result[0]['url'])
  end

  def self.find(id:)
    sql = %{SELECT * FROM bookmarks WHERE id = #{id};}
    result = DatabaseConnection.query(sql)

    Bookmark.new(
      id: result[0]['id'],
      title: result[0]['title'],
      url: result[0]['url'])
  end

  private_class_method
  def self.valid_url?(url)
    # p url
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
