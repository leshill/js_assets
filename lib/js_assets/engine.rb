module JsAssets
  class Engine < ::Rails::Engine
    initializer "sprockets.handlebars", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets

      Config.extensions.each do |ext|
        app.assets.register_engine ext, AssetCompiler
      end
    end
  end
end
