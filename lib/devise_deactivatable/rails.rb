module DeviceDeactivatable
  class Engine < ::Rails::Engine
    ActiveSupport.on_load(:action_controller) do
      include DeviceDeactivatable::Controllers::Helpers
    end

    config.after_initialize do
      Devise::Mapping.send :include, DeviceDeactivatable::Mapping
    end
  end
end
