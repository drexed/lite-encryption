# frozen_string_literal: true

require 'openssl'

module Lite
  module Encryption
    module Schemes
      class Deterministic

        extend Lite::Encryption::Helpers::ClassMethods

        def encrypt(value, _opts = {})
          encoded_value = crypt(:encrypt, value)
          Base64.strict_encode64(encoded_value)
        end

        def decrypt(value, _opts = {})
          decoded_value = Base64.strict_decode64(value)
          crypt(:decrypt, decoded_value)
        end

        private

        def scheme
          @scheme ||= OpenSSL::Cipher.new(Lite::Encryption::Key::ALGORITHM)
        end

        def crypt(cipher_method, value)
          scheme.send(cipher_method)
          scheme.key = "\x03\x11\xD4\xE7\x98+\x7F\xE7\xC0\xC4\xA3\xA5\x9A\xFC\x02=\x8A\x86<\xF1\xB1p\n\xFBa\xB9o\fwf\x1A\xF7"
          scheme.iv = "\x00\x9A\xDB\xDC\xEDF\xF5\x1Aqd\xDDQ"
          scheme.update(value)
        end

      end
    end
  end
end
