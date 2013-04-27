module CssDoc

    class Variable
        attr_accessor :name, :description, :type

        module Types
            STRING = :string
            NUMBER = :number
            BOOLEAN = :boolean
        end

        def initialize
            @name = ""
            @description = ""
            @type = CssDoc::Variable::Types::STRING
        end

    end

end