class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    session[:current_user_id] = user.id
    redirect_to tournaments_path
  end


  def toSignUp
    redirect_to signups_path
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to(root_url)
  end
  
end
