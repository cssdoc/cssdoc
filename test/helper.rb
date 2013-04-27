class TestHelper

    def self.get_empty_module
        empty_module = Hash.new
        empty_module[CssDoc::Module::DEFAULT_NAME] = self.get_default_module()
        return empty_module
    end

    def self.get_default_module(values={})
        return {
            :variables => (values[:variables] or []),
            :functions => (values[:functions] or []),
            :mixins => (values[:mixins] or []),
            :rules => (values[:rules] or [])
        }
    end


    def self.get_default_variable(values={})
        return {
            :name => (values[:name] or ""),
            :description => (values[:description] or ""),
            :type => (values[:type] or :string)
        }
    end

    def self.chdir(*path)
        Dir.chdir File.join(File.dirname(__FILE__), path)
    end

end
