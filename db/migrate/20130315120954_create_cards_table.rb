class CreateCardsTable < ActiveRecord::Migration
  def change
    create_table :cards do |c|
      c.text :answer
      c.integer :deck_id
      c.text :definition
      c.timestamps
    end
  end
end
