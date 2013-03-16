helpers do
  
  # def session
  #   @session = session[:id]
  # end
  def current_user
    @user ||= User.find(session[:id]) if session[:id]
  end

  def counter
    @counter += 1
  end

  def current_card(counter = 0)
    @shuffled_deck[counter]
  end


end
