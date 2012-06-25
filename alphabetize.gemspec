# -*- encoding: utf-8 -*-
require File.expand_path('../lib/alphabetize/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Vidur Murali"]
  gem.email         = ["vidur.murali@gmail.com"]
  gem.description   = %q{Alphabetizes your gemfile}
  gem.summary       = %q{Please check how far I've got with the file parsing before you use this gem. It does create a backup of your gemfile in case things go seriously wrong.'}
  gem.homepage      = "https://github.com/vyder/alphabetize"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "alphabetize"
  gem.require_paths = ["lib"]
  gem.version       = Alphabetize::VERSION
end