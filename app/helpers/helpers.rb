helpers do
  


  def counter
    @counter += 1
  end

  def current_card(counter = 0)
    @shuffled_deck[counter]
  end


end