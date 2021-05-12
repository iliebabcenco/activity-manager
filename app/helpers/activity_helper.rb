module ActivityHelper
    def display_participation_button(activity, user)

        unless activity.participants.include?(user)
            render 'participation_form', activity: activity
        end
    end
    def display_participants(activity, user)

        unless activity.participants.empty?
           render activity.participants
        end
    end

     
end
