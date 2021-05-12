module ActivityHelper
    def display_participation_button(activity, user)

        if user.id != activity.author_id || !activity.participants.include?(user)
            render 'participation_form', activity: activity
           # render activity.participants
        end
    end

     
end
