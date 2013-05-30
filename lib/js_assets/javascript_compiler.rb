# Based on https://github.com/josh/ruby-coffee-script
require 'execjs'
require 'pathname'

module JsAssets
  class JavascriptCompiler
    attr_accessor :patch_paths, :patches, :sources, :source_paths

    def initialize(sources, source_paths, patches, patch_paths)
      self.sources = sources
      self.source_paths = source_paths
      self.patches = patches
      self.patch_paths = patch_paths
    end


    def precompile(method_name, *args)
      context.call method_name, *args
    end

    protected

    def context
      @context ||= ExecJS.compile patched_source
    end

    def append_files(files)
      files.inject("") do |source, file|
        source << file.read
      end
    end

    def find_files(file_names, paths)
      file_names.map do |file_name|
        find_file_in_paths file_name, paths
      end.compact
    end

    def find_file_in_paths(file_name, paths)
      paths.map do |path|
        Pathname(path) + file_name
      end.find do |file|
        file.exist?
      end
    end

    def read_patches
      if patches.any?
        append_files patch_files
      else
        ""
      end
    end

    def read_source
      if sources.any?
        append_files source_files
      else
        ""
      end
    end

    def patch_files
      find_files patches, patch_paths
    end

    def patch_text
      @patch_text ||= read_patches
    end

    def patched_source
      @patched_source ||= (source_text + patch_text)
    end

    def source_files
      find_files sources, source_paths
    end

    def source_text
      @source_text ||= read_source
    end

  end
end
