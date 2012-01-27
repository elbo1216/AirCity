# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_new_session',
  :secret      => 'eba8e20e4fedaf48548260a6024173457cee4e3ba24bdbd4959cc86a5425d8a6fa9c0e7d0c1a4e9d1d9a4ac08017b2af6b4f2fb16f6fdd2ad9ad13d37fe0e004'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
