class DecksController < ApplicationController
  def new
    @deck = current_user.decks.new
  end

  def create
    @decks = current_user.decks.create(deck_params)
    redirect_to tournaments_path
  end

  def show
    
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end
end
