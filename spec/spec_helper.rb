# frozen_string_literal: true

require 'bundler/setup'
require 'lite/encryption'
require 'generator_spec'
require 'active_record'

# rubocop:disable Metrics/LineLength
Lite::Encryption.configure do |config|
  config.secret_key_base = 'b912e83c02b44122e31809a7435bc91e2e48c88742365aaccb07283eeb0379909e9aa09d64fc27cb5f20c3f072cd69aacd57518916799c00d41d94c06c916f5c'
  config.secret_key_salt = "\xD5\x8C\xB6\x14\xAC\xC7-&\xAEu\xDDj\x80/\xDF\x15\xD1\xB2\x13\x04\x85\b\x8F\xC6ZQ`Z\xC7\xD4q\xDE"
end
# rubocop:enable Metrics/LineLength

spec_path = Pathname.new(File.expand_path('../spec', File.dirname(__FILE__)))

%w[config models].each do |dir|
  Dir.each_child(spec_path.join("support/#{dir}")) do |f|
    load(spec_path.join("support/#{dir}/#{f}"))
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:all) do
    temp_path = spec_path.join('generators/lite/tmp')
    FileUtils.remove_dir(temp_path) if File.directory?(temp_path)
  end
end
