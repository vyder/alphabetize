# -*- encoding: utf-8 -*-
$:.unshift File.dirname(__FILE__)

require 'lib/alphabetize'

Gem::Specification.new do |gem|
  gem.authors       = ["Vidur Murali"]
  gem.email         = ["vidur.murali@gmail.com"]
  gem.description   = "Alphabetizes your Gemfile"
  gem.summary       = "Please check how far I've got with the file parsing before you use this gem. It does create a backup of your Gemfile in case things go seriously wrong.'"
  gem.homepage      = "https://github.com/vyder/alphabetize"

  gem.files         = `git ls-files`.split($\)
  gem.executables   << 'alphabetize'
  gem.name          = "alphabetize"
  gem.require_paths = ["lib"]
  gem.version       = Alphabetize::VERSION

end