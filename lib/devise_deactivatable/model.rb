module Devise
  module Models
    module Deactivatable
      def self.required_fields(klass)
        attributes = [:deactivated_at]
        attributes
      end
      
      # Overwrites active_for_authentication? from Devise::Models::Activatable for deactivate purposes
      # by verifying whether a user is active to sign in or not based on deactivated?
      def active_for_authentication?
        !deactivated? && super
      end

      def deactivate!
        self.deactivated_at = Time.now
        save!(:validate => false)
      end      

      def deactivated?
        !!deactivated_at
      end
      
      # Overwrites invalid_message from Devise::Models::Authenticatable to define
      # the correct reason for blocking the sign in.
      def inactive_message
        deactivated? ? :deactivated : super
      end
    end
  end
end