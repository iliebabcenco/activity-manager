module UserHelper

  def display_external_activities_by_param(param="true", user)
      if param == "true"
          return user.external_activities.to_a
      else
          return user.external_previous_activities.to_a
      end
  end
  def display_personal_activities(param="true", user)
      if param == "true"
          return user.personal_activities.to_a
      else
          return user.personal_previous_activities.to_a
      end
  end
  def display_participation_activities(param="true", user)
    if param == "true"
        return user.all_participations.to_a
    else
        return user.all_desc_participations.to_a
    end
  end

    
  def display_user_page(user)
    html=""
    if user.id == current_user.id
   
      html += "<h3>Hey " + @user.username+"</h3>"
      html += "<ul><li>"+(link_to "Personal activities", personal_activities_path)+"</li>"
      html += "<li>"+(link_to "External activities", external_activities_path)+"</li>"
      
      html += "<li>"+(link_to "All participations", activity_participations_path)+"</li>"
      html += "<li>"+(link_to "All groups", groups_path)+"</li>"
      html += "<li>"+(link_to "Feed", feed_path)+"</li>"
      html += "<li>"+(link_to "Sign Out", destroy_user_session_path)+"</li></ul>"
    
  
    end
    html.html_safe
  end

end
