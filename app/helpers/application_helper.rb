module ApplicationHelper
  def display_feed(arr)
    html = ''

    arr.each do |each|
      if each.instance_of? User
        html += "<div class='feed-part'><h4>User #{link_to each.username, user_path(each.id)} "
        html += "has just registered</h4><p>#{each.created_at}</p></div>"
      elsif each.instance_of? Activity
        html += "<div class='feed-part'><h4>User "
        html += "#{link_to each.author.username, user_path(each.author.id)} has created a new Activity:</h4>"
        html += "<p>#{each.name}</p>"
        html += "<p>#{each.created_at}</p></div>"
      elsif (each.instance_of? ActivityParticipation) && check_including_external(each.activity)
        html += "<div class='feed-part'><h4>"
        html += "User #{link_to each.participant.username, user_path(each.participant.id)}"
        html += " now is a participant at #{each.activity.name} activity</h4>"
        html += "<p> From the group #{link_to each.activity.group.name, group_path(each.id)}</p>"
        html += "<p>#{each.created_at}</div>"
      elsif each.instance_of? Group
        html += "<div class='feed-part'><h4>User "
        html += "#{link_to each.creator.username, user_path(each.creator.id)} has created a new Group:</h4>"
        html += "<p>#{link_to each.name, group_path(each.id)}</p>"
        html += "<p>#{each.created_at}</p></div>"
      end
    end
    html.html_safe
  end

  def check_including_external(obj)
    Activity.external.include?(obj)
  end

  def display_errors(obj)
    return unless obj.errors.full_messages.any?

    content_tag :p, "You are doing something wrong: #{obj.errors.full_messages.join('. ')}", class: 'errors'
  end

  def display_flash(flash)
    return if flash.empty?

    content_tag :p, "You are doing something wrong: #{flash.to_a.join('. ')}", class: 'errors'
  end

  def render_notification(notice, class_name)
    return unless notice.present?

    box_wrapper(class_name) do
      notice
    end
  end

  private

  def box_wrapper(class_name, &block)
    content = capture(&block)
    content_tag(:div, content, class: class_name)
  end
end
