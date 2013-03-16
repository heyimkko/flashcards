class CreateCardsTable < ActiveRecord::Migration
  def change
    create_table :cards do |c|
      c.text :answer
      c.integer :deck_id
      c.text :definition
      c.boolean :viewed, :default => false
      c.string :correct, :default => 'Wrong!'
      c.timestamps
    end
  end
end
