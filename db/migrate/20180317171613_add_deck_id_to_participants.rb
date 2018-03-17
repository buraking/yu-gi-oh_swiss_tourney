class AddDeckIdToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_reference :participants, :deck, foreign_key: true
  end
end
