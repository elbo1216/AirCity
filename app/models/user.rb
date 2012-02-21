class User < ActiveRecord::Base
  has_many :user_vacations

  def total_days
    Time.now - start_date >  ? 23 : 19
  end
end
