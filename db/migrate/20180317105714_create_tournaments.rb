class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.boolean :bracket_formated
      t.datetime :started_at
      t.integer :limit

      t.timestamps
    end
  end
end
