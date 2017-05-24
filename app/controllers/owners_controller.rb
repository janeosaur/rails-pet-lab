class OwnersController < ApplicationController

  before_action :authorize, only: [:edit, :update]

  def index
    @owners = Owner.all
    count = cookies[:visit_count] || 1
    cookies[:visit_count] = count.to_i + 1
  end

# get "/signup"
  def new
    @owner = Owner.new
  end

# post "/owners"
  def create
    owner = Owner.new(owner_params)
    if owner.save
      session[:owner_id] = owner.id
      redirect_to "/"
    else
      redirect_to "/signup"
    end
  end

    # owner = Owner.create(owner_params)
    # @owner = Owner.create(owner_params)
    # if @owner.save
    #   # redirect_to owner_path(owner)
    #   redirect_to @owner
    # else
    #   flash[:error] = @owner.errors.full_messages.join(" ")
    #   render :new
    # end

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
    params.require(:owner).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
  end

end
