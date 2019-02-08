# program that generates a portmanteau by combining two words that the user enters
# method that checks whether a letter is a vowel or not
def is_vowel?(letter)
  if ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"].include?(letter)
    return true
  else
    return false
  end
end

# method that cheks that the length of a user entered word is 2 or greater
def word_length(word)
  until word.length >= 2
    print "Error: Please enter a word that is at least 2 letters in length: "
    word = gets.chomp
  end
end

# method that generates a portmanteau based off of two words entered in by a 
# user
def run_generator

  # prompts user for two words that they would like to combine
  # outputs the two words the the user entered
  puts "Please enter in your first word to combine: "
  first_word = gets.chomp
  word_length(first_word)
  puts "Please enter in your second word to combine: "
  second_word = gets.chomp
  word_length(second_word)
  puts "The first word is #{first_word}"
  puts "The second word is #{second_word}"
  # puts "in the run_generator method"

  # test_vowel = "i"
  # puts "Is #{test_vowel} a vowel?"
  # puts is_vowel?(test_vowel)

  # test_consonant = "g"
  # puts "Is #{test_consonant} a vowel?"
  # puts is_vowel?(test_consonant)

  # reverses first word
  # finds last vowel and its index position
  count = 0
  first_word.reverse.each_char do |letter|
    if is_vowel?(letter) == false
      count -= 1
    else
      break
    end
  end

  count_two = 0
  second_word.each_char do |letter|
    if is_vowel?(letter) == false
      count_two += 1
    else
      break
    end
  end

  if first_word.length == count.abs
    print "#{first_word}"
  else
    print "#{first_word[0...(count - 1)]}"
  end
  if second_word.length == count_two
    print "#{second_word}"
  else
    print second_word[count_two..-1]
  end
end

run_generator
puts ""
