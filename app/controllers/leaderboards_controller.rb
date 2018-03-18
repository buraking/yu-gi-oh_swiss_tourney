class LeaderboardsController < ApplicationController
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @score = calculate_score.sort_by { |k, v| -v }
  end

  private

  def calculate_score
    score = {}
    number_of_rounds = @tournament.rounds.count
    @tournament.users.each do |user|
      number_of_wins = @tournament.matches.select { |match| match.winner.user == user }.size
      score[user] = number_of_wins - number_of_rounds
    end
    score
  end
end
