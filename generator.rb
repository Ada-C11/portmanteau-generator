# program that generates a portmanteau by combining two words that the
# user enters

# outputs welcome message
puts "\nWelcome to Portmanteau Pro Deluxe 5!"
print "I will combine any two words, of your choice, into one AMAZING "
puts "new word!"

# method that checks whether a letter is a vowel or not
def is_vowel?(letter)
  if ["a", "e", "i", "o", "u"].include?(letter)
    return true
  else
    return false
  end
end

# method that returns user input after verifying that is at least 2
# letters in length
def input
  word = gets.chomp.downcase
  until word.length >= 2
    print "ERROR! Please enter a word that is at least 2 letters in "
    print "length: "
    word = gets.chomp.downcase
  end
  return word
end

# method that returns the first half of the portmanteau
def portmanteau_first_half(word)
  last_vowel_index = nil
  word.each_char do |letter|
    last_vowel_index = word.rindex(letter) if is_vowel?(letter)
  end

  if last_vowel_index == nil
    return word
  else
    return word[0...last_vowel_index]
  end
end

# method that returns the second half of the portmanteau
def portmanteau_second_half(word)
  first_vowel_index = nil
  word.each_char do |letter|
    first_vowel_index = word.index(letter) if is_vowel?(letter)
  end

  if first_vowel_index == nil
    return word
  else
    return word[first_vowel_index..-1]
  end
end

# method that generates a portmanteau based off input from the user
def run_generator

  # prompts user for two words that they would like to combine
  print "\nPlease enter in the first word you would like to combine: "
  first_word = input
  print "Please enter in the second word you wouldl like to combine: "
  second_word = input

  # combines user input and outputs the portmanteau
  portmanteau = portmanteau_first_half(first_word) << portmanteau_second_half(second_word)
  puts "\n#{first_word} + #{second_word} = #{portmanteau}"
  puts "Isn't that an AMAZING new word?!"
end

# prompts a user on whether they would like to create another
# portmanteau

# method that checks if an input is yes or no
def yes_no?
  input = gets.chomp.downcase
  until input == "no" || input == "yes"
    print "ERROR! Please enter either yes, or no: "
    input = gets.chomp.downcase
  end
  return input
end

# prompts a user on whether they would like to create another
# portmanteau
continue = "yes"
while continue == "yes"
  run_generator
  print "\nWould you like to create another portmanteau (yes/no)? "
  continue = yes_no?
end
