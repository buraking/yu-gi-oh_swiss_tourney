module Api
  class RoundsController < ApplicationController
    def show
      render json: Round.find(params[:id]).to_json(include: :matches)
    end
  end
end
