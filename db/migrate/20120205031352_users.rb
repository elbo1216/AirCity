class Users < ActiveRecord::Migration
  def self.up
    sql = "CREATE TABLE users (
             id         integer not null auto_increment primary key,
             first_name varchar(255) not null,
             last_name  varchar(255) not null,
             start_date date not null,
             created_at timestamp default '0000-00-00 00:00:00',
             updated_at timestamp default now() on update now()
           )"
    execute sql
  end

  def self.down
    drop_table :users
  end
end
