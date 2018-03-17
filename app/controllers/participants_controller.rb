class ParticipantsController < ApplicationController
  def create
    tournament = Tournament.find(participant_params[:tournament_id])
    @participant = Participant.create(participant_params)
    if tournament.limit == tournament.participants.count
      redirect_to tournament.rounds.find_by(number: 1)
    else
      redirect_to tournament_path(tournament)
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:tournament_id, :user_id)
  end
end
