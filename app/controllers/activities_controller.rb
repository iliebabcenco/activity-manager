class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def new_external
    @activity = Activity.new
  end

  def create_personal
    user = current_user
    @activity = user.create_personal_activity(activity_personal_params)
    if @activity.errors.any?
      render :new
    else
      redirect_to personal_activities_path, notice: 'Your activity was successfuly created!'
    end
  end

  def create_external
    user = current_user
    activity = user.create_external_activity(activity_external_params)
    if activity.errors.any?
      redirect_to activities_new_external_path(group: activity.group_id),
                  flash: { error: activity.errors.full_messages.join(', ') }
    else
      redirect_to external_activities_path, notice: 'Your activity was successfuly created!'
    end
  end

  private

  def activity_personal_params
    params.require(:activity).permit(%i[name description schedule_date])
  end

  def activity_external_params
    params.require(:activity).permit(%i[name description schedule_date group_id])
  end
end
