require 'rubygems'
require 'cssdoc/parser'
require 'cssdoc/module'
require 'cssdoc/rule'
require 'sass'

module CssDoc

    # Enum for types
    module Types
        RULE = :rule
        VARIABLE = :variable
        MIXIN = :mixin
        FUNCTION = :function
    end

    # Parses the given string
    # @param str [String] The string to be parsed
    # @param syntax [Symbol] The type of the given string (:scss, :sass, :css)
    # @return [Hash]
    def self.parse_string(str, syntax=:scss)
        engine = Sass::Engine.new str, :syntax => syntax
        parser = CssDoc::Parser.new engine.to_tree

        return parser.parse
    end

    # Reades the given file and parses its content
    # @param path [String] Path to the file
    # @param [syntax=:scss] [Symbol]
    # @return [Hash]
    def self.parse_file(path, syntax=:scss)
        engine = Sass::Engine.for_file path, :syntax => syntax, :cache => false
        parser = CssDoc::Parser.new engine.to_tree

        return parser.parse
    end

end
