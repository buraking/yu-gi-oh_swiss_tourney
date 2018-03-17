class SignupsController < ApplicationController
    def new
    end

    def create
      user = User.create(name: params[:name], email: params[:email])
      redirect_to root_path
    end

    def toSignIn
      redirect_to tournaments_path
    end

    def toSignUp
      redirect_to signups_path
    end
  end
