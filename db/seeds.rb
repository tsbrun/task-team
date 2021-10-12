# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a new team
team = Team.create(name: 'Book Publishing Team', goal: "Publish Nom de Plume's new book.")

# Add members to the team
team.users.build([
    {user_name: 'author101', first_name: 'Nom', last_name: 'de Plume', email: 'nomDePlume@yahoo.com', password: 'nomDePlume'},
    # AR mysteriously refuses to create editor and publisher
    #{user_name: 'editor101', first_name: 'Ed', last_name: 'Tor', email: 'edTor@yahoo.com', password: 'edTor'},
    #{user_name: 'publisher101', first_name: 'Lisa', last_name: 'Agent', email: 'lizAgent', password: 'lizAgent'},
    {user_name: 'manager101', first_name: 'Sosha', last_name: 'Mann', email: 'soshaMann@yahoo.com', password: 'soshaMann'}
]).each { |user| user.save }

# Create a team list
team.lists.build(title: "Publish Book").save 

# Add tasks to the list
list = team.lists.first 
list.tasks.build([
    {desc: "Send final draft to editor"},
    {desc: "Approve final edits"},
    {desc: "Coordinate shipment of hardcopies to bookstore"},
    {desc: "Tease new book on Instagram and Twitter"}
]).each { |task| task.save }

# create second team
team = Team.create(name: 'Grocery Night Shift', goal: 'n/a')
team.users.build([
    {user_name: 'stocker', first_name: 'Jeff', last_name: 'Smith', email: 'jeffsmith@gmail.com', password: 'stockerjeff'},
    {user_name: 'cashier', first_name: 'Cindy', last_name: 'Simpson', email: 'cindysimpson@gmail.com', password: 'cashiercindy'},
    {user_name: 'janitor', first_name: 'Bob', last_name: 'Reynolds', email: 'bobreynolds@gmail.com', password: 'janitorbob'}
]).each { |user| user.save }
team.lists.build(title: 'Closing Time').save 
list = team.lists.first 
list.tasks.build([
    {desc: 'Restock milk freezer'},
    {desc: 'Count cash in register'},
    {desc: 'Mop floors'}
]).each { |task| task.save }