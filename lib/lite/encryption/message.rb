# frozen_string_literal: true

%w[key_generator message_encryptor message_verifier].each do |filename|
  require "active_support/#{filename}"
end

module Lite
  module Encryption
    class Message

      KEY ||= ActiveSupport::KeyGenerator.new(
        Lite::Encryption.configuration.secret_key_base
      ).generate_key(
        Lite::Encryption.configuration.secret_key_salt,
        ActiveSupport::MessageEncryptor.key_len
      ).freeze

      private_constant :KEY

      class << self

        %i[decrypt encrypt].each do |name|
          define_method(name) do |value, opts = {}|
            klass = new
            klass.send(name, value, opts)
          end
        end

      end

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
