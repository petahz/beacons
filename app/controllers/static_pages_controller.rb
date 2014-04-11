class StaticPagesController < ApplicationController
	before_action :authenticate_user!, only: [:discover]

	def index
		@user = User.new
	end

	def about
	end

	def discover
	end

	def projectsunshine
	end
end
