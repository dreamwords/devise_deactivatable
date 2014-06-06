class ProjectsController < ApplicationController
  before_action :authenticate_user!
  respond_to :json
  
  def index
    head :ok
  end
end
