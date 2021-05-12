class ActivityParticipationsController < ApplicationController
    def index
        user = current_user
        user.all_participations
    end
end
