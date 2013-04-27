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
        expected = TestHelper.get_empty_module()

        assert_equal result, expected
    end

    def test_simple_variable
        str = "$var: 'simple';"
        result = CssDoc::parse_string str, :scss

        var = TestHelper.get_default_variable({:name => 'var'})
        expected = Hash.new
        expected[CssDoc::Module::DEFAULT_NAME] = TestHelper.get_default_module({:variables => [var]})

        assert_equal result, expected
    end

    def test_simple_variable_with_desc
        str = "// simple \n" \
              "$var: 'simple';"

        result = CssDoc::parse_string str, :scss 

        var = TestHelper.get_default_variable({:name => 'var', :description => 'simple'})
        expected = Hash.new
        expected[CssDoc::Module::DEFAULT_NAME] = TestHelper.get_default_module({:variables => [var]})

        assert_equal result, expected
    end

    def test_parse_reading_from_a_simple_file
        TestHelper.chdir 'scss'

        json = JSON.parse File.read('simple_variable.json')
        result = CssDoc::parse_file 'simple_variable.scss', :scss

        assert_equal json.to_json, result.to_json
    end

=begin
    def test_css_files
        path = File.join(File.dirname(__FILE__), 'css_to_test')

        Dir.foreach(path) do |filename|

            if filename.end_with? ".css"
                filename = filename.sub('.css', '')

                css = File.read(File.join(path, filename + '.css'))
                json = File.read(File.join(path, filename + '.json'))

                puts CssDoc

                assert_equal CssDoc.parse_string(css), JSON.parse(json)
            end

        end

        # Dir.foreach("./css_to_test/*.css") do |file|
        #     puts file
        # end

        # assert_equal(1,1)
    end
=end

end
