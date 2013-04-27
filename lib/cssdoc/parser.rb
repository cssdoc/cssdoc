module CssDoc

    class Parser

        attr_accessor :root
        attr_reader :modules

        def initialize(tree=nil)
            if tree != nil
                @root = tree
            end

            @modules = []
        end

        def parse
            @modules = []

            if @root == nil or not @root.has_children
                @modules.push CssDoc::Module.new
            else
                parse_node @root
            end


            return get_modules_as_hash
        end

        def get_modules_as_hash
            result = {}

            @modules.each do |mod|
                result[mod.name] = mod.to_hash
            end

            return result
        end

        # @param module_name [string]
        # @return [string] A valid module name
        def format_module_name(module_name)
            if module_name == nil
                return CssDoc::Module::DEFAULT_NAME
            end

            return module_name.gsub('_', '')
        end

        # returns a module within the givin name
        # @param module_name [string]
        # @return [CssDoc::Module]
        def get_module_by_name(module_name)
            module_name = format_module_name(module_name)
            
            @modules.each do |mod|
                if mod.name == module_name
                    return mod
                end
            end

            @modules.push CssDoc::Module.new module_name
            return @modules.last
        end

        # Adds a variable to a module by its name
        # @param module_name [string]
        # @param var [CssDoc::Variable]
        def add_variable_to_module(module_name, var)
            mod = get_module_by_name(module_name)
            mod.add_variable var
        end

        def parse_node(node)
            @current_node = node

            node.children.each do |child|
                parse_node child
            end

            if node.class == Sass::Tree::VariableNode
                parse_variable node
            end
        end

        def parse_variable(node)
            var = CssDoc::Variable.new
            var.name = node.name

            add_variable_to_module node.filename, var
        end


    end

end