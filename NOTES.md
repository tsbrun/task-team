This is stuff I want to put on the team#show view
 <!-- Team Leader: <%= @team.leader.name %> 
 Team Members
 <ul>
    <% @team.members.each do |member| %>
    <li><%= `#{member.name} | #{member.role}` %></li>
    <% end %>
 </ul>

 Team Tasks - ??? -->

 [] Abstract the new_team form into a partial so I can reuse it for the edit_team view.

 [] Restrict access to teams the user is part of on teams#index view (that way you can reroute to this view upon creation of a team)
  => Team.all.where team_leader equals current_user || team_members include current_user