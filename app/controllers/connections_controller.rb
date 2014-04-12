class ConnectionsController < ApplicationController
	def create
		@project = Project.find(project_params)
		@connection = Connection.new(user_id: current_user.id, project_id: @project.id)
		if @connection.save
			redirect_to dashboard_path
		else
			flash[:error] = "Could not sign up."
			redirect_to project_path(project)
		end
	end

	private
	def project_params
		params.require(:project).permit(:name, :description, :video_url, :supertype)
	end
end
