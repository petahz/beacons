namespace :db do

	desc "Create test data for development environment"
	task :reset => [:environment] do

    # This could go into the seeds.rb file.
		if Rails.env.development?
			users_count = ENV["USERS"] || 5
			names = %w(alice bob charlie danny jay krissy lenny)
			nouns = %w(elephant froyo garden hotpepper icecream)
			descriptors = %w(lover champion fanatic enthusiast dreamer)

			exists = []
			users_count.to_i.times do
				# This is to work with the unique validations for the username attribute in the User Model.
        user = User.new(password: "superhero", role: "hero")
				while !user.valid?
          user.username = names.sample + nouns.sample + descriptors.sample
					user.email = "#{user.username}@gmail.com"
        end
				user.save
      end

			users = User.all
			users.each do |user|
				puts user.username
			end
		end
	end
end
