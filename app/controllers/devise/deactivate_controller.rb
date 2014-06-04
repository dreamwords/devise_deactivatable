class Devise::DeactivateController < DeviseController
  prepend_before_filter :authenticate_deactivatee!
  
  # POST /resource/deactivate
  def create
    @resource = current_deactivatee
    @resource.deactivate! if @resource
    head :ok
  rescue
    respond_with @resource
  end    
  
  protected
  
  def current_deactivatee
    authenticate_deactivatee!
  end
end