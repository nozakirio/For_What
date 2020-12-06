class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:name, :birthday, :gender, :email]
      )
    devise_parameter_sanitizer.permit(
      :update, keys: [:name, :birthday, :gender, :email, :profile_image]
      )
  end
  
  # 性別区分　0男性,1女性
  GENDER = ["男性",""]
  
  private
    def after_sign_up_path_for(resource)
      root_path
    end
    
    def after_sign_in_path_for(resource)
      root_path
    end
    
    def after_sign_out_path_for(resource)
      root_path
    end
    
end


