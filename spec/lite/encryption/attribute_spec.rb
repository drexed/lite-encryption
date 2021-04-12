# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Attribute do
  let(:credit_card) { CreditCard.create!(name: decrypted_name, number: decrypted_number) }
  let(:decrypted_number) { '1234-5678-9101-1121' }
  let(:decrypted_name) { 'James Jones' }

  describe '#attr_encrypt' do
    context 'when crypting using a deterministic scheme' do
      it 'returns encrypted_name' do
        expect(credit_card.encrypted_name).not_to eq(decrypted_name)
      end

      it 'returns decrypted_name' do
        expect(credit_card.decrypted_name).to eq(decrypted_name)
        expect(credit_card.name).to eq(decrypted_name)
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
