# frozen_string_literal: true

module Lite
  module Encryption
    module Attribute

      # rubocop:disable Metrics/MethodLength
      def attr_encrypt(*fields, **opts)
        class_eval do
          fields.each do |field|
            define_method("#{field}=") do |value|
              return if value.nil?

              encrypted_value = Lite::Encryption::Message.encrypt(value, opts)
              send("encrypted_#{field}=", encrypted_value)
            end

            define_method(field) do
              encrypted_value = send("encrypted_#{field}")
              return if encrypted_value.blank?

              Lite::Encryption::Message.decrypt(encrypted_value, opts)
            end

            define_method("decrypted_#{field}") do
              send(field)
            end
          end
        end
      end
      # rubocop:enable Metrics/MethodLength

    end
  end
end
