User.create :email => "a@a.com",
            :password => "1234"
User.create :email => "a@b.com",
            :password => "1234"

Deck.create :name => "Prototype Movie Trivia",
            :num_cards => 5 
            

Card.create :definition => "What comes after X",
            :answer => "Y",
            :deck_id => 1


Card.create :definition => "What comes after A",
            :answer => "B",
            :deck_id => 1

Card.create :definition => "What comes after B",
            :answer => "C",
            :deck_id => 1

Card.create :definition => "What comes after C",
            :answer => "D",
            :deck_id => 1

Card.create :definition => "What comes after D",
            :answer => "E",
            :deck_id => 1                                                

Round.create :deck_id => 1,
             :user_id => 1,
             :num_correct => 0