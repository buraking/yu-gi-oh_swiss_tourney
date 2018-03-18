class Participant < ApplicationRecord
  belongs_to :tournament
  belongs_to :user
  belongs_to :deck

  after_create :create_matches

  private

  def create_matches
    return unless tournament.limit == tournament.participants.count
    round = tournament.rounds.find_by(number: 1)
    user_ids = tournament.user_ids
    while user_ids.any?
      round.matches.create(
        challenger_id: user_ids.delete(user_ids.sample),
        challenged_id: user_ids.delete(user_ids.sample)
      )
    end
  end
end
