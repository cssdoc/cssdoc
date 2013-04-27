require 'test/unit'
require 'cssdoc/variable'

class VariableTest < Test::Unit::TestCase

    attr_accessor :v

    def setup
        @v = CssDoc::Variable.new
    end

    def teardown
        @v = nil
    end

	def test_init_a_variable
        assert_equal @v.name, ""
        assert_equal @v.description, ""
        assert_equal @v.type, CssDoc::Variable::Types::STRING
    end

end
