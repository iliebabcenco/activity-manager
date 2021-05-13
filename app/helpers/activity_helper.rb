module ActivityHelper
  def display_participation_button(activity, user)
    render 'participation_form', activity: activity unless activity.participants.include?(user)
  end

  def display_participants(activity, _user)
    render activity.participants unless activity.participants.empty?
  end
end
