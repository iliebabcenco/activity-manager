module UserHelper

    def display_activities_by_param(param, user)
        if param == "true"
            return user.personal_activities.to_a
        else
            return user.personal_previous_activities.to_a
        end
    end

end
