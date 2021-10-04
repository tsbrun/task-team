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

CURRENT TASK

=> I think this warrants a new branch

[] Add team members to a team

What do I need to complete this feature?
[] Association between User and Team
   [] Team has_many :users through :lists 
   [] Team has_many :lists 
   [] User has_many 

A User should belong to a team, no? Can one model belong to many other models? What kind of relationship does that create? Would it satisfy the requirements for my project?

I need to figure this out before proceeding.

[] Column on Team db table for :leader ??? Should point to the id of a specific user 
[] Field to add Team Leader and Team Members => load @team.leader as: team_leader and @team.users as: team_members

Upon creation of an instance of Team, automatically create an associated instance of List
   if @team.save 
      @team.create_list(name: `#{@team.name} List`)