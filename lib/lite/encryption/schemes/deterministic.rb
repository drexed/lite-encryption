# frozen_string_literal: true

require 'openssl'

module Lite
  module Encryption
    module Schemes
      class Deterministic

        extend Lite::Encryption::Helpers::ClassMethods

        CIPHER = OpenSSL::Cipher.new('aes-256-cbc')

        def encrypt(value, _opts = {})
          encoded_value = crypt(:encrypt, value)
          Base64.encode64(encoded_value)
        end

        def decrypt(value, _opts = {})
          decoded_value = Base64.decode64(value)
          crypt(:decrypt, decoded_value)
        end

        private

        def crypt(cipher_method, value)
          CIPHER.send(cipher_method)
          CIPHER.pkcs5_keyivgen(Lite::Encryption.configuration.secret_key_base)
          result = CIPHER.update(value)
          result << CIPHER.final
        end

      end
    end
  end
end
