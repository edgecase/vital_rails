# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_submit_it_session',
  :secret      => '4f7cbe2a58db8ea2d16660d709a095fbcba1aee48942debed15e7fa3cbaa5139c00187c8ffd966b7c391d89429a5b353243372893b85a712bc4505dbab9ffe79'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
