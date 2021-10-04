# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
    {user_name: 'author101', first_name: 'Nom', last_name: 'de Plume', email: 'nomDePlume@yahoo.com', password: 'nomDePlume'},
    {user_name: 'editor101', first_name: 'Ed', last_name: 'Tor', email: 'edTor@yahoo.com', password: 'edTor'},
    {user_name: 'publisher101', first_name: 'Lisa', last_name: 'Agent', email: 'lizAgent', password: 'lizAgent'},
    {user_name: 'manager101', first_name: 'Sosha', last_name: 'Mann', email: 'soshaMann@yahoo.com', password: 'soshaMann'}
])

team = Team.create(name: 'Book Publishing Team', goal: "Publish Nom de Plume's new book.")
