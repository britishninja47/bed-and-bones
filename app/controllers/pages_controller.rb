class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :animals, :contact, :about]

  def home
  end

  def animals
    @species = Species.order(:name)
  end

  def contact
  end

  def about
  end
end
