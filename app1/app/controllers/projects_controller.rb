class ProjectsController < ApplicationController
 def index
  	@project = Project.all
  end

  def new
  	@project = Project.new
  end

  def create
  	# binding.pry
  	@project = Project.new(project_params)
     @project.save
     redirect_to projects_list_path
	end

	 def project_params
  	params.require(:project).permit(:name,:duration,:teamsize,:cost,:domain)
  end
end