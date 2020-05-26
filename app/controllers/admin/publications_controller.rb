module Admin

  class PublicationsController < ApplicationController
    before_action :set_publication, only: [:show, :edit, :update, :destroy]
    before_action :only_admin
    skip_before_action :only_admin, only: [:show, :index]

    def index
      @publications = Publication.all
    end

    def show
    end

    def new
      @publication = Publication.new
    end

    def edit
    end

    def create
      @publication = Publication.new(publication_params)
      @publication.user = current_user
      if @publication.save
        redirect_to publications_path, success: 'Nouvelle publication ajoutée !'
      else
        render :new
      end
    end

    def update
      @publication.update(publication_params)
      if @publication.save #si c'est tout OK, on redirige au pets index
        redirect_to publications_path, success: 'Modifications effectuées !'
      else
        render :edit
      end
    end

    def destroy
      @publication.destroy
      redirect_to publications_path, success: 'Suppression effectuée !'
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end
      
    private

      # Only allow a list of trusted parameters through.
      def publication_params
        params.require(:publication).permit(:title, :body, :image)
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