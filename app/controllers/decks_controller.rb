class DecksController < ApplicationController
  def create
    @decks = Deck.find(:name)
  end
end
