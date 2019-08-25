# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Encryption::Configuration do
  after { Lite::Encryption.reset_configuration! }

  describe '.configure' do
    it 'to be "foo"' do
      Lite::Encryption.configuration.secret_key_base = 'foo'

      expect(Lite::Encryption.configuration.secret_key_base).to eq('foo')
    end
  end

  describe '.reset_configuration!' do
    it 'to be not "foo"' do
      Lite::Encryption.configuration.secret_key_base = 'foo'
      Lite::Encryption.reset_configuration!

      expect(Lite::Encryption.configuration.secret_key_base).not_to eq('foo')
    end
  end

end
