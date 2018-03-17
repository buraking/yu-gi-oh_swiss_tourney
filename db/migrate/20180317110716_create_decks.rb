class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.reference :user
      t.string :name

      t.timestamps
    end
  end
end
