require 'test_helper'

class DeactivatableTest < ActiveSupport::TestCase
  include Support::Factories
  
  test "model" do
    exception = assert_raise(Devise::Models::MissingAttribute) do
      Devise::Models.check_fields!(Admin)
    end
    assert_equal exception.message, "The following attribute(s) is (are) missing on your model: deactivated_at"
  end
    
  test "should deactivated scope change" do
    assert_difference 'User.deactivated.count', +1 do
      user = create_user
      user.deactivate!
    end
  end
  
  test "should generate deactivated_at" do
    user = create_user
          
    assert_nil user.deactivated_at
    assert_equal false, user.deactivated?
    
    user.deactivate!
    
    assert_equal true, user.deactivated?
    assert_not_nil user.deactivated_at
    assert_equal true, (Time.now - user.deactivated_at) < 3      
  end
  
  test "should call after_deactivated" do
    user = create_user
    user.update_attributes!(sign_in_count: 100)
    
    assert_equal 100, user.reload.sign_in_count
    
    class << user
      def after_deactivate
        update_attributes(sign_in_count: 0)
      end
    end
    
    user.deactivate!
    
    assert_equal 0, user.reload.sign_in_count
  end
end