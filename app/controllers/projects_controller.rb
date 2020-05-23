class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to projects_path, success: 'Nouveau projet ajouté !'
    else
      render :new
    end
  end

  def update
    @project.update(project_params)
    if @project.save #si c'est tout OK, on redirige au pets index
      redirect_to projects_path, success: 'Modifications effectuées !'
    else
      render :edit
    end
  end


  def destroy
    @project.destroy
    redirect_to projects_path, success: 'Suppression effectuée !'
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  private

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :body, images: [])
    end
end
