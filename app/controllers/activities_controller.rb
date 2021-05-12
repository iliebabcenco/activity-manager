class ActivitiesController < ApplicationController
    before_action :authenticate_user!
    def index
        @activities = Activity.all
    end
    def new
        @activity = Activity.new
        # id = session[:current_user_id]
        # @user = User.find(id) unless id.nil?
    end
    def new_external
        @activity = Activity.new
        # id = session[:current_user_id]
        # @user = User.find(id) unless id.nil?
    end
    def create_personal

        user = current_user
        activity = user.create_personal_activity(activity_personal_params)
        if activity
            redirect_to personal_activities_path, notice: 'Your activity was successfuly created!'
        else
            render :new, alert: "Something wrong"
        end
        
    end

    def create_external

        user = current_user

        activity = user.create_external_activity(activity_external_params)

        if activity
            redirect_to external_activities_path, notice: 'Your activity was successfuly created!'
        else
            render :new, alert: "Something wrong"
        end
        
    end

    private

    def activity_personal_params
        params.require(:activity).permit([:name, :description, :schedule_date])
    end

    def activity_external_params
        params.require(:activity).permit([:name, :description, :schedule_date, :group_id])
    end

end
