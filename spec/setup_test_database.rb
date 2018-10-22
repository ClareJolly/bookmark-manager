require 'pg'

def setup_test_database
  p 'setting up test databases'
  connection = PG.connect(dbname: "bookmark_manager_test")

  connection.exec("TRUNCATE bookmarks;")
end
