class UserVacation < ActiveRecord::Base
  belongs_to :user

  def days_used
    return 0.5 if vacation_start == vacation_end && is_half_day
    return 1.0 if vacation_start == vacation_end && !is_half_day
    return (total_business_days(Date.parse(vacation_start.to_s), Date.parse(vacation_end.to_s))).to_f
  end

  def total_business_days(begin_date, end_date)
    return if begin_date > end_date
    business_days = begin_date.cwday < 6 ? 1 : 0
    counter = 0
    while begin_date + counter < end_date
      if (begin_date + counter).cwday < 6
        business_days += 1
      end
      counter += 1
    end
    business_days
  end
end
