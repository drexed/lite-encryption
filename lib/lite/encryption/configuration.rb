# frozen_string_literal: true

module Lite
  module Encryption

    class Configuration

      attr_accessor :secret_key_base, :secret_key_salt

      # rubocop:disable Metrics/LineLength
      def initialize
        @secret_key_base = 'b912e83c02b44122e31809a7435bc91e2e48c88742365aaccb07283eeb0379909e9aa09d64fc27cb5f20c3f072cd69aacd57518916799c00d41d94c06c916f5c'
        @secret_key_salt = "\xD5\x8C\xB6\x14\xAC\xC7-&\xAEu\xDDj\x80/\xDF\x15\xD1\xB2\x13\x04\x85\b\x8F\xC6ZQ`Z\xC7\xD4q\xDE"
      end
      # rubocop:enable Metrics/LineLength

    end

    class << self

      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration)
      end

      def reset_configuration!
        @configuration = Configuration.new
      end

    end

  end
end
