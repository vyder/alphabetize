require './alphabetize/lib/alphabetize'

%x(cp test_Gemfile Gemfile)
Alphabetize::alphabetize_file