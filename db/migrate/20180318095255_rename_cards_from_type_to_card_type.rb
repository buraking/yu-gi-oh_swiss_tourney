class RenameCardsFromTypeToCardType < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :type, :card_type
    rename_column :cards, :attribute, :card_attribute
    rename_column :cards, :prize, :price
  end
end
