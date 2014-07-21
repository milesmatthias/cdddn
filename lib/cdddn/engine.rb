module Cdddn
  class Engine < ::Rails::Engine
    isolate_namespace Cdddn

    initializer "myengine.controller" do
        ActiveSupport.on_load(:action_controller) do
            include CdddnActionControllerExtension
        end
    end
  end
end
