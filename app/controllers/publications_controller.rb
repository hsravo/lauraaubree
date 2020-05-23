class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

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

end
