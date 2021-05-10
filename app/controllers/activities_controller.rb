class ActivitiesController < ApplicationController
    def index
        @activities = Activity.all
    end
    def new
        @activity = Activity.new
        # id = session[:current_user_id]
        # @user = User.find(id) unless id.nil?
    end
    def create

        @user = current_user
        @activity = @user.activities.build(activity_params)
        if @activity.save
            redirect_to root_path, notice: 'Your activity was successfuly created!'
        else
            render :new, alert: "Something wrong"
        end
        
    end

    private

    def activity_params
        params.require(:activity).permit([:name, :amount])
    end

end
