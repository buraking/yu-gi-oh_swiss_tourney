class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
    @users = @tournament.users
  end
end
