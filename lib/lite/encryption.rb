# frozen_string_literal: true

%w[version configuration message attribute].each do |filename|
  require "lite/encryption/#{filename}"
end

require 'generators/lite/encryption/install_generator'
