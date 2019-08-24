# frozen_string_literal: true

Lite::Encryption.configure do |config|
  config.secret_key_base = nil
  config.secret_key_salt = nil
end
