require 'test/unit'
require 'rubygems'
require 'cssdoc'

class ModuleTest < Test::Unit::TestCase

    def test_init_a_module
        m = CssDoc::Module.new "test"

        assert_equal m.name, "test"

        # it has to have all basic propeties empty
        assert_equal m.variables, []
        assert_equal m.functions, []
        assert_equal m.mixins, []
        assert_equal m.rules, []
    end

    def test_to_hash
        m = CssDoc::Module.new "hashtest"

        expected = Hash.new
        expected['hashtest'] = {
            :variables => [],
            :functions => [],
            :mixins => [],
            :rules => []
        }

        assert_equal expected, m.to_hash
    end

end