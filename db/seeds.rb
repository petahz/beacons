# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Project.delete_all
Connection.delete_all

User.create!(id: 1,
	username: "projectsunshine",
	email: "person@projectsunshine.org",
	password: "letitshine",
	role: "owner")

Project.create!(id: 1,
	name: "Project Sunshine",
	description: "Send Sunny Grams to save the day.",
	supertype: "Lightning")

Connection.create!(user_id: 1,
	project_id: 1)