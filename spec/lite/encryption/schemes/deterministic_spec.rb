# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Schemes::Deterministic do
  let(:decrypted_message) { 'test' }
  let(:encrypted_message) { 'rW8QbA==' }

  # before { Lite::Encryption.configuration.secret_key_base = CreditCard::DETERMINISTIC_KEY }
  #
  # after { Lite::Encryption.reset_configuration! }

  describe '.decrypt' do
    it 'returns decrypted_message' do
      decrypted_value = described_class.decrypt(encrypted_message)

      expect(decrypted_value).to eq(decrypted_message)
    end
  end

  describe '.encrypt' do
    it 'returns encrypted_message' do
      encrypted_value = described_class.encrypt(decrypted_message)

      expect(encrypted_value).to eq(encrypted_message)
    end
  end

end
