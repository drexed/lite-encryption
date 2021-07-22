# frozen_string_literal: true

unless defined?(ActiveSupport)
  require 'active_support/key_generator'
  require 'active_support/message_encryptor'
  require 'active_support/message_verifier'
end

require 'generators/lite/encryption/install_generator' if defined?(Rails::Generators)

require 'lite/encryption/version'
require 'lite/encryption/key'
require 'lite/encryption/configuration'
require 'lite/encryption/helpers/class_methods'
require 'lite/encryption/schemes/deterministic'
require 'lite/encryption/schemes/non_deterministic'
require 'lite/encryption/message'
require 'lite/encryption/attribute'
