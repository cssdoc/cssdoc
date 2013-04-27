require 'test/unit'
require 'rubygems'
require 'cssdoc'

class RuleTest < Test::Unit::TestCase

    def test_init
        r = CssDoc::Rule.new ".simple"

        # The minimun attributes
        assert_equal r.file, ""
        assert_equal r.line, ""
        assert_equal r.type, CssDoc::RuleTypes::SELECTOR
        assert_equal r.description, ""
        assert_equal r.selector, ".simple"
    end

    def test_to_hash
        r = CssDoc::Rule.new ".test-to-hash"

        expected = {
            :file => '',
            :line => '',
            :type => CssDoc::RuleTypes::SELECTOR,
            :description => '',
            :selector => ".test-to-hash"
        }

        assert_equal expected, r.to_hash
    end

end