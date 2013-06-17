module CssDoc

    class Variable
        attr_accessor :name, :description, :type, :value

        module Types
            STRING = :string
            NUMBER = :number
            BOOLEAN = :boolean
            COLOR = :color
        end

        def initialize
            @name = ""
            @description = ""
            @type = CssDoc::Variable::Types::STRING
            @value = nil
        end

        def value=(value)
            if value.class == Sass::Script::Number
                @value = value.value
                @type = CssDoc::Variable::Types::NUMBER

            elsif value.class == Sass::Script::Bool
                @value = value.value
                @type = CssDoc::Variable::Types::BOOLEAN

            elsif value.class == Sass::Script::Color
                @value = value
                @type = CssDoc::Variable::Types::COLOR

            elsif value == nil
                @value = nil
                @type = CssDoc::Variable::Types::STRING

            else
                @value = value.value
                @type = CssDoc::Variable::Types::STRING
            end
        end

        def to_hash
            return {
                :name => @name,
                :description => @description,
                :type => @type,
                :value => @value
            }
        end

    end

end
