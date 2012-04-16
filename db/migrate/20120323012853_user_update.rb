class UserUpdate < ActiveRecord::Migration
  def self.up
    sql = "ALTER TABLE users ADD COLUMN encrypted_password varchar(255)"
    execute sql
    sql = "ALTER TABLE users ADD COLUMN salt varchar(255)"
    execute sql
    sql = "ALTER TABLE users ADD COLUMN login_at date"
    execute sql
  end

  def self.down
  end
end
