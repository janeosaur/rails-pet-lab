class OwnersController < ApplicationController

  def index
    @owners = Owner.all
    count = cookies[:visit_count] || 1
    cookies[:visit_count] = count.to_i + 1
  end

  def new
    @owner = Owner.new
  end

  def create
    # owner = Owner.create(owner_params)
    @owner = Owner.create(owner_params)
    if @owner.save
      # redirect_to owner_path(owner)
      redirect_to @owner
    else
      flash[:error] = @owner.errors.full_messages.join(" ")
      render :new
    end
  end

  def show
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
  end

  def edit
    # stretch
  end

  def update
    # stretch
  end

  def destroy
    # stretch
  end

  # TODO: add custom appointments action for convenience

  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone)
  end

end
