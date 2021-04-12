# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Schemes::Deterministic do

  describe '.decrypt' do
    it 'returns decrypted_email' do
      decrypted_value = described_class.decrypt(encrypted_email)

      expect(decrypted_value).to eq(decrypted_email)
    end
  end

  describe '.encrypt' do
    it 'returns encrypted_email' do
      encrypted_value = described_class.encrypt(decrypted_email)

      expect(encrypted_value).to eq(encrypted_email)
    end
  end

end
