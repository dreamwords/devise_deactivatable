require 'test_helper'

class UserDeactivationTest < ActionDispatch::IntegrationTest
  include Support::Factories
  
  def setup
    @client = create_client
    @user = create_user
  end
    
  test "should return 401 for deactivate without authentication" do
    post "/users/deactivate.json"
    assert_response 401
  end
  
  test "should redirect to sign in page for deactivate without authentication" do
    post "/users/deactivate"
    assert_redirected_to new_user_session_path
  end
  
  test "oauth deactivate" do
    #
    # CASE 1: # should be able to login with the user successfully
    # access token generated
    
    assert_difference "@user.access_tokens.count", +1 do
      post "/oauth2/token", {"client_id" => @client.identifier, "username" => @user.email, "password" => "123456", "grant_type"=>"password", "client_secret" => @client.secret}
      assert_response 200, @response.body
    end
 
    access_token = @user.access_tokens.last.token
    
    # Token generated is OK to use for access resources like projects    
    get "/projects.json", {}, { 'HTTP_AUTHORIZATION' => "Bearer #{access_token}" }
    assert_response 200, @response.body
    
    
    # 
    # CASE 2: # deactivate the user
    #
    # 1) model deactivated
    # 2) access token all destroyed
    # 3) sync gateway user information deleted
       
    assert_difference "@user.access_tokens.count", -1 do      
      post "/users/deactivate.json", {}, { 'HTTP_AUTHORIZATION' => "Bearer #{access_token}" }
      assert_response 200, @response.body
    end
    
    assert_equal true, @user.reload.deactivated?
    assert_not_nil @user.reload.deactivated_at
    
    # all access token for the user should be deleted
    assert_equal 0, @user.access_tokens.count
    
    
    # 
    # CASE 3: # the access token cached by the client are not able to use again
    # 
    
    get "/projects.json", {}, { 'HTTP_AUTHORIZATION' => "Bearer #{access_token}" }
    assert_response 401, @response.body
    
    
    # 
    # CASE 4: # The user should not able to login again
    #    
    
    post "/oauth2/token.json", {"client_id" => @client.identifier, "username" => @user.email, "password" => "123456", "grant_type"=>"password", "client_secret" => @client.secret}
    assert_response 401, @response.body
    assert_equal '{"error":"Account has been deactivated."}', @response.body
  end
end
