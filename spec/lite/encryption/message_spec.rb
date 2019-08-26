# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Message do
  let(:message) { 'test' }

  describe '.decrypt' do
    it 'returns message' do
      encrypted_value = described_class.encrypt(message)
      decrypted_value = described_class.decrypt(encrypted_value)

      expect(decrypted_value).to eq(message)
    end
  end

  describe '.encrypt' do
    it 'returns true when encrypted message includes "=--"' do
      encrypted_value = described_class.encrypt(message)

      expect(encrypted_value.include?('=--')).to eq(true)
    end
  end

end
