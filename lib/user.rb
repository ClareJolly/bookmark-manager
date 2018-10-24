require 'bcrypt'
require 'database_connection'

class User
  def self.create(email:, password:)
    # encrypt the plantext password
    encrypted_password = BCrypt::Password.create(password)

    # insert the encrypted password into the database,
    # instead of the plaintext one
    sql = %{INSERT INTO users (email, password)
      VALUES('#{email}', '#{encrypted_password}') RETURNING id, email}
    result = DatabaseConnection.query(sql)

    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.find(id:)
    # p id
    # p id[id]
    # p id[:id]
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(
      id: result[0]['id'],
      email: result[0]['email']
    )
  end

  def self.authenticate(email:, password:)
    sql = %{SELECT * FROM users WHERE email = '#{email}'}
    result = DatabaseConnection.query(sql)
    User.new(id: result[0]['id'], email: result[0]['email'])
  end
end
