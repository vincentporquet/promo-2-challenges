# Encoding: utf-8
puts = "writte a sentence!"
sentence = gets.chomp

def word
  word = sentence.split('')
  translation = []
  end_of_word = %w(em é ji oc ic uche ès).shuffle.first

  if word.size == 1
    translation << word
  elsif word.start_with?("a","e","i","o","u","y")
    translation << "l"+word+"#{end_of_word}"
  else
    translation << word+"#{random_suffix}"
  end

end

def louchebemize(sentence)
  #TODO: implement your louchebem translator

#I get a sentence from the user, how translate it? put the new word in a new array
#separte all the word of the sentence, and change it whith a if.


end