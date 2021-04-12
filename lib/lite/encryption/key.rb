# frozen_string_literal: true

require 'active_support/message_encryptor'
require 'securerandom'

module Lite
  module Encryption
    class Key

      ALGORITHM = 'aes-256-gcm'.freeze

      LENGTH = ActiveSupport::MessageEncryptor.key_len

      class << self

        def generate_base
          SecureRandom.hex(LENGTH * 2)
        end

        def generate_iv
          OpenSSL::Cipher.new('aes-256-gcm').random_iv
        end

        def generate_salt
          SecureRandom.random_bytes(LENGTH)
        end

      end

    end
  end
end
