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

    
  def display_user_page(user)
    html=""
    if user.id == current_user.id
   
      html += "<h3>Hey " + @user.username+"</h3>"
      html += "<ul><li>"+(link_to "Personal activities", personal_activities_path(:sorted => "true"))+"</li>"
      html += "<li>"+(link_to "External activities", external_activities_path)+"</li>"
      
      html += "<li>"+(link_to "All participations", external_activities_path)+"</li>"
      html += "<li>"+(link_to "All groups", groups_path)+"</li>"
      html += "<li>"+(link_to "Feed", root_path)+"</li>"
      html += "<li>"+(link_to "Sign Out", destroy_user_session_path)+"</li></ul>"
    else
        html += "<h3>" + @user.username+"</h3>"
      html += "<li>"+(link_to "External #{@user.username}'s activities", external_activities_path)+"</li>"
      html += "<li>"+(link_to "All #{@user.username}'s participations", external_activities_path)+"</li>"
      html += "<li>"+(link_to "All #{@user.username}'s groups", groups_path)+"</li></ul>"
    #   @user.activities.each do |act| // for future participations
    #     html += link_to "#{act.name}", 
    #     html += link_to "Link for #{link.text}", "#"
    #    end
    end
    html.html_safe
  end

end
