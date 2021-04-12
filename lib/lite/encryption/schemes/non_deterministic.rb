# frozen_string_literal: true

%w[key_generator message_encryptor message_verifier].each do |filename|
  require "active_support/#{filename}"
end

module Lite
  module Encryption
    module Schemes
      class NonDeterministic

        extend Lite::Encryption::Helpers::ClassMethods

        KEY = ActiveSupport::KeyGenerator.new(
          Lite::Encryption.configuration.secret_key_base
        ).generate_key(
          Lite::Encryption.configuration.secret_key_salt,
          ActiveSupport::MessageEncryptor.key_len
        ).freeze

        private_constant :KEY

        def decrypt(value, opts = {})
          encryptor.decrypt_and_verify(value, **opts)
        end

        def encrypt(value, opts = {})
          encryptor.encrypt_and_sign(value, **opts)
        end

        private

        def encryptor
          @encryptor ||= ActiveSupport::MessageEncryptor.new(KEY)
        end

      end
    end
  end
end
