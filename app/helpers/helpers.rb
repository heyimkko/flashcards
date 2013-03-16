
helpers do

  def shuffled_deck
    @deck ||= Deck.find(1).cards.shuffle
  end

  def current_user
    @user ||= User.find(session[:id]) if session[:id]
  end


end