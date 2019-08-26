# frozen_string_literal: true

module Lite
  module Encryption

    class Configuration

      attr_accessor :secret_key_base, :secret_key_salt

      def initialize
        @secret_key_base = Lite::Encryption::Key.generate_base
        @secret_key_salt = Lite::Encryption::Key.generate_salt
      end

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
