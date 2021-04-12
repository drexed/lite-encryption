# frozen_string_literal: true

module Lite
  module Encryption

    class Configuration

      attr_accessor :encryption_iv, :encryption_key, :encryption_salt

      def initialize
        @encryption_iv = Lite::Encryption::Key.generate_iv
        @encryption_key = Lite::Encryption::Key.generate_key
        @encryption_salt = Lite::Encryption::Key.generate_salt
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
