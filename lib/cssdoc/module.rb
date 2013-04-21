require 'json'

module CssDoc

    class Module

        attr_accessor :name
        attr_accessor :variables
        attr_accessor :functions
        attr_accessor :mixins
        attr_accessor :rules

        def initialize(name)
            @name = name

            @variables = []
            @functions = []
            @mixins = []
            @rules = []
        end


        def to_hash
            return {
                @name => {
                    :variables => @variables,
                    :functions => @functions,
                    :mixins => @mixins,
                    :rules => @rules,
                }
            }
        end


        def to_json
            self.to_hash.to_json
        end

    end

end