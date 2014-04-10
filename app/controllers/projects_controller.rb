class ProjectsController < ApplicationController
	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.user = current_user
		if @project.save
			redirect_to dashboard_path
		else
			head(403)
		end
	end

	def destroy
		@project.destroy

		redirect_to dashboard_path
	end

	private
	def project_params
		params.require(:project).permit(:name, :description, :video_url, :supertype)
	end
end
