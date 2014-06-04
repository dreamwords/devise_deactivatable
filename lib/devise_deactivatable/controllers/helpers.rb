module DeviceDeactivatable
  module Controllers
    module Helpers
      extend ActiveSupport::Concern
  
      protected
      def authenticate_deactivatee!
        send(:"authenticate_#{resource_name}!", :force => true)
      end
    end
  end  
end

