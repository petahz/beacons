class ConnectionsController < ApplicationController
	def create
		@project = Project.find(params[:project_id])
		if current_user.hero?
			@connection = @project.connections.build(user_id: current_user.id, project_id: @project.id)
			if @connection.save
				redirect_to dashboard_path
			else
				flash[:alert] = "You have already signed up
				for this mission!"
				redirect_to project_path(@project)
			end
		else
			flash[:alert] = "Non-profits cannot sign up for missions!"
			redirect_to project_path(@project)
		end
	end

	private
	def project_params
		params.require(:project).permit(:name, :description, :video_url, :supertype)
	end
end
