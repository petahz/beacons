class ProjectsController < ApplicationController
	before_action :find_project, only: [:show, :edit, :update, :destroy]

	def show
		# Ability to create new connection on project's show page.
		@connection = Connection.new(user_id: current_user.id, project_id: @project.id)
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to dashboard_path
			@connection = Connection.create(user_id: current_user.id, 
			project_id: @project.id)
		else
			render action: 'new'
		end
	end

	def edit
	end

	def update
		if @project.update(project_params)
			redirect_to dashboard_path
		else
			flash[:alert] = "Missing required fields."
			render action: 'edit'
		end
	end

	def destroy
		@project.destroy
		redirect_to dashboard_path, notice: "An e-mail has been 
		sent notifying all heroes of this project's cancellation."
	end

	private
	def find_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:name, :description, :video_url, :supertype)
	end
end
