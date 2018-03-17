class TournamentsController < ApplicationController
  def index
    render json: Tournament.all
  end
end
