# frozen_string_literal: true

module Lite
  module Encryption
    class Message

      extend Lite::Encryption::Helpers::ClassMethods

      def decrypt(value, opts = {})
        scheme = scheme_by_option(opts)
        scheme.decrypt(value, **opts)
      end

      def encrypt(value, opts = {})
        scheme = scheme_by_option(opts)
        scheme.encrypt(value, **opts)
      end

      private

      def deterministic_scheme
        @deterministic_scheme ||= Lite::Encryption::Schemes::Deterministic.new
      end

      def non_deterministic_scheme
        @non_deterministic_scheme ||= Lite::Encryption::Schemes::NonDeterministic.new
      end

      def scheme_by_option(options)
        options.delete(:deterministic) ? deterministic_scheme : non_deterministic_scheme
      end

    end
  end
end
