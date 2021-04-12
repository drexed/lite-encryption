# frozen_string_literal: true

module Lite
  module Encryption
    module Schemes
      class Deterministic

        extend Lite::Encryption::Helpers::ClassMethods

        def decrypt(value, _opts = {})
          decoded_value = Base64.strict_decode64(value)
          crypt(:decrypt, decoded_value)
        end

        def encrypt(value, _opts = {})
          encoded_value = crypt(:encrypt, value)
          Base64.strict_encode64(encoded_value)
        end

        private

        def cipher
          @cipher ||= Lite::Encryption::Key::CIPHER.dup
        end

        def crypt(cipher_method, value)
          cipher.send(cipher_method)
          cipher.key = Lite::Encryption.configuration.encryption_salt
          cipher.iv = Lite::Encryption.configuration.encryption_iv
          cipher.update(value)
        end

      end
    end
  end
end
