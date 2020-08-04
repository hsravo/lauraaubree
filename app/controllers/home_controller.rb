class HomeController < ApplicationController

  def index
  end

  def dashboard
    @projects = Project.all
    @publications = Publication.all
  end

  def admin
    if user_signed_in?
      if current_user.role == 'admin'
        redirect_to dashboard_path
      end
    end
  end
end
