module CssDoc

    module RuleTypes
        INVALID = 'invalid'
        SELECTOR = 'selector'
    end

    class Rule
        attr_accessor :file
        attr_accessor :line
        attr_accessor :description

        # @!attribute [w]
        #   @return [string]
        def selector=(selector)
            @type = CssDoc::RuleTypes::SELECTOR
            @selector = selector
        end

        # @!attribute [r]
        #   @return [string]
        def selector; @selector; end

        # @!attribute [r]
        #   @return [CssDoc::RuleTypes] The type of the rule
        def type
            @type or CssDoc::RuleTypes::INVALID
        end

        def initialize(selector='')
            self.selector = selector
            @file = ''
            @line = ''
            @description = ''
        end

        # @return [Hash]
        def to_hash
            return {
                :file => @file,
                :line => @line,
                :description => @description,
                :type => @type,
                :selector => @selector
            }
        end

        # @return [string]
        def to_json
            return self.to_hash.to_json
        end

    end

end
