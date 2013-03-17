post '/play' do
  start_round
  # @shuffled_deck = shuffled_deck
  redirect "/play/#{round_id}"
end

get '/play/:round_id' do  
  play
  erb :game
end

post '/guess/:round_id/:card_id' do #gameplay backend
  # find_round
  evaluate_guess
  set_last_card
  redirect "/play/#{round_id}"
end

get '/:round_id/wrapup' do
  round
  erb :wrapup
end

