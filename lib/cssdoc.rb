require 'sass'

module CssDoc

    module Types
        RULE = "rule"
        VARIABLE = "variable"
        MIXIN = "mixin"
        FUNCTION = "function"
    end

    def self.parse_string(str)
        engine = Sass::Engine.new str, :syntax => :scss
        tree = engine.to_tree

        result = Hash.new
        result["type"] = CssDoc::Types::RULE
        result["description"] = tree.children[0].value
        result["selector"] = tree.children[1].rule

        return result
    end

end
