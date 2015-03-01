# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slack/version'

Gem::Specification.new do |spec|
  spec.name          = "slack-api-wrapper"
  spec.version       = Slack::VERSION
  spec.authors       = ["Gustavo Bazan"]
  spec.email         = ["contacto@gustavobazan.com"]
  spec.summary       = "Slack API Wrapper"
  spec.description   = <<-EOF
        A library that provides a plain function-call interface to the
        Slack API web endpoints.
    EOF
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", '~> 0'
  spec.add_development_dependency "rspec", '~> 3.2', '>= 3.2.0'
end
