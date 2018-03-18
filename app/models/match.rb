class Match < ApplicationRecord
  has_one :winner

  belongs_to :challenger, class_name: 'User'
  belongs_to :challenged, class_name: 'User'
  belongs_to :round

  def challenger_deck
    round.tournament.participants.where(user_id: challenger_id).first.deck
  end

  def challenged_deck
    round.tournament.participants.where(user_id: challenged_id).first.deck
  end

  def loser
    return unless winner
    ([challenger, challenged] - [winner.user]).first
  end
end
