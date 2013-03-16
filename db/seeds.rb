User.create :email => "a@a.com",
            :password => "1234"
User.create :email => "a@b.com",
            :password => "1234"

Round.create :deck_id => 1,
             :user_id => 1,
             :num_correct => 0

Deck.create :name => "Ruby Trivia",
            :num_cards => 38

file = Hash[*IO.read('public/flashcardssource.txt').split(/[\n*]/)] 
file.each do |pair|
  Deck.find(1).cards << Card.create(:definition => pair[0], :answer => pair[1], :deck_id => 1)
end
