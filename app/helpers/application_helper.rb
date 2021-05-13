module ApplicationHelper
    def display_feed(arr)
        html=""

        arr.each do |each|
            if each.instance_of? User

                html += "<div class='card m-4'>
                <div class='card-header'>
                    <h4 class='mt-3 mb-4 mx-3'>User " + (link_to each.username, user_path(each.id))+" has just registered</h4>
                    </div>
                    <div class='card-content p-4'>"
                
                html += "<p>#{each.created_at}</p> </div>
                </div>"
            elsif (each.instance_of? Activity) && Activity.external.include?(each)
                html += "<div class='card m-4'>
                <div class='card-header'>
                    <h4 class='mt-3 mb-4 mx-3'> User " + (link_to each.author.username, user_path(each.author.id))+" has created a new Activity:</h4>
                    </div>
                    <div class='card-content p-4'>"
                html += "<p>#{each.name} in group: "+(link_to each.group.name, group_path(each.group.id)) +"</p>"
                html += "<p>#{each.created_at}</p> </div>
                </div>"
            elsif each.instance_of? Group
                html += "<div class='card m-4'>
                <div class='card-header'> <h4 class='mt-3 mb-4 mx-3'>User " + (link_to each.creator.username, user_path(each.creator.id))+" has created a new Group:</h4>
                </div>
                <div class='card-content p-4'>"
                html += "<p>" + (link_to each.name, group_path(each.id)) +"</p>"
                html += "<p>#{each.created_at}</p> </div>
                </div>"
            elsif (each.instance_of? ActivityParticipation) && Activity.external.include?(each.activity)
                html += "<div class='card m-4'>
                <div class='card-header'>
                    <h4 class='mt-3 mb-4 mx-3'>User " + (link_to each.participant.username, user_path(each.participant.id))+" now is a participant at #{each.activity.name} activity</h4>
                    </div>
                    <div class='card-content p-4'>"
                html += "<p> From the group " + (link_to each.activity.group.name, group_path(each.id)) +"</p>"
                html += "<p>#{each.created_at}</p> </div>
                </div>"
            end
        end
        html.html_safe

    end
end

