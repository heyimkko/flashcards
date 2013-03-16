class Deck < ActiveRecord::Base
  has_many :cards
  attr_accessible :cards

  def next_card(counter)
    counter = 0
    counter += 1
    @cards(counter)
  end
end
