require 'database_connection'
require 'uri'
require_relative './comment'
require_relative './tag'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def comments(comment_class = Comment)
    comment_class.where(bookmark_id: id)
  end

  def self.all
    bookmarks = DatabaseConnection.query('SELECT * FROM bookmarks;')
    bookmarks.map do |bookmark|
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

  def self.where(tag_id:)
    sql = %{SELECT id, url, title FROM bookmarks_tags
      INNER JOIN bookmarks ON bookmarks.id = bookmarks_tags.bookmark_id
      WHERE tag_id = #{tag_id};}
    result = DatabaseConnection.query(sql)
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'],
        title: bookmark['title'],
        url: bookmark['url'])
    end
  end

  def tags(tag_class = Tag)
    tag_class.where(bookmark_id: id)
  end

  private_class_method
  def self.valid_url?(url)
    # p url
    url =~ URI::DEFAULT_PARSER.regexp[:ABS_URI]
  end

end
