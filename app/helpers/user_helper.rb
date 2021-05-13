module UserHelper
  def display_external_activities_by_param(user, param = 'true')
    if param == 'true'
      user.external_activities.to_a
    else
      user.external_previous_activities.to_a
    end
  end

  def display_personal_activities(user, param = 'true')
    if param == 'true'
      user.personal_recent_activities.to_a
    else
      user.personal_previous_activities.to_a
    end
  end

  def display_participation_activities(user, param = 'true')
    if param == 'true'
      user.all_participations.to_a
    else
      user.all_desc_participations.to_a
    end
  end

  def display_user_page(user)
    html = ''
    if user.id == current_user.id

      html += "<h3 class='text-white h4 ms-3 mb-5'>Hey #{@user.username}</h3>"
      html += "<ul class='nav flex-column'><li class='nav-item'>
      #{link_to 'Personal activities', personal_activities_path, class: 'nav-link active text-white'}<hr></li>"

      html += "<li class='nav-item'>
      #{link_to 'Group activities', external_activities_path, class: 'nav-link active text-white'}<hr></li>"

      html += "<li class='nav-item'>
      #{link_to 'All participations', activity_participations_path, class: 'nav-link active text-white'} <hr></li>"

      html += "<li class='nav-item'>
      #{link_to 'All groups', groups_path, class: 'nav-link active text-white'}<hr></li>"

      html += "<li class='nav-item'>
      #{link_to 'Feed', feed_path, class: 'nav-link active text-white'}<hr></li>"

      html += "<li class='nav-item'>
      #{link_to 'Sign Out', destroy_user_session_path, class: 'nav-link active text-white'}</li></ul>"

    end
    html.html_safe
  end
end
