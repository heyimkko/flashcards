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
      find_round
    @card = @shuffled_deck.find{|card| card.viewed == false }
  end
  erb :game
end

post '/guess/:round_id/:card_id' do #gameplay backend
  find_round
  evaluate_guess
  # if params[:guess].downcase.chomp == @card.answer.downcase.chomp
  #   update_num_correct
  #   @card.update_attribute("viewed", true)
  # else
  #   @card.update_attribute("viewed", true)
  # end

  redirect "/play/#{@round.id}"
end