class User < ActiveRecord::Base
  devise :database_authenticatable, :deactivatable, :oauth2_providable, :oauth2_password_grantable
  
  def after_deactivate
    access_tokens.delete_all
  end
end
