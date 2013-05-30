require 'tilt'

module JsAssets
  module Unindent
    # http://bit.ly/aze9FV
    # Strip leading whitespace from each line that is the same as the
    # amount of whitespace on the first line of the string.
    # Leaves _additional_ indentation on later lines intact.
    def unindent(text)
      text.gsub /^#{text[/\A\s*/]}/, ''
    end
  end

  class TiltJavascript < Tilt::Template

    include Unindent

    def self.default_mime_type
      'application/javascript'
    end

    def compiler
      @compiler ||= JavascriptCompiler.new Config.source_files, Config.source_paths, Config.patch_files, Config.patch_paths
    end

    def evaluate(scope, locals, &block)
      compiled = compiler.precompile Config.precompile_method, data, *Config.options
      unindent compiled
    end

    def initialize_engine
    end

    protected

    def prepare; end
  end
end
