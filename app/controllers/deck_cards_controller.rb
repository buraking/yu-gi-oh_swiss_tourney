class DeckCardsController < ApplicationController
  def create
    deck = Deck.find(params[:deck_id])
    card = Card.where(number: params[:number]).first
    deck.cards.push(card)

    redirect_to deck
  end
end
