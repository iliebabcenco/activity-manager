class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    user = current_user
    @group = user.groups.build(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @activity_participation = ActivityParticipation.new
  end

  private

  def group_params
    params.require(:group).permit(%i[name icon])
  end
end
