module CssDoc

    class Variable
        attr_accessor :name, :description, :type, :value

        module Types
            STRING = :string
            NUMBER = :number
            BOOLEAN = :boolean
        end

        def initialize
            @name = ""
            @description = ""
            @type = CssDoc::Variable::Types::STRING
            @value = nil
        end

        def value=(value)
            @value = value.to_s.gsub(/(^")|("$)/, '')
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
