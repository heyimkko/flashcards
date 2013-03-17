post '/play' do
  start_round
  redirect "/play"
end

get '/play' do  
  play
  erb :game
end

post '/guess/:card_id' do
  puts "&" * 80
 puts "GUESS: #{params[:guess]}"
 puts "&" * 80    
  evaluate_guess
  puts "&" * 80
 puts "2nd GUESS: #{@foo}"
 puts "&" * 80    
  set_last_card
  puts "%" * 80
  puts @guess
  puts "%" * 80
  redirect "/play"
end

get '/:round_id/wrapup' do
  round
  erb :wrapup
end
