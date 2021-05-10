class UsersController < Devise::RegistrationsController
    def show
        @user = User.find(params[:id])
    end
    def index
        @users = User.all
    end

    private

    def user_params
       params.require(:user).permit(:email, :username)
    #    params.require(:user).permit(:username)
    end
end
