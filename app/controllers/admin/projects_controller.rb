module Admin

  class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    before_action :only_admin
    skip_before_action :only_admin, only: [:show, :index]

    def index
      @projects = Project.all
    end

    def show
      @project = Project.friendly.find(params[:id])
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
        redirect_to dashboard_path, success: 'Nouveau projet ajouté !'
      else
        render :new
      end
    end

    def update
      @project.update(project_params)
      if @project.save #si c'est tout OK, on redirige au pets index
        redirect_to dashboard_path, success: 'Modifications effectuées !'
      else
        render :edit
      end
    end


    def destroy
      @project.destroy
      redirect_to dashboard_path, success: 'Suppression effectuée !'
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.friendly.find(params[:id])
    end

    private

      # Only allow a list of trusted parameters through.
      def project_params
        params.require(:project).permit(:title, :slug, :body, :cover, images: [])
      end

      def only_admin
        if !user_signed_in? #si l'user n'est pas connecté
          redirect_to root_path, danger: "Vous ne pouvez pas accéder à cette page" #redirigé vers la page d'inscription
        elsif user_signed_in? #si l'user est connecté
          if current_user.role != 'admin' #mais qu'il n'est pas admin
            redirect_to root_path, danger: "Vous n'avez pas les droits pour accéder à cette page" #redirigé vers la page d'accueil
          end
        end
      end

  end

end