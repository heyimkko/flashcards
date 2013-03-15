class CreateRoundsTable < ActiveRecord::Migration
  def change
    create_table :rounds do |c|
      c.integer :deck_id
      c.integer :num_correct
      c.integer :user_id
      c.timestamps
    end
  end
end
