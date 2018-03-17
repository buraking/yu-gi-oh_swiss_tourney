class ParticipantsController < ApplicationController
  def create
    @participant = Participant.create(participant_params)
  end

  private

  def participant_params
    params.require(:participant).permit(:tournament_id, :user_id)
  end
end
