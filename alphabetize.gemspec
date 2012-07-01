# -*- encoding: utf-8 -*-
$:.unshift File.dirname(__FILE__)

require 'lib/alphabetize'

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

  # = MANIFEST =
  gem.files = %w[
    Gemfile
    LICENSE
    README.md
    Rakefile
    alphabetize.gemspec
    bin/alphabetize
    lib/alphabetize.rb
    test/helper.rb
    test/sample_Gemfiles/mixed_Gemfile
    test/sample_Gemfiles/out_regular_chunks_Gemfile
    test/sample_Gemfiles/out_static_chunks_Gemfile
    test/sample_Gemfiles/regular_chunks_Gemfile
    test/sample_Gemfiles/simple_Gemfile
    test/sample_Gemfiles/static_chunks_Gemfile
    test/test_alphabetize.rb
  ]
  # = MANIFEST =

end  