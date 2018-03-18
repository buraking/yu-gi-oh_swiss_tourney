class TournamentsController < ApplicationController
  before_action :authenticate_user

  def index
    @tournaments = Tournament.where('started_at > ?', Time.zone.now).order(started_at: :asc)
  end

  def show
    @tournament = Tournament.find(params[:id])
    @users = @tournament.users
  end
end
