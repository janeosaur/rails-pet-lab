class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_owner
    if @current_owner
      @current_owner
    elsif session[:owner_id]
      @current_owner = Owner.find(session[:owner_id])
    else
      @current_owner = nil
    end
   #this is the same thing as
   #@current_owner ||= Owner.find(session[:owner_id]) if session[:owner_id]
  end

  # #current_owner should be user that's logged in (or nil if not logged in.)
  # 1. check if someone is logged in by looking at session[:owner_id] (if not nil)
  # 2. set @current_owner to the Owner.find ---

  helper_method :current_owner

  def authorize
    redirect_to "/login" unless current_owner
  end

end
