class Round < ActiveRecord::Base
  has_one :deck
  belongs_to :user

  def increment_num_correct
    self.num_correct += 1
    self.save
  end

end
