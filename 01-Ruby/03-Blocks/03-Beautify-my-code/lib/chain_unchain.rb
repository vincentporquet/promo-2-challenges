def shuffle_word(a_word)
  #TODO: refactor this method

  # cap_word = a_word.upcase
  # chars_enum = cap_word.chars
  # array = chars_enum.to_a
  # shuffle_array = array.shuffle

  # shuffle_array

  shuffle_array = a_word.upcase.chars.to_a.shuffle

end


def quote_prime_numbers(n)
  #TODO: refactor this method

  prime_numbers = (1..n).find_all do |number|
    dividers = (2..number-1).select {|div| number % div == 0 }
    dividers.count == 0
  end
  prime = prime_numbers.map
    "#{prime} is prime"
end
