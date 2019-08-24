# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Configuration do
  # rubocop:disable Metrics/LineLength
  after do
    Lite::Encryption.configure do |config|
      config.secret_key_base = 'b912e83c02b44122e31809a7435bc91e2e48c88742365aaccb07283eeb0379909e9aa09d64fc27cb5f20c3f072cd69aacd57518916799c00d41d94c06c916f5c'
      config.secret_key_salt = "\xD5\x8C\xB6\x14\xAC\xC7-&\xAEu\xDDj\x80/\xDF\x15\xD1\xB2\x13\x04\x85\b\x8F\xC6ZQ`Z\xC7\xD4q\xDE"
    end
  end
  # rubocop:enable Metrics/LineLength

  describe '.configure' do
    it 'to be "foo"' do
      Lite::Encryption.configuration.secret_key_base = 'foo'

      expect(Lite::Encryption.configuration.secret_key_base).to eq('foo')
    end
  end

  describe '.reset_configuration!' do
    it 'to be nil' do
      Lite::Encryption.configuration.secret_key_base = 'foo'
      Lite::Encryption.reset_configuration!

      expect(Lite::Encryption.configuration.secret_key_base).to eq(nil)
    end
  end

end
