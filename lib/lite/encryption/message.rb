# frozen_string_literal: true

module Lite
  module Encryption
    class Message

      extend Lite::Encryption::Helpers::ClassMethods

      def decrypt(value, opts = {})
        if opts.delete(:deterministic)
          deterministic_encryptor.decrypt(value, **opts)
        else
          non_deterministic_encryptor.decrypt(value, **opts)
        end
      end

      def encrypt(value, opts = {})
        if opts.delete(:deterministic)
          deterministic_encryptor.encrypt(value, **opts)
        else
          non_deterministic_encryptor.encrypt(value, **opts)
        end
      end

      private

      def deterministic_encryptor
        @deterministic_encryptor ||= Lite::Encryption::Schemes::Deterministic.new
      end

      def non_deterministic_encryptor
        @non_deterministic_encryptor ||= Lite::Encryption::Schemes::NonDeterministic.new
      end

    end
  end
end
