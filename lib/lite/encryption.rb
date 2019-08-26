# frozen_string_literal: true

%w[version key configuration message attribute].each do |filename|
  require "lite/encryption/#{filename}"
end

require 'generators/lite/encryption/install_generator'
