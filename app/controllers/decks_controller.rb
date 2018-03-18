class DecksController < ApplicationController
  before_action :authenticate_user

  def index
    @decks = current_user.decks.all
  end

  def new
    @deck = current_user.decks.new
  end

  def create
    @decks = current_user.decks.create(deck_params)
    flash[:success] = 'Your deck was successfully created.'
    redirect_to decks_path
  end

  def show
    @deck = Deck.find(params[:id])
  end

  private

  def deck_params
    params.require(:deck).permit(:name)
  end
end
