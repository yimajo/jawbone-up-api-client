# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jawbone_up_api/client/version'

Gem::Specification.new do |spec|
  spec.name          = 'jawbone-up-api-client'
  spec.version       = JawboneUPAPI::Client::VERSION
  spec.authors       = ['yimajo']
  spec.email         = ['y.imajo@gmail.com']

  spec.summary       = %q{Jawbone UP API Ruby Client.}
  spec.description   = %q{Jawbone UP API Ruby Client.}
  spec.homepage      = "https://github.com/yimajo/jawbone-up-api-client"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'hashie', '~> 3.4'
  spec.add_dependency 'faraday', '~> 0.9'
  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
end
