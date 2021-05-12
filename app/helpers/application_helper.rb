module ApplicationHelper
    def display_feed(arr)
        html=""

        arr.each do |each|
            if each.instance_of? User

                html += "<p>User " + (link_to each.username, user_path(each.id))+" has just registered</p>"
                
                html += "<p>#{each.created_at}</p> <hr>"
            elsif (each.instance_of? Activity) && Activity.external.include?(each)
                html += "<p>User " + (link_to each.author.username, user_path(each.author.id))+" has created a new Activity:</p>"
                html += "<p>#{each.name} in group: "+(link_to each.group.name, group_path(each.group.id)) +"</p>"
                html += "<p>#{each.created_at}</p> <hr>"
            elsif each.instance_of? Group
                html += "<p>User " + (link_to each.creator.username, user_path(each.creator.id))+" has created a new Group:</p>"
                html += "<p>" + (link_to each.name, group_path(each.id)) +"</p>"
                html += "<p>#{each.created_at}</p> <hr>"
            elsif (each.instance_of? ActivityParticipation) && Activity.external.include?(each.activity)
                html += "<p>User " + (link_to each.participant.username, user_path(each.participant.id))+" now is a participant at #{each.activity.name} activity</p>"
                html += "<p> From the group " + (link_to each.activity.group.name, group_path(each.id)) +"</p>"
                html += "<p>#{each.created_at}</p> <hr>"
            end
        end
        html.html_safe

    end
end
