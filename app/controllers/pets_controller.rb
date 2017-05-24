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
    owner_id = params[:owner_id]
    @owner = Owner.find owner_id
  end

  # TODO: set up *new* method with data for new view

  # TODO: set up *create* method with database interactions for create
  # TODO: handle save errors and communicate issues to user

  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
