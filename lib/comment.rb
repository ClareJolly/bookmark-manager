require_relative './database_connection'
class Comment
  def self.create(bookmark_id:, text:)
    sql = %{INSERT INTO comments
      (bookmark_id, text) VALUES ('#{bookmark_id}','#{text}')
      RETURNING id, text, bookmark_id;}
    result = DatabaseConnection.query(sql)
    Comment.new(
      id: result[0]['id'],
      text: result[0]['text'],
      bookmark_id: result[0]['bookmark_id']
    )
  end

  def self.where(bookmark_id:)
    sql = %{SELECT * FROM comments WHERE bookmark_id = #{bookmark_id};}
    result = DatabaseConnection.query(sql)
    result.map do |comment|
      Comment.new(
        id: comment['id'],
        text: comment['text'],
        bookmark_id: comment['bookmark_id']
      )
    end
  end

  attr_reader :id, :text, :bookmark_id

  def initialize(id:, text:, bookmark_id:)
    @id = id
    @text = text
    @bookmark_id = bookmark_id
  end
end
