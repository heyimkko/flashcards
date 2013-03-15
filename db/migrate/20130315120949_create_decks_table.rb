class CreateDecksTable < ActiveRecord::Migration
  def change
    create_table :decks do |c|
      c.string :name
      c.integer :num_cards
      c.timestamps
    end
  end
end
