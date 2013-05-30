module JsAssets
  # Change config options in an initializer:
  #
  # JsAssets::Config.sources = 'my_source.js'
  module Config
    extend self

    attr_writer :extensions, :options, :patch_files, :patch_paths, :precompile_method, :source_files, :source_paths

    def configure
      yield self
    end

    def extensions
      Array(@extensions)
    end

    def options
      Array(@options)
    end

    def patch_files
      Array(@patch_files)
    end

    def patch_paths
      paths_or_default @patch_paths
    end

    def precompile_method
      @precompile_method
    end

    def source_files
      Array(@source_files)
    end

    def source_paths
      paths_or_default @source_paths
    end

    private

    def paths_or_default(paths)
      paths = Array(paths)
      paths << JsAssets.default_path
      paths
    end
  end
end
