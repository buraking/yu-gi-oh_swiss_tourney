class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user
      session[:current_user_id] = user.id
      redirect_to tournaments_path
    else
      flash[:danger] = 'Invalid user e-mail.'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to(root_url)
  end
end
