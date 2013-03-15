class Round < ActiveRecord::Base
  has_one :deck
  belongs_to :user
end
