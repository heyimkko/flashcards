post '/play' do
  start_round
  redirect "/play"
end

get '/play' do  
  play
  erb :game
end

post '/guess/:card_id' do
  evaluate_guess
  set_last_card
  redirect "/play"
end

get '/:round_id/wrapup' do
  round
  erb :wrapup
end
