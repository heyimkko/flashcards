
helpers do

  def set_deck
    session[:deck] = @round.deck_id
  end

  def deck
    session[:deck]
  end

  def current_user
    @user ||= User.find(session[:id]) if session[:id]
  end

  def clear_deck
    @deck.each do |card|
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

  def set_round_id
    session[:round_id] = @round.id
  end

  def round_id
    session[:round_id]
  end

  def round_number(index)
    index + 1
  end

  def start_round
     @round = Round.create :deck_id => params[:deck_id],
                          :num_correct => 0,
                          :user_id => current_user.id
     set_round_id
     set_deck
     @deck = Deck.find(deck).cards
     clear_deck
     init_count
  end

  def finished?
    @deck.find{|card| card.viewed == false }.nil?
  end

  def round
     @round ||= Round.find(round_id)
  end

  def next_card
    @deck.each do |card|
      if card.viewed == false
        @card = card
      end
    end
  end

  def update_num_correct
    round
    @new_count = (@round.num_correct + 1)
    @round.update_attribute :num_correct, @new_count
  end

  def evaluate_guess
     @card ||= Card.find(params[:card_id])
     set_guess(params[:guess])
    if params[:guess].downcase.chomp == @card.answer.downcase.chomp
      update_num_correct
      @card.update_attribute("viewed", true)
      @card.update_attribute("correct", "Correct!")
    else
      @card.update_attribute("viewed", true)
    end
  end

  def play
    @deck = Deck.find(deck).cards.shuffle
    round
    if finished?
      clear_last_card
      redirect "/#{round_id}/wrapup"
    else
      next_card
      increment_count
      @last_card = last_card   
      @guess = guess
      @count = count
    end
  end
end
