# post '/play' do  #START A GAME
#   @deck = Deck.find(params[:deck_id])
#   @cards = @deck.cards.shuffle
#   @counter = 0

#   # Until finished, process next card
#   @card = @deck.next_card(counter)
#   @definition = card.definition
#     @counter += 1

#     @cards.each do |card|
#        if user.response == card.answer
#         num_correct += 1
#         counter += 1
#       else
#         counter += 1
#     end
#   end
#   erb :play
# end
post '/play' do # deck id and user id using the params passed in from the play form
  @round = Round.create :deck_id => 1,
                        :num_correct => 0,
                        :user_id => params[:user_id]
  @shuffled_deck = Deck.find(1).cards.shuffle                      
  redirect "/play/#{@round.id}"
end

get '/play/:round_id' do  
  until @counter > @shuffled_deck.size
  @card = current_card(@counter) # HELPER METHOD RETURNS @shuffled_deck[counter]
  # then we can call #definition in the view
  erb :game
end
end

post '/guess' do #gameplay backend
  if params[:guess] == @card.answer
    @round.num_correct += 1
    counter
  else
    counter
  end

  redirect "/play/#{@round.id}"
end

# May have issues inter-relating instance vars between controller/helpers?