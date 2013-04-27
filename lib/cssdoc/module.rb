module CssDoc

    class Module

        attr_accessor :name
        attr_accessor :variables
        attr_accessor :functions
        attr_accessor :mixins
        attr_accessor :rules

        # Default name when this class is initialized without a name
        DEFAULT_NAME = "root"

        def initialize(name=nil)
            @name = name != nil ? name : DEFAULT_NAME

            @variables = []
            @functions = []
            @mixins = []
            @rules = []
        end


        def to_hash
            return {
                :variables => @variables.map { |var| var.to_hash },
                :functions => @functions,
                :mixins => @mixins,
                :rules => @rules,
            }
        end

        # @param var [CssDoc::Variable]
        def add_variable(var)
            @variables.push var
        end

    end

end
