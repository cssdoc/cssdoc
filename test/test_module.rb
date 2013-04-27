require 'test/unit'
require 'helper'
require 'cssdoc/module'

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

    def test_init_a_nameless_module
        m = CssDoc::Module.new

        assert_equal CssDoc::Module::DEFAULT_NAME, m.name
    end

    def test_to_hash
        m = CssDoc::Module.new "hashtest"

        expected = TestHelper.get_default_module()

        assert_equal expected, m.to_hash
    end

    def test_add_variable
        mod = CssDoc::Module.new
        var = CssDoc::Variable.new

        mod.add_variable var

        assert_equal 1, mod.variables.length
        assert_equal var, mod.variables[0]
    end

end
