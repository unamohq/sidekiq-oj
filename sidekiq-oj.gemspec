# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq/oj/version'

Gem::Specification.new do |spec|
  spec.name          = "sidekiq-oj"
  spec.version       = Sidekiq::Oj::VERSION
  spec.authors       = ["Rafal Wojsznis"]
  spec.email         = ["rafal.wojsznis@gmail.com"]

  spec.summary       = "Speed-up sidekiq for free"
  spec.description   = "Save some precious milliseconds by using oj instead of json inside sidekiq"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "oj", "> 2.17"
  spec.add_dependency "sidekiq", ">= 4.0.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "benchmark-ips"
end
