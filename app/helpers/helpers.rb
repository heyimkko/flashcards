helpers do

  def shuffled_deck
    @deck ||= Deck.find(1).cards.shuffle
  end

  def current_user
    @user ||= User.find(session[:id]) if session[:id]
  end

  def clear_deck
    shuffled_deck.each do |card|
      card.update_attribute("viewed", false)
      card.update_attribute("correct", "Wrong!")
    end
  end

  def init_count
    session[:count] = 0
  end

  def increment_count
    session[:count] += 1
  end

  def count
    session[:count]
  end

  def clear_last_card
    session[:last_card] = nil
  end

  def set_last_card
    session[:last_card] = @card
  end

  def last_card
    session[:last_card]
  end

  def set_guess(user_guess)
    session[:guess] = user_guess
  end

  def guess
    session[:guess]
  end

  def start_round
     @round = Round.create :deck_id => 1,
                          :num_correct => 0,
                          :user_id => current_user.id
     clear_deck
     init_count
  end

  def finished?
    @deck.find{|card| card.viewed == false }.nil?
  end

  def find_round
     @round ||= Round.find(params[:round_id])
  end

  def next_card
    @deck.each_with_index do |item, index|
      if item.viewed == false
        @card = item
        @card_index = index + 1
      end
    end
  end

  def update_num_correct # TODO: A way to do this on Round.update attribute (per Jeffrey suggestion)
    # find_round #please God deliver us a session
    @new_count = (@round.num_correct + 1)
    @round.update_attribute :num_correct, @new_count
  end

  def evaluate_guess
     @card ||= Card.find(params[:card_id])
     set_guess(params[:guess])
     p guess
    if params[:guess].downcase.chomp == @card.answer.downcase.chomp
      update_num_correct
      @card.update_attribute("viewed", true)
      @card.update_attribute("correct", "Correct!")
    else
      @card.update_attribute("viewed", true)
    end
  end

  def play
    shuffled_deck
    if finished?
      find_round
      clear_last_card
      redirect "/#{@round.id}/wrapup" # TODO: Redirect to an actual winner page
    else
      find_round
      next_card
      increment_count
      # @card = @deck.find{|card| card.viewed == false }
      @last_card = last_card   
      @guess = guess
      @count = count
    end
  end
end
