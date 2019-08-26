# frozen_string_literal: true

Lite::Encryption.configure do |config|
  config.secret_key_base = ENV['SECRET_KEY_BASE']
  config.secret_key_salt = ENV['SECRET_KEY_SALT']
end
