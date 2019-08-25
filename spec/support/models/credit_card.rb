# frozen_string_literal: true

class CreditCard < ActiveRecord::Base

  extend Lite::Encryption::Attribute

  attr_encrypt :number, :cvv, purpose: 'secret-purpose'

end
