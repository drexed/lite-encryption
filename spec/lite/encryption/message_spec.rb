# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Message do
  let(:decrypted_value) { 'test' }

  describe '.decrypt' do
    it 'returns decrypted_value' do
      # rubocop:disable Metrics/LineLength
      encrypted_value = 'cFJUa3h1eXY3NndlT2k5RGpLYWtJQT09LS1PSFVvQXllamNhWkFpVjFkdEFsaEtnPT0=--5cb3b4fad8e12331770d8b45163597f3af8ca639'
      transduced_value = described_class.decrypt(encrypted_value)
      # rubocop:enable Metrics/LineLength

      expect(transduced_value).to eq(decrypted_value)
    end
  end

  describe '.encrypt' do
    it 'returns true when encrypted includes "=--"' do
      transduced_value = described_class.encrypt(decrypted_value)

      expect(transduced_value.include?('=--')).to eq(true)
    end
  end

end
