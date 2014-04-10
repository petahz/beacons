class StaticPagesController < ApplicationController
	def index
		@user = User.new
	end

	def discover
	end
end
