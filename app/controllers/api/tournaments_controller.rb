module Api
  class TournamentsController < ApplicationController
    def index
      render json: Tournament.all.to_json(include: %i[rounds users])
    end

    def show
      render json: Tournament.find(params[:id]).to_json(include: %i[rounds users])
    end
  end
end
