module Api
  class TournamentsController < ApplicationController
    def index
      render json: Tournament.all.to_json(include: :rounds)
    end
  end
end
