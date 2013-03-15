class CreateCardsTable < ActiveRecord::Migration
  def change
    create_table :cards do |c|
      c.string :answer
      c.integer :deck_id
      c.string :definition
      c.timestamps
    end
  end
end
