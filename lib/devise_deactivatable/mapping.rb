module DeviceDeactivatable
  module Mapping
    def self.included(base)
      base.alias_method_chain :default_controllers, :deactivatable
    end
    
    private
    def default_controllers_with_deactivatable(options)
      options[:controllers] ||= {}
      default_controllers_without_deactivatable(options)
    end
  end
end