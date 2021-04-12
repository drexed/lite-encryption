# frozen_string_literal: true

module Lite
  module Encryption
    module Schemes
      class NonDeterministic

        extend Lite::Encryption::Helpers::ClassMethods

        def decrypt(value, opts = {})
          cipher.decrypt_and_verify(value, **opts)
        end

        def encrypt(value, opts = {})
          cipher.encrypt_and_sign(value, **opts)
        end

        private

        def cipher
          @cipher ||= ActiveSupport::MessageEncryptor.new(
            Lite::Encryption.configuration.encryption_key,
            cipher: Lite::Encryption::Key::CIPHER.name
          )
        end

      end
    end
  end
end
