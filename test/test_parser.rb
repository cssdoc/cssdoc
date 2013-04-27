require 'test/unit'
require 'helper'
require 'cssdoc/parser'

class ParserTest < Test::Unit::TestCase

    def setup
        @parser = CssDoc::Parser.new
    end

    def test_init
        parser = CssDoc::Parser.new

        assert_equal parser.root, nil
    end

    def test_given_empty_tree
        engine = Sass::Engine.new "", :syntax => :scss
        parser = CssDoc::Parser.new engine.to_tree

        assert_equal TestHelper.get_empty_module, parser.parse
    end

    def test_format_module_name
        assert_equal CssDoc::Module::DEFAULT_NAME, @parser.format_module_name(nil)
        assert_equal "modulename", @parser.format_module_name("module_name")
        assert_equal "newmodulename", @parser.format_module_name("_new_module_name")
    end

    def test_get_module_by_name
        # will create a new module
        mod = @parser.get_module_by_name('newmodule')

        assert_equal CssDoc::Module, mod.class
        assert_equal 'newmodule', mod.name

        # it must return the same module
        mod2 = @parser.get_module_by_name('new_module')
        assert_equal mod, mod2
    end


end