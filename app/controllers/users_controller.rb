class UsersController < Devise::RegistrationsController
    def show
        @user = User.find(params[:id])
    end
    def index
        @users = User.all
    end
    def personal_activities
        #@user = User.find(params[:id])
        pers_activities = current_user.personal_activities
    end

    def external_activities
        #@user = User.find(params[:id])
        activities = current_user.external_activities
    end

    private

    def user_params
       params.require(:user).permit(:email, :username)
    #    params.require(:user).permit(:username)
    end
end
