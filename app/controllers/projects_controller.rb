class ProjectsController < ApplicationController
	def create
	end

	def destroy
	end

	private

	def project_params
		params.require(:project).permit()
	end
end
