class ActivityController < ApplicationController
    def index
        @activities = Activity.all
    end
end
