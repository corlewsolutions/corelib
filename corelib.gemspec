# -*- encoding: utf-8 -*-
#http://nithinbekal.com/2011/writing-ruby-gems-part-5-setting-up-rspec/
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'corelib/version'

Gem::Specification.new do |gem|
  gem.name          = "corelib"
  gem.version       = Corelib::VERSION
  gem.authors       = ["Corlew Solutions"]
  gem.email         = ["support@corlewsolutions.com"]
  gem.description   = %q{"Useful extensions & additions to the Ruby core classes}
  gem.summary       = %q{"Useful extensions & additions to the Ruby core classes}
  gem.homepage      = "https://github.com/corlewsolutions/corelib.git"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
end
