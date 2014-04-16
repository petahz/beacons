class ConnectionsController < ApplicationController
	def create
		@project = Project.find(params[:project_id])
		@connection = @project.connections.build(user_id: current_user.id, project_id: @project.id)
		if @connection.save and current_user.hero? 
			redirect_to dashboard_path
		else
			flash[:alert] = "Could not sign up."
			redirect_to project_path(project)
		end
	end

	private
	def project_params
		params.require(:project).permit(:name, :description, :video_url, :supertype)
	end
end
