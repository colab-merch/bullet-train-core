module BulletTrain
  module Roles
    class Engine < ::Rails::Engine
      initializer "bullet_train-roles.config" do |app|
        Role.set_root_path("#{app.root}/config/models")

        app.reloaders << app.config.file_watcher.new([
          Role.full_path
        ]) {}

        config.to_prepare do
          Role.reload(true)
        end
      end
    end
  end
end
