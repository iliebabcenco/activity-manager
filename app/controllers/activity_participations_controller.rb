class ActivityParticipationsController < ApplicationController
  before_action :authenticate_user!
  def index
    user = current_user
    user.all_participations
  end

  def create
    ap = ActivityParticipation.new(ap_params)
    gr = Activity.find(ap.activity_id).group
    if ap.save
      redirect_to group_path(gr.id), notice: 'Now you participate to activity!'
    else
      redirect_to group_path(gr.id), alert: ap.errors.full_messages
    end
  end

  private

  def ap_params
    params.require(:activity_participation).permit(%i[participant_id activity_id])
  end
end
