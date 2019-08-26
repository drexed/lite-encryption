# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Key do

  describe '#generate_base' do
    it 'returns 128' do
      expect(described_class.generate_base.size).to eq(128)
    end
  end

  describe '#generate_salt' do
    it 'returns 32' do
      expect(described_class.generate_salt.size).to eq(32)
    end
  end

end
