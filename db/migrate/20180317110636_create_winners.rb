class CreateWinners < ActiveRecord::Migration[5.2]
  def change
    create_table :winners do |t|
      t.reference :match
      t.reference :user

      t.timestamps
    end
  end
end
