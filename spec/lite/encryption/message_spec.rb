# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Message do

  describe '#crypting' do
    context 'when crypting using a deterministic scheme' do
      it 'returns decrypted_email' do
        encrypted_value = described_class.encrypt(decrypted_email, deterministic: true)
        expect(encrypted_value).to eq(encrypted_email)

        decrypted_value = described_class.decrypt(encrypted_value, deterministic: true)
        expect(decrypted_value).to eq(decrypted_email)
      end
    end

    context 'when crypting using a non-deterministic scheme' do
      it 'returns decrypted_email' do
        encrypted_value = described_class.encrypt(decrypted_email)
        expect(encrypted_value).not_to eq(decrypted_email)
        expect(encrypted_value).not_to eq(encrypted_email)

        decrypted_value = described_class.decrypt(encrypted_value)
        expect(decrypted_value).to eq(decrypted_email)
      end
    end
  end

end
