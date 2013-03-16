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
    end
  end

  def start_round
     @round = Round.create :deck_id => 1,
                          :num_correct => 0,
                          :user_id => current_user.id
     clear_deck
  end

  def finished?
    shuffled_deck.find{|card| card.viewed == false }.nil?
  end

  def find_round
     @round ||= Round.find(params[:round_id])
  end

  def update_num_correct
    @round = Round.find(params[:round_id])
    @new_count = (@round.num_correct + 1)
    @round.update_attribute :num_correct, @new_count
  end

  def evaluate_guess
     @card ||= Card.find(params[:card_id])
    if params[:guess].downcase.chomp == @card.answer.downcase.chomp
      update_num_correct
      @card.update_attribute("viewed", true)
    else
      @card.update_attribute("viewed", true)
    end
  end

  def play
    if finished?
      redirect '/' # TODO: Redirect to an actual winner page
    else
      @shuffled_deck = shuffled_deck
        find_round
      @card = @shuffled_deck.find{|card| card.viewed == false }
    end
  end
end