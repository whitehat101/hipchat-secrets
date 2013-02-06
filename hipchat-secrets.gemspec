# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |gem|
  gem.name          = "hipchat-secrets"
  gem.version       = HipChatSecrets::VERSION
  gem.authors       = ["Jeremy Ebler"]
  gem.email         = ["jebler@gmail.com"]
  gem.description   = %q{Extract secrets from hipchat configuration files}
  gem.summary       = %q{Decode the weakly crypted password from the hipchat configuration file. The API allows decoding/encoding—everything you need to discover the secret key!}
  gem.homepage      = "https://github.com/whitehat101/hipchat-secrets"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'json'
  # gem.add_dependency 'base64'

  gem.add_development_dependency 'spork'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'guard-bundler'
  gem.add_development_dependency 'rb-fsevent', '~> 0.9.1'
end
