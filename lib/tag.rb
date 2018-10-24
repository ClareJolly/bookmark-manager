require_relative './database_connection'
class Tag

  def self.create(content:)
    sql = %{INSERT INTO tags (content)
      VALUES('#{content}') RETURNING id, content;}
    result = DatabaseConnection.query(sql)
    Tag.new(id: result[0]['id'], content: result[0]['content'])
  end

  def self.where(bookmark_id:)
    sql = %{SELECT id, content FROM bookmarks_tags
      INNER JOIN tags ON tags.id = bookmarks_tags.tag_id
      WHERE bookmarks_tags.bookmark_id = '#{bookmark_id}';}
    result = DatabaseConnection.query(sql)
    result.map do |tag|
      Tag.new(id: tag['id'], content: tag['content'])
    end
  end

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end

end
