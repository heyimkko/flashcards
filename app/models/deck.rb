class Deck < ActiveRecord::Base
  has_many :cards
  attr_accessible :cards

end
