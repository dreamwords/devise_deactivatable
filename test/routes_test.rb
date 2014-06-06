require 'test_helper'

class RoutesTest < ActionController::TestCase
  test 'devise deactivate route' do
    assert_recognizes({:controller => 'devise/deactivate', :action => 'create'}, {:path => 'users/deactivate', :method => :post})
  end
end
