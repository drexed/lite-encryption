# frozen_string_literal: true

require 'active_support/message_encryptor'
require 'securerandom'

module Lite
  module Encryption
    class Key

      LENGTH = ActiveSupport::MessageEncryptor.key_len

      class << self

        def generate_base
          SecureRandom.hex(LENGTH * 2)
        end

        def generate_salt
          SecureRandom.random_bytes(LENGTH)
        end

      end

    end
  end
end
