require_relative 'black_jack'

def play_game
  #TODO: make the user play from terminal in a while loop that will stop when the user will not be asking for  a new card
  puts "*** WELCOME TO OUR FANCY BLACKJACK ***"

  bank = bank_score
  score = 0

  # While we are the user asks for a card (and has a score < 21)
  while asking_for_card?(score)
    score += pick_card
    puts state_of_the_game(score, bank)
  end

  outcome = game_outcome(bank, score)

  puts build_message_for(outcome)
end

def state_of_the_game(score, bank)
  # TODO: Returns custom message with player's score and bank's score
  "Your score is #{score}, bank is #{bank}!"
end

def asking_for_card?(score)
  # TODO: Ask for a card, if the score is less or equal to 21, then returns true or false according to the user's choice

  # If the score is more than 21 we immediately exit the method by returning false
  return false if score > 21

  puts "Card ? (Type 'Y' for a new card)"
  print "> "
  input = gets.chomp

  if input == 'Y' || input == 'yes'
    true
  else
    false
  end
end

def build_message_for(outcome)
  #TODO: return specific message depending on the game outcome (= bank's score and user's score)
  bank = outcome[0]
  score = outcome[1]

  if score > 21
    "You are over 21... you loose."
  elsif score == 21
    "Black Jack!"
  elsif score > bank
    "You beat the bank! You win."
  else
    "Bank beats you! You loose."
  end
end
