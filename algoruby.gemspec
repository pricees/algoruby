# -*- encoding: utf-8 -*-
require File.expand_path('../lib/algoruby/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Edward Price"]
  gem.email         = ["ted.price+algoruby@gmail.com"]
  gem.description   = %q{Just for funzies, writing Algorithms in a Nutshell, in Ruby}
  gem.summary       = %q{You know...algorithms.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "algoruby"
  gem.require_paths = ["lib"]
  gem.version       = Algoruby::VERSION
end
