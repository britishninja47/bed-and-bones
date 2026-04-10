class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :animals, :contact, :about]

  def home
  end

  def animals
    @species = Species.order(:name)
  end

  def contact
    if request.post?
      flash[:notice] = "Thanks for your message. We'll be in touch soon."
      redirect_to contact_path
    end
  end

  def about
  end
end
