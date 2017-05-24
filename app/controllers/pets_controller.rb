class PetsController < ApplicationController

  def index
    # TODO: set up data for index view
    owner_id = params[:owner_id]
    @owner = Owner.find owner_id
  end

  def show
    # TODO: set up data for show view
    pet_id = params[:id]
    @pet = Pet.find pet_id
    # owner_id = params[:owner_id]
    # @owner = Owner.find owner_id
  end

  # TODO: set up *new* method with data for new view
  def new
    owner_id = params[:owner_id]
    @owner = Owner.find owner_id
    @pet = Pet.new
  end

  # TODO: set up *create* method with database interactions for create
  def create
    owner_id = params[:owner_id]
    @owner = Owner.find owner_id
    @pet = Pet.create(pet_params)
    if @pet.save
      @owner.pets << @pet
      redirect_to owner_pet_path(@owner, @pet)
    else
      # TODO: handle save errors and communicate issues to user
      flash[:error] = @pet.errors.full_messages.join(" ")
      render :new
    end
  end

  # solutions below
  # def create
  #   owner = Owner.find(params[:owner_id])
  #   new_pet = Pet.new(pet_params)
  #   if new_pet.save
  #     owner.pets << new_pet
  #     redirect_to owner_pet_path(owner, new_pet)
  #   else
  #     flash[:error] = new_pet.errors.full_messages.join(", ")
  #     redirect_to new_owner_pet_path(owner)
  #   end

  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
