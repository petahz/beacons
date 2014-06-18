namespace :db do
	Rake::Task["db:reset"].clear

	desc "Create test data for development environment"
	task :reset => [:environment, 'db:drop', 'db:create', 'db:migrate'] do

		if Rails.env.development?
			# Clear data from last run.
			User.delete_all
			users_count = ENV["USERS"] || 5
			names = ["alice", "bob", "charlie", "danny", "jay", "krissy", "lenny"]
			nouns = ["elephant", "froyo", "garden", "hotpepper", "icecream"]
			descriptors = ["lover", "champion", "fanatic", "enthusiast", "dreamer"]

			id_count = 0
			exists = []
			users_count.to_i.times do
				# This is to work with the unique validations for the username attribute in the User Model.
				while true
					name = names[Random.rand(names.length)]
					noun = nouns[Random.rand(nouns.length)]
					descriptor = descriptors[Random.rand(descriptors.length)]
					username = name + noun + descriptor
					if exists.include?(username)
						next
					else
						exists << username
						break
					end
				end
				id_count += 1
				User.create!(id: id_count,
					username: username,
					email: "#{username}@gmail.com",
					password: "superhero",
					role: "hero")
			end

			users = User.all
			users.each do |user|
				puts user.username
			end
		end
	end
end
