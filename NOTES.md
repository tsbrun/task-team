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

Create team
Automatically create a default list 
Route to "team page" that shows all of the team's associated lists 
Default list should show

=> Go from there

*** WED OCT 6 ***

I've come to a realization. I'VE HAD MY MODELS AND ASSOCIATIONS WRONG ALL THIS TIME. 

**USERS AND LISTS SHOULD BE ASSOCIATED THROUGH TASKS**

Many-to-many relationship: many-users-to-many-lists through teams ?

**User**

- has_many :tasks
- has_many :lists, :through ⇒ :tasks
- belongs_to :team

**List**

- has_many :tasks
- has_many :users, :through ⇒ :tasks
- belongs_to :team

**Task**

- belongs_to :user
- belongs_to :list

**Team**

- has_many :users
- has_many :lists

*facepalm* At least the build process will be much quicker this time around. 

First task: edit models (see above) [x]

Second task: new migrations [x]

- `rails g migration AddTeamToUsers team:references`
- `rails g model Task desc:string`
- `rails g migration AddUserToTasks user:references`
- `rails g migration AddListToTasks list:references`

Third task: delete erroneous migrations [x]
- Namely `add_user_to_list` 

Fourth task: drop and reseed db [x]
- create new rails task `db:reseed` (https://nithinbekal.com/posts/rake-db-reseed/)
- run `bin/rails db:reseed`

Fifth task: test new associations with seed data in console []
- team.users << [add users]
- team.lists << [add a list]
- list.tasks << [add a task]
- user.task << [ list.tasks.first ]
- lists.users + users.lists 

Sixth task: make lists a nested resource [x]

**Remaining MVP Features**
NEW BRANCH: assign_user_to_task
[x] Assign a user to a task (drop-down menu) 
   [ demonstrate has_many_through relationship -> access users through associated list ]
NEW BRANCH: update_and_delete
[] Edit team
[] Delete team
[] Edit list
[] Delete list
NEW BRANCH: add_tasks
[] Add task (w/o going to a new page)
[] Edit task (w/o going to a new page)
[] Delete task  

**Stretch Features**
[] team has_many :tasks, through: :lists 
[] Add users to a team (through website, instead of backend)
[] Add convenient links
[] Add minimal styling
[] `rails g migration AddAdminToTeam admin:int` (since it's going to be a user_id -- i.e., first user associated with team) => for Team Leader/Admin feature

collection_select(object, method, collection, value_method, text_method, options = {}, html_options = {})

Drop-down list of users 

object - :task 
method - :user_id
collection - @team.users
value_method - :id
text_method - :user_name

How do you assign a task, though?

Edit tasks on edit_list_path

collection_select(:task, :user_id, @list.team.users, :id, :user_name)