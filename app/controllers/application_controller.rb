class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @feed = User.feed_arr
  end

  protected

  def configure_permitted_parameters
    attributes = %i[email username]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def after_sign_in_path_for(_resource)
    user_path(current_user)
  end
end
