require 'minitest/autorun'
require 'alphabetize'
require 'fileutils'


class TestAlphabetize < Minitest::Test

    def setup
        @gemfile = "Gemfile"
        @backup_gemfile = "old_#{@gemfile}"
        @input_dir = File.join(File.dirname(__FILE__), 'testfiles/input')
        @expected_dir = File.join(File.dirname(__FILE__), 'testfiles/expected')

        # Step in to a temporary directory
        @tmp_dir = 'tmp'
        FileUtils.mkdir @tmp_dir unless File.exists?(@tmp_dir)
        FileUtils.cd @tmp_dir
    end


    # Verify that Alphabetize accurately backs up the
    # original Gemfile
    def test_backup_Gemfile
        setup_and_test "test_backup_Gemfile", :backup
    end

    # Sort a simple Gemfile without blocks
    def test_simple_Gemfile
        setup_and_test "test_simple_Gemfile"
    end

    # Sort a Gemfile with simple blocks
    # def test_simple_blocks_Gemfile
    #     setup_and_test "test_simple_blocks_Gemfile"
    # end


    def teardown
        # Cleanup any leftover Gemfiles in current directory
        FileUtils.rm @gemfile
        FileUtils.cd '..'
        FileUtils.rm_r @tmp_dir
    end


    # Helper method to copy the specified test Gemfile in,
    # run Alphabetize on it and verify the output
    def setup_and_test( test_gemfile, test_against = :actual )

        FileUtils.cp "#{@input_dir}/#{test_gemfile}", @gemfile

        # Process the Gemfile
        Alphabetize::alphabetize_file({ :mode => :silent })

        # Read in both the generated output and the expected output Gemfiles
        output = (test_against == :actual) ? @gemfile : @backup_gemfile
        generated_output = File.open(output, 'r') { |file| file.read }
        expected_output = File.open("#{@expected_dir}/#{test_gemfile}", 'r') { |file| file.read }

        # Will it blend?
        assert_equal expected_output, generated_output
    end

end