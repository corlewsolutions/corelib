# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'corelib/version'

Gem::Specification.new do |gem|
  gem.name          = "corelib"
  gem.version       = Corelib::VERSION
  gem.authors       = ["Corlew Solutions"]
  gem.email         = ["support@corlewsolutions.com"]
  gem.description   = %q{"corelib" is a collection of extensions to the base Ruby classes}
  gem.summary       = %q{"corelib" is a collection of extensions to the base Ruby classes}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
