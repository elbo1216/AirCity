class UserVacation < ActiveRecord::Base
  belongs_to :user

  def days_used
    return 0.5 if vacation_start == vacation_end && is_half_day
    return 1.0 if vacation_start == vacation_end && !is_half_day
    return (Date.parse(vacation_end.to_s) - Date.parse(vacation_start.to_s) + 1).to_f
  end
end
