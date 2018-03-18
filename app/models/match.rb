class Match < ApplicationRecord
  has_one :winner

  belongs_to :challenger, class_name: 'User'
  belongs_to :challenged, class_name: 'User'
  belongs_to :round

  def loser
    return unless winner
    ([challenger, challenged] - [winner.user]).first
  end
end
