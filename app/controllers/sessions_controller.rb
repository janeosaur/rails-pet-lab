class SessionsController < ApplicationController

# get /login
  def new

  end

# post /login
  def create
    owner = Owner.find_by_email(params[:email])
    if owner && owner.authenticate(params[:password])
      session[:owner_id] = owner.id
      redirect_to "/"
    else
      redirect_to "/login"
    end
  end

# get /logout
  def destroy
    session[:owner_id] = nil
    redirect_to "/login"
  end

end
