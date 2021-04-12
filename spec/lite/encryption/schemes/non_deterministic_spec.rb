# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Schemes::NonDeterministic do
  describe '.decrypt' do
    it 'returns decrypted_email' do
      encrypted_value = described_class.encrypt(decrypted_email)
      decrypted_value = described_class.decrypt(encrypted_value)

      expect(decrypted_value).to eq(decrypted_email)
    end
  end

  describe '.encrypt' do
    it 'returns true when encrypted_value includes "=--"' do
      encrypted_value = described_class.encrypt(decrypted_email)

      expect(encrypted_value.include?('=--')).to eq(true)
    end
  end

end
