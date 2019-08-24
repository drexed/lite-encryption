# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lite/encryption/version'

Gem::Specification.new do |spec|
  spec.name = 'lite-encryption'
  spec.version = Lite::Encryption::VERSION
  spec.authors = ['Juan Gomez']
  spec.email = %w[j.gomez@drexed.com]

  # rubocop:disable Metrics/LineLength
  spec.summary = 'ActiveSupport::MessageEncryptor encryption wrapper for PORO objects and model attributes'
  # rubocop:enable Metrics/LineLength
  spec.homepage = 'http://drexed.github.io/lite-encryption'
  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata.merge(
      'allowed_push_host' => 'https://rubygems.org',
      'changelog_uri' => 'https://github.com/drexed/lite-encryption/blob/master/CHANGELOG.md',
      'homepage_uri' => spec.homepage,
      'source_code_uri' => 'https://github.com/drexed/lite-encryption'
    )
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]

  spec.add_runtime_dependency 'activesupport'

  spec.add_development_dependency 'activerecord'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'fasterer'
  spec.add_development_dependency 'generator_spec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'sqlite3'
end
