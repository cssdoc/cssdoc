require 'test/unit'
require 'rubygems'
require 'cssdoc'
require 'json'

class CssDocTest < Test::Unit::TestCase

    def test_init
        assert_equal 1, 1
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