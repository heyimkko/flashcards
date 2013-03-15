User.create :email => "a@a.com",
            :password => "1234"
User.create :email => "a@b.com",
            :password => "1234"

# Deck.create :name => "Prototype Movie Trivia",
#             :num_cards => 5 
            

# Card.create :definition => "What comes after X",
#             :answer => "Y",
#             :deck_id => 1


# Card.create :definition => "What comes after A",
#             :answer => "B",
#             :deck_id => 1

# Card.create :definition => "What comes after B",
#             :answer => "C",
#             :deck_id => 1

# Card.create :definition => "What comes after C",
#             :answer => "D",
#             :deck_id => 1

# Card.create :definition => "What comes after D",
#             :answer => "E",
#             :deck_id => 1                                                

Round.create :deck_id => 1,
             :user_id => 1,
             :num_correct => 0

Deck.create :name => "Ruby Trivia",
            :num_cards => 38

file = Hash[*IO.read('/Users/apprentice/Dropbox/DBC Banana Slugs/Kevin Ko/flashcards/db/flashcardssource.txt').split(/[\n*]/)] 
# file.each {|pair| Deck.find(1).cards << Card.create(pair) }
file.each do |pair|
  puts "%" * 50
  puts pair
  puts "%" * 50
  Deck.find(1).cards << Card.create(:definition => pair[0], :answer => pair[1], :deck_id => 1)
end
