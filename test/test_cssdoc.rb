require 'test/unit'
require 'helper'
require 'cssdoc'
require 'json'

class CssDocTest < Test::Unit::TestCase

    INITIAL_LOCATION = Dir.pwd

    def setup
        #puts 'setup'
    end

    def teardown
        Dir.chdir INITIAL_LOCATION
    end


    def test_init
        assert_equal 1, 1
    end

    def test_parse_string_given_empty_string
        result = CssDoc::parse_string ""
        expected = TestHelper.get_empty_module().to_json
        expected = JSON.parse expected

        assert_equal result, expected
    end

    def test_simple_variable
        str = "$var: 'simple';"
        result = CssDoc::parse_string str, :scss

        var = TestHelper.get_default_variable({:name => 'var'})
        expected = Hash.new
        expected[CssDoc::Module::DEFAULT_NAME] = TestHelper.get_default_module({:variables => [var]})

        expected = JSON.parse expected.to_json

        assert_equal result, expected
    end

    def test_simple_variable_with_desc
        str = "// simple \n" \
              "$var: 'simple';"

        result = CssDoc::parse_string str, :scss 

        var = TestHelper.get_default_variable({:name => 'var', :description => 'simple'})
        expected = Hash.new
        expected[CssDoc::Module::DEFAULT_NAME] = TestHelper.get_default_module({:variables => [var]})

        expected = JSON.parse expected.to_json

        assert_equal result, expected
    end

    def test_parse_reading_from_a_simple_file
        TestHelper.chdir 'scss'

        json = JSON.parse File.read('simple_variable.json')
        result = CssDoc::parse_file 'simple_variable.scss', :scss

        assert_equal json, result
    end


    def test_scss_files
        TestHelper.chdir 'scss'

        Dir.foreach('.') do |filename|
            if filename.end_with? ".scss"
                json_file = filename.sub('.scss', '.json')

                scss = CssDoc::parse_file filename
                json = JSON.parse File.read json_file

                assert_equal scss, json
            end
        end
    end
end
