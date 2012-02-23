class User < ActiveRecord::Base
  has_many :user_vacations

  def total_days
    (Date.parse(Time.now.to_s) - Date.parse(start_date)).to_i/365 > 5 ? 23 : 19
  end
end
