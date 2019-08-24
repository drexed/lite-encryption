# Lite::Encryption

[![Gem Version](https://badge.fury.io/rb/lite-encryption.svg)](http://badge.fury.io/rb/lite-encryption)
[![Build Status](https://travis-ci.org/drexed/lite-encryption.svg?branch=master)](https://travis-ci.org/drexed/lite-encryption)

Lite::Encryption is a ActiveSupport::MessageEncryptor wrapper library for encrypting and decrypting
PORO objects and model attributes.

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

## Configurations

`rails g lite:encryption:install` will generate the following file:
`../config/initalizers/lite_encryption.rb`

```ruby
Lite::Encryption.configure do |config|
  config.secret_key_base = nil
  config.secret_key_salt = nil
end
```

`secret_key_base` and `secret_key_salt` should be supplied via environment variables or a secret
management system.

To generate a `secret_key_base`, execute `bundle exec rails secret` in the terminal prompt.
To generate a `secret_key_salt`, execute the following command in the Rails console prompt:
```ruby
SecureRandom.random_bytes(
  ActiveSupport::MessageEncryptor.key_len
)
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
