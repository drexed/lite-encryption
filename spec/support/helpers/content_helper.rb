# frozen_string_literal: true

module ContextHelper

  extend RSpec::SharedContext

  # rubocop:disable Layout/LineLength
  let(:fake_encryption_iv) { "\x9C\x9F5<\xA5\x9B\x97\x97\xE2\x1DQ\x05" }
  let(:fake_encryption_key) { "y\x0Eo\xC1Gll\x05Qv\x11[\xE1vN8<\xAFxU_\xCB\xD7\x02)0\xC1#\x99\xDD4N" }
  let(:fake_encryption_salt) { "\xD2\xBA\x9B\x81@e\x99\x8BN\a7\xC2\x95)f\x97k\xC9EM\xE0x\xFBO\x9BERBD\x85%n" }
  # rubocop:enable Layout/LineLength

  let(:decrypted_email) { 'fake123@test.com' }
  let(:encrypted_email) { '1VWh4zbDQc8TLOthm79xvQ==' }

  before do
    Lite::Encryption.configuration.encryption_iv = fake_encryption_iv
    Lite::Encryption.configuration.encryption_key = fake_encryption_key
    Lite::Encryption.configuration.encryption_salt = fake_encryption_salt
  end

  after { Lite::Encryption.reset_configuration! }

end
