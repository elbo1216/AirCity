class User < ActiveRecord::Base
  has_many :user_vacations

  def total_days
    (Time.now - start_date)/31536000 > 5 ? 23 : 19
  end
end
