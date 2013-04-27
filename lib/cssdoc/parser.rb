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

        # @return [Hash]
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

            current_dir = Dir.pwd
            if module_name.start_with? current_dir
                module_name = module_name[ current_dir.length+1, module_name.length ]
            end

            return module_name.gsub('_', '').gsub(/\.\w+$/, '')
        end

        # @param comment_node [Sass::Tree:CommentNode]
        # @return [Hash]
        def format_comment_node(comment_node)
            result = { :description => [] }

            comment_node.value.each do |line|
                result[:description].push line.gsub(/^\/\*/, '').gsub(/\*\/$/, '').strip
            end

            result[:description] = result[:description].join

            return result
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

        # @param node [Sass::Tree:Node]
        # @param parent_node [Sass::Tree:Node]
        # @return [hash]
        def get_comment_from_node(node, parent_node)
            comment = {}
            return comment if parent_node == nil

            index = 0
            parent_node.children.each do |child|

                if node == child
                    if index == 0
                        # first node doesn't have comments
                        return comment
                    end

                    previous_node = parent_node.children[index - 1]

                    if previous_node.class == Sass::Tree::CommentNode
                        # We are lucky, there is a comment for this node
                        return format_comment_node(previous_node)
                    end
                end
                index += 1

            end

            return comment
        end

        # Adds a variable to a module by its name
        # @param module_name [string]
        # @param var [CssDoc::Variable]
        def add_variable_to_module(module_name, var)
            mod = get_module_by_name(module_name)
            mod.add_variable var
        end


        # Parses a node
        # @param node [Sass::Tree::Node]
        # @param [parent_node=nil] [Sass::Tree::Node]
        def parse_node(node, parent_node=nil)
            node.children.each do |child|
                parse_node child, node
            end

            if node.class == Sass::Tree::VariableNode
                parse_variable node, parent_node
            end
        end

        # @param node [Sass::Tree::Node]
        # @param [parent_node] [Sass::Tree::Node]
        def parse_variable(node, parent_node=nil)
            var = CssDoc::Variable.new
            var.name = node.name

            comment = get_comment_from_node(node, parent_node)
            
            if not comment.empty?
                var.description = comment[:description]
            end

            add_variable_to_module node.filename, var
        end

    end

end
