# frozen_string_literal: true

RSpec.describe Lite::Encryption do
  it 'to be a version number' do
    expect(Lite::Encryption::VERSION).not_to be nil
  end
end
