# frozen_string_literal: true

%w[key_generator message_encryptor message_verifier].each do |filename|
  require "active_support/#{filename}"
end

require 'lite/encryption/version'

%w[key configuration].each do |filename|
  require "lite/encryption/#{filename}"
end

require 'lite/encryption/helpers/class_methods'

%w[deterministic non_deterministic].each do |filename|
  require "lite/encryption/schemes/#{filename}"
end

%w[message attribute].each do |filename|
  require "lite/encryption/#{filename}"
end

require 'generators/lite/encryption/install_generator'
