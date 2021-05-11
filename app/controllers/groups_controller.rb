class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end
    def new
        @group = Group.new
    end
    def create
        user = current_user
        group = user.groups.build(group_params)
        if group.save
            redirect_to groups_path, notice: "groups has been successfuly created"
        else
            render :new, alert: "something wrong with group creation"
        end
    end
    def show
        @group = Group.find(params[:id])

    end


    private

    def group_params
        params.require(:group).permit([:name, :icon])
    end
end
