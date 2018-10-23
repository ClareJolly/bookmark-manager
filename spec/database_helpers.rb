require 'pg'

def persisted_data(id)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  results = connection.query("SELECT * FROM bookmarks WHERE id=#{id};")
end
