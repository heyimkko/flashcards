def clear_deck
  shuffled_deck.each do |card|
    card.update_attribute("viewed", false)
  end
end

def start_round
   @round = Round.create :deck_id => 1,
                        :num_correct => 0,
                        :user_id => current_user
   
   @shuffled_deck = Deck.find(1).cards.shuffle
   clear_deck
end

def finished?
  shuffled_deck.find{|card| card.viewed == false }.nil?
end

# def winner
#   puts "Congrats you won the game!"
#   clear_deck
# end

def update_num_correct
  @round = Round.find(params[:round_id])
  @new_count = (@round.num_correct + 1)
  @round.update_attribute :num_correct, @new_count
end

post '/play' do
  @shuffled_deck = shuffled_deck
  start_round
  redirect "/play/#{@round.id}"
end

get '/play/:round_id' do  
  if finished?
    redirect '/' # TODO: Redirect to an actual winner page
  else
    @shuffled_deck = shuffled_deck
    @round = Round.find(params[:round_id])

    @card = @shuffled_deck.find{|card| card.viewed == false }
  end

  erb :game
end

post '/guess/:round_id/:card_id' do #gameplay backend
  @card = Card.find(params[:card_id])
  @round = Round.find(params[:round_id])

  if params[:guess].downcase.chomp == @card.answer.downcase.chomp
    update_num_correct
    @card.update_attribute("viewed", true)
  else
    @card.update_attribute("viewed", true)
  end

  redirect "/play/#{@round.id}"
end