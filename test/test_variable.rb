require 'test/unit'
require 'helper'
require 'cssdoc/variable'

class VariableTest < Test::Unit::TestCase

    attr_accessor :v

    def setup
        @var = CssDoc::Variable.new
    end

    def teardown
        @var = nil
    end

	def test_init_a_variable
        assert_equal @var.name, ""
        assert_equal @var.description, ""
        assert_equal @var.type, CssDoc::Variable::Types::STRING
        assert_equal @var.value, nil
    end

    def test_to_hash
        @var.name = 'varname'
        @var.description = 'something cool'

        expected = TestHelper.get_default_variable({ :name => 'varname', :description => 'something cool' })

        assert_equal expected, @var.to_hash
    end

end
