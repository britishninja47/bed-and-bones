class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_pet, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    # Start with joined pets so we can filter by species name if needed
    @pets = Pet.joins(:species).all

    if params[:species_id].present?
      @pets = @pets.where(species_id: params[:species_id])
    end

    if params[:query].present?
      sql_query = "pets.name ILIKE :query OR species.name ILIKE :query"
      @pets = @pets.where(sql_query, query: "%#{params[:query]}%")
    end

    @pets = @pets.order(created_at: :desc)


    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pet: pet }),
        image_url: helpers.asset_url("pawprint.png")
      }
    end

  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to my_pets_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to my_pets_path
  end

  def my_pets
    @pets = Pet.where(user_id: current_user.id)
  end

  private

  def find_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :age, :address, :price, :species_id, :photo)
  end

  def authorize_user
    redirect_to root_path, alert: 'Not authorized' unless @pet.user == current_user
  end
end
