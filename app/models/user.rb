class User < ActiveRecord::Base
  has_many :user_vacations

  def total_days
    
  end
end
