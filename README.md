# Lite::Encryption

[![Gem Version](https://badge.fury.io/rb/lite-encryption.svg)](http://badge.fury.io/rb/lite-encryption)
[![Build Status](https://travis-ci.org/drexed/lite-encryption.svg?branch=master)](https://travis-ci.org/drexed/lite-encryption)

Lite::Encryption is a ActiveSupport::MessageEncryptor and OpenSSL::Cipher::Cipher wrapper libraries
for encrypting and decrypting PORO objects and model attributes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lite-encryption'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lite-encryption

## Table of Contents

* [Configurations](#configurations)
* [Key](#key)
* [Schemes](#schemes)
* [Message](#message)
* [Attribute](#attribute)

## Configurations

`rails g lite:encryption:install` will generate the following file:
`../config/initalizers/lite_encryption.rb`

```ruby
Lite::Encryption.configure do |config|
  config.secret_key_base = ENV['SECRET_KEY_BASE']
  config.secret_key_salt = ENV['SECRET_KEY_SALT']
end
```

## Key

Use the following to generate a base and salt key.

```ruby
Lite::Encryption::Key.generate_base #=> "b912e83c02b44122e31809a7435bc91e2e48c88742365aaccb07283eeb0379909e9aa09d64fc27cb5f20c3f072cd69aacd57518916799c00d41d94c06c916f5c"
Lite::Encryption::Key.generate_salt #=> "\xD5\x8C\xB6\x14\xAC\xC7-&\xAEu\xDDj\x80/\xDF\x15\xD1\xB2\x13\x04\x85\b\x8F\xC6ZQ`Z\xC7\xD4q\xDE"
```

## Schemes

The non-deterministic message class is the wrapper class for `ActiveSupport::MessageEncryptor` so
you can pass it accepted options.

The deterministic message class is the wrapper class for `OpenSSL::Cipher::Cipher` so
you can pass it accepted options.

```ruby
Lite::Encryption::Schemes::NonDeterministic.encrypt('decrypted_text', purpose: 'sec-pur')
Lite::Encryption::Schemes::NonDeterministic.decrypt('==encrypted_text')

# - or -

service = Lite::Encryption::Deterministic.new

service.encrypt('decrypted_text')
service.decrypt('==encrypted_text')
```

## Message

The message class is the wrapper class for both schemes so you can pass it accepted options.

```ruby
Lite::Encryption::Message.encrypt('decrypted_text', purpose: 'sec-pur')
Lite::Encryption::Message.decrypt('==encrypted_text')

# - or -

service = Lite::Encryption::Message.new

service.encrypt('decrypted_text', expires_in: 2.hours)
service.decrypt('==encrypted_text')

# - or -

Lite::Encryption::Message.encrypt('decrypted_text', deterministic: true)
Lite::Encryption::Message.decrypt('==encrypted_text', deterministic: true)

# - or -

service = Lite::Encryption::Message.new

service.encrypt('decrypted_text', deterministic: true)
service.decrypt('==encrypted_text', deterministic: true)
```

## Attribute

The attribute module provides a handy method for encrypting and decrypting attributes.
You must add an `encrypted_*[column_name]` attribute to your database table like
`encrypted_number`. You can then add code like the following for it to automatically
encrypt and decrypt your values.

```ruby
class CreditCard < ActiveRecord::Base
  extend Lite::Encryption::Attribute

  attr_encrypt :name, deterministic: true
  attr_encrypt :number, :cvv, purpose: 'payment-menthod'

end
```

You can then access attributes using the following:

```ruby
credit_card = CreditCard.create(number: '1234')

credit_card.encrypted_number #=> '==encrypted_text'
credit_card.decrypted_number #=> '1234'
credit_card.number           #=> '1234'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/lite-encryption. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lite::Encryption project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/lite-encryption/blob/master/CODE_OF_CONDUCT.md).
