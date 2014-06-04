module ActionDispatch::Routing
  class Mapper

  protected
    def devise_deactivate(mapping, controllers)
      resource :deactivate, only: [:create], 
                            path: mapping.path_names[ :deactivate ],
                            controller: controllers[ :deactivate ]
    end
  end
end
