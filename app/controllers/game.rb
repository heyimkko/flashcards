post '/play' do
  @shuffled_deck = shuffled_deck
  start_round
  redirect "/play/#{@round.id}"
end

get '/play/:round_id' do  
  play
  erb :game
end

post '/guess/:round_id/:card_id' do #gameplay backend
  find_round
  evaluate_guess
  set_last_card
  redirect "/play/#{@round.id}"
end

get '/:round_id/wrapup' do
  find_round
  erb :wrapup
end

