# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Key do

  describe '#generate_iv' do
    it 'returns 12' do
      result = described_class.generate_iv

      expect(result.size).to eq(12)
    end
  end

  describe '#generate_key' do
    it 'returns 32' do
      result = described_class.generate_key

      expect(result.size).to eq(32)
    end
  end

  describe '#generate_password' do
    it 'returns 32' do
      result = described_class.generate_password

      expect(result.size).to eq(32)
    end
  end

  describe '#generate_salt' do
    it 'returns 32' do
      result = described_class.generate_salt

      expect(result.size).to eq(32)
    end
  end

end
