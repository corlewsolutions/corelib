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
  gem.description   = %q{"Many languages provide a vast library of methods or functions for developers to use, whereas Ruby only provides basic (albeit powerful) building blocks. At best, this leads to more complex applications and time wasted writing code another developer has probably already written; at worst it results in core class extensions being placed in helper methods or on objects that have no business owning the methods. The lack of a good strategy for managing Ruby extentions really becomes apparent when a developer needs to share his extensions across multiple projects.

    Corelib aims to solve this problem by providing a central gem for developers to share extensions & additions to the Ruby core.}
  gem.summary       = %q{"Useful extensions & additions to the Ruby core classes}
  gem.homepage      = "https://github.com/corlewsolutions/corelib.git"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
end
