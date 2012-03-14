class UserController < ApplicationController
  layout "base_layout"

  def index
    @user_list = User.all.map {|u| ["#{u.first_name} #{u.last_name}", u.id] }
    @user_list.unshift(["",""])
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

  def find_user
    user = User.find(:first, :conditions => ['id = ?', params['user_id']])
    if user.blank?
      user = []
    end
    render :text => user.to_json
  end
end
