# frozen_string_literal: true

require 'openssl' unless defined?(OpenSSL)
require 'securerandom' unless defined?(SecureRandom)

module Lite
  module Encryption
    class Key

      CIPHER = OpenSSL::Cipher.new('aes-256-gcm').freeze
      LENGTHS = {
        iv: CIPHER.iv_len,
        key: CIPHER.key_len,
        password: 16,
        salt: CIPHER.key_len
      }.freeze

      class << self

        def generate_iv
          SecureRandom.random_bytes(LENGTHS[:iv])
        end

        def generate_key
          generator = ActiveSupport::KeyGenerator.new(generate_password)
          generator.generate_key(generate_salt, LENGTHS[:key])
        end

        def generate_password
          SecureRandom.hex(LENGTHS[:password])
        end

        def generate_salt
          SecureRandom.random_bytes(LENGTHS[:salt])
        end

      end

    end
  end
end
