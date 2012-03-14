class VacationTrackerController < ApplicationController
  layout "base_layout"

  VACA_DAYS_PER_YEAR = 14

  def index
    @user_list = User.all.map { |u| ["#{u.first_name} #{u.last_name}",u.id] }
    @user_list.unshift(['', ''])
    @year_list = [2012, 2011]
    @vacation_days = []
    @user = ''
  end

  def get_vacation_days
    user = User.find(params['user_id'])
    user_vacations = UserVacation.find(:all, :conditions => ['user_id = ? and year(vacation_start) = ?',params['user_id'], params['year']])
    days_used = 0.0
    @user_data = {}
    user_vacations.each do |row|
      half = row.is_half_day ? "Yes" : "No"
      @user_data["user_vacation"] = [] unless @user_data["user_vacation"]
      @user_data["user_vacation"] << {"id" => row.id, "vstart" => row.vacation_start, "vend" => row.vacation_end, "half" => half}
      days_used += row.days_used
    end
    days_left = user.total_days - days_used
    @user_data["days_left"] = days_left.to_f
    @user_data["days_used"] = days_used

    render :text => @user_data.to_json
  end

  def add_vacation_days
    uv = UserVacation.new

    uv.vacation_end = params["vend"]
    uv.vacation_start = params["vstart"]
    uv.user_id = params['user_id']
    uv.is_half_day = params['half_day']

    ret_val = "SUCCESS"
    ret_val = "ERROR: Please select a user" if uv.user_id.blank?
    ret_val = "ERROR: Vacation start date cannot be null" if uv.vacation_start.blank?
    ret_val = "ERROR: Vacation end date cannot be null" if uv.vacation_end.blank?
    ret_val = "ERROR: Vacation start is later than vacation end date." if !uv.vacation_start.blank? && !uv.vacation_end.blank? && uv.vacation_start > uv.vacation_end
    ret_val = "ERROR: Half day can only be used with same start and end days" if uv.is_half_day && uv.vacation_end != uv.vacation_start
    uv.save! if ret_val == 'SUCCESS'

    render :text => ret_val 
  end

  def add_user
    user = User.new
    user.last_name = params['last_name']
    user.first_name = params['first_name']
    user.start_date = params['start_date']
    ret_val = 'SUCCESS'
    ret_val = 'ERROR: First and Last name must not be blank' if user.last_name.blank? || user.first_name.blank?
    user.save! if ret_val == 'SUCCESS'

    render :text => ret_val
  end

  def remove_user
    user = User.find(params['user_id'])
    user.destroy

    render :nothing => true
  end 

  def remove_vacation_day
    id = params['id']
    UserVacation.find(id).delete
    render :nothing => true
  end
end
