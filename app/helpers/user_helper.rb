module UserHelper

    def display_external_activities_by_param(param="true", user)
        if param == "true"
            return user.external_activities.to_a
        else
            return user.external_previous_activities.to_a
        end
    end
    def display_personal_activities_by_param(param="true", user)
        if param == "true"
            return user.personal_activities.to_a
        else
            return user.personal_previous_activities.to_a
        end
    end

end
