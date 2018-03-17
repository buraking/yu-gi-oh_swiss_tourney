class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.datetime :started_at
      t.references :round, foreign_key: true
      t.references :challenger, foreign_key: { to_table: :users }
      t.references :challenged, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
