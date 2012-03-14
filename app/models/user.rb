require "digest/sha1"

class User < ActiveRecord::Base
  has_many :user_vacations

  MAX_TIMEOUT = 15

  def total_days
    (Date.parse(Time.now.to_s) - Date.parse(start_date.to_s)).to_i/365 > 5 ? 23.0 : 19.0
  end

  def encrypt(password)
    salt = generate_salt
    Digest::SHA1.hexdigest(password, salt)
  end

  def validate_password(password)
    encrypted_password == Digest::SHA1.hexdigest(password, salt)
  end

  def has_timed_out?
    return true if login_at.blank?
  end

  private
  def generate_salt
    Digest::SHA1.hexdigest(SecureRandom.hex(10))
  end
end
