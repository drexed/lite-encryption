# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Configuration do
  after { Lite::Encryption.reset_configuration! }

  describe '.configure' do
    it 'to be "foo"' do
      Lite::Encryption.configuration.encryption_key = 'foo'

      expect(Lite::Encryption.configuration.encryption_key).to eq('foo')
    end
  end

  describe '.reset_configuration!' do
    it 'to be not "foo"' do
      Lite::Encryption.configuration.encryption_key = 'foo'
      Lite::Encryption.reset_configuration!

      expect(Lite::Encryption.configuration.encryption_key).not_to eq('foo')
    end
  end

end
