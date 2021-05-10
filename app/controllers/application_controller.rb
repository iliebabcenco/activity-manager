class ApplicationController < ActionController::Base
    # attr_accessor :username
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        attributes = [:email, :username]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
    def after_sign_in_path_for(resource)
        user_path(current_user) # your path
    end
end
