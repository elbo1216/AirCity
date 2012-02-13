class UserVacations < ActiveRecord::Migration
  def self.up
    sql = "CREATE TABLE user_vacations (
             id               integer not null auto_increment primary key,
             user_id          integer not null references users(id),
             vacation_start   date not null,
             vacation_end     date not null,
             created_at       timestamp default '0000-00-00 00:00:00',
             updated_at       timestamp default now() on update now()

    );"
    execute sql    
  end

  def self.down
    drop_table :user_vacations
  end
end
