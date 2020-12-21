class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:about, :top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:name, :birthday, :gender, :email]
    )
    devise_parameter_sanitizer.permit(
      :update, keys: [:name, :birthday, :gender, :email, :profile_image, :password]
    )
  end

  private

  def after_sign_up_path_for(resource)
    user_path(current_user)
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
