# require 'pg'
require 'database_connection'

def persisted_data(id)
  # connection = PG.connect(dbname: 'bookmark_manager_test')
  # results = 
  DatabaseConnection.query("SELECT * FROM bookmarks WHERE id=#{id};")
end
