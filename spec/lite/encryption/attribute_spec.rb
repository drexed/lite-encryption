# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Attribute do
  let(:number) { '1234' }
  let(:credit_card) { CreditCard.create!(number: number) }

  describe '#attr_encrypt' do
    context 'when encrypting' do
      it 'returns encrypted version of "1234"' do
        credit_card = CreditCard.create!(number: number)

        expect(credit_card.encrypted_number).not_to eq(number)
      end

      it 'returns decrypted version of encrypted "1234"' do
        credit_card = CreditCard.create!(number: number)

        expect(credit_card.decrypted_number).to eq(number)
        expect(credit_card.number).to eq(number)
      end
    end
  end

end
