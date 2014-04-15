class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]

	def dashboard
		@user = User.find(current_user.id)
		if @user.owner?
			render 'ownerdashboard'
		elsif @user.hero?
			render 'herodashboard'
		end
	end
end
