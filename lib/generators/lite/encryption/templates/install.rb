# frozen_string_literal: true

Lite::Encryption.configure do |config|
  config.encryption_iv = ENV['ENCRYPTION_IV']
  config.encryption_key = ENV['ENCRYPTION_KEY']
  config.encryption_salt = ENV['ENCRYPTION_SALT']
end
