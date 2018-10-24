require 'pg'
class DatabaseConnection

  class << self
    attr_reader :connection
  end

  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
  end

  # def self.connection
  #   @connection
  # end

  def self.query(sql)
    @connection.exec(sql)
  end
end
