# frozen_string_literal: true

class CreditCard < ActiveRecord::Base

  extend Lite::Encryption::Attribute

  # rubocop:disable Layout/LineLength
  DETERMINISTIC_KEY = 'cb09b316e6675198dc3b785f12bda29f7172364b3c50ac111a9a4ad777f56507c9cef2bbdc83519339de54f628714aaebc655a26b120183ca728583f4de299c1'
  # rubocop:enable Layout/LineLength

  attr_encrypt :name, deterministic: true
  attr_encrypt :number, :cvv, purpose: 'secret-purpose'

end
