# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_24-ways-2009_session',
  :secret      => 'd929fbdc5ccac9c09f3cef5521883b6888a8147cabfb86955cb7dafc17575a099ae8027a931e739ba45e5f7a951c29fdc6f6b0cba6a292e7abc9920550853ceb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
