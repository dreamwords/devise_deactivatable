class Devise::DeactivateController < DeviseController
  prepend_before_filter :authenticate_deactivatee!
  
  # POST /resource/deactivate
  def create
    @resource = current_deactivatee
    @resource.deactivate! if @resource
    
    respond_to do |format|
      format.json { head :ok }
      format.any(*navigational_formats) { redirect_to after_deactivate_path_for(resource_name) }
    end    
  rescue
    respond_with @resource
  end    
  
  def test
  end
  
  protected
  
  def current_deactivatee
    authenticate_deactivatee!
  end
  
  # The path used after deactivated
  def after_deactivate_path_for(resource_name)
    new_session_path(resource_name) if is_navigational_format?
  end
  
end