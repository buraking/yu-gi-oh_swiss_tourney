class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :attribute
      t.integer :level
      t.string :number
      t.string :type
      t.string :description
      t.integer :attack
      t.integer :defense
      t.decimal :prize

      t.timestamps
    end
  end
end
