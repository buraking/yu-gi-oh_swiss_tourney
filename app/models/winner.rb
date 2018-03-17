class Winner < ApplicationRecord
  belongs_to :match
  belongs_to :user

  after_create :set_next_round_matches

  private

  def set_next_round_matches
    matches = match.round.matches
    if matches.size == matches.map(&:winner).compact.size
      generate_next_round(match.round.number + 1)
    end
  end

  def generate_next_round(number)
    tournament = Tournament.find(match.round.tournament.id)
    round_count = tournament.rounds.count
    round = Round.where(tournament_id: tournament.id, number: number).first
    return unless round
    user_ids = tournament.user_ids
    score_table = {}
    user_ids.each do |user_id|
      challenger = User.find(user_id)
      score = round_count - tournament.winners.where(user_id: challenger.id).count
      score_table[user_id] = score
    end
    while score_table.any?
      user_id, score = score_table.first
      score_table.delete(user_id)
      challenged = score_table.find { |_, v| v == score }&.first
      challenged ||= score_table.to_a.sample.first
      score_table.delete(challenged)
      round.matches.create(challenger_id: user_id, challenged_id: challenged)
    end
  end
end
