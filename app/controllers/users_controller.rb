class UsersController < Devise::RegistrationsController
    before_action :authenticate_user!
    def show
        @user = User.find(params[:id])
    end
    def index
        @users = User.all
    end
    def personal_activities
        pers_activities = current_user.personal_activities
    end

    def external_activities
        activities = current_user.external_activities
    end

    private

    def user_params
       params.require(:user).permit(:email, :username)
    end
end
