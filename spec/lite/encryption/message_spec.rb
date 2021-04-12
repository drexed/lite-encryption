# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Message do
  let(:decrypted_message) { 'test' }
  let(:encrypted_message) { "rW8QbA==" }

  before { Lite::Encryption.configuration.secret_key_base = CreditCard::DETERMINISTIC_KEY }

  after { Lite::Encryption.reset_configuration! }

  describe '#crypting' do
    context 'when crypting using a deterministic scheme' do
      it 'returns decrypted_message' do
        encrypted_value = described_class.encrypt(decrypted_message, deterministic: true)
        expect(encrypted_value).to eq(encrypted_message)

        decrypted_value = described_class.decrypt(encrypted_value, deterministic: true)
        expect(decrypted_value).to eq(decrypted_message)
      end
    end

    context 'when crypting using a non-deterministic scheme' do
      it 'returns decrypted_message' do
        encrypted_value = described_class.encrypt(decrypted_message)
        expect(encrypted_value).not_to eq(decrypted_message)
        expect(encrypted_value).not_to eq(encrypted_message)

        decrypted_value = described_class.decrypt(encrypted_value)
        expect(decrypted_value).to eq(decrypted_message)
      end
    end
  end

end
