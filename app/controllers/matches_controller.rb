class MatchesController < ApplicationController
  def show
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    @match.create_winner(user_id: params[:winner_id])
    redirect_to(@match)
  end
end
