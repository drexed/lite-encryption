# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Attribute do
  let(:credit_card) { CreditCard.create!(email: decrypted_email, number: decrypted_number) }
  let(:decrypted_number) { '1234-5678-9123-4567' }

  describe '#attr_encrypt' do
    context 'when crypting using a deterministic scheme' do
      it 'returns encrypted_email' do
        expect(credit_card.encrypted_email).not_to eq(decrypted_email)
      end

      it 'returns decrypted_email' do
        expect(credit_card.decrypted_email).to eq(decrypted_email)
        expect(credit_card.email).to eq(decrypted_email)
      end
    end

    context 'when crypting using a non-deterministic scheme' do
      it 'returns not decrypted_number' do
        expect(credit_card.encrypted_number).not_to eq(decrypted_number)
      end

      it 'returns decrypted_number' do
        expect(credit_card.decrypted_number).to eq(decrypted_number)
        expect(credit_card.number).to eq(decrypted_number)
      end
    end
  end

end
