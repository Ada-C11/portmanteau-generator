# Portmanteau Generator

def is_vowel?(letter)
  if ["a", "e", "i", "o", "u"].include?(letter)
    return true
  else
    return false
  end
end

def run_generator
  # prompt user for first word
  puts "What is the first word to combine?"
  first_word = gets.chomp

  # input validation for first word
  while first_word.length < 2
    puts "We need words with two letters or more!"
    puts "Please re-enter the first word: "
    first_word = gets.chomp
  end

  # prompt user for second word
  puts "What is the second word to combine?"
  second_word = gets.chomp

  # input validation for second word
  while second_word.length < 2
    puts "We need words with two letters or more!"
    puts "Please re-enter the first word: "
    second_word = gets.chomp
  end

  # # test is_vowel method with vowel and consonant
  # test_vowel = "i"
  # puts "Is #{ test_vowel } a vowel?"
  # puts is_vowel?(test_vowel)

  # test_consonant = "g"
  # puts "Is #{ test_consonant } a vowel?"
  # puts is_vowel?(test_consonant)

  # CARLA CODE TO WORK WITH ALL CONSONANTS
  # if wored_B.count("aeiou") == 0
  #   new_B = word_B
  # end 

  # SHUBHA CODE
  # sets the end of the index
  # iterates backward (index_end -= 1) with while loop
  # this makes super lots of sense to me

  # iterate through first_word characters
  # does not work with all consonants or all vowels
  new_first_word = "" # initialize new variable to store truncated word
  first_index = first_word.length - 1 # length - 1 is the length of an index [0,first_index]
  first_word.reverse! # reverses the string, ! makes it stay reversed
  first_word.each_char do |letter| # initalize through each character of the variable
    if !is_vowel?(letter) # if NOT vowel increment index variable
      first_index -= 1
    end # if it hits a vowel
      first_word.reverse! # reverse the word again
      new_first_word = first_word[0...first_index] # store the new range of the word in a new variable
      break # exit out of the loop
  end

  # iterate through second_word characters
  # if is_vowel true increment index
  # else store index 0...n in variable
  new_second_word = ""
  second_index = 0
  second_last_index = second_word.length - 1

  # if word has no vowels
  # if word_A.count("aeiou") == 0
  #   new_A = word_A
  # end

  second_word.each_char do |letter| 
    if !is_vowel?(letter)
      second_index += 1
    else
      new_second_word = second_word[second_index..second_last_index]
      break
    end 
  end
  
  puts "The first input is #{ first_word }"
  puts "The second input is #{ second_word }"
  puts "The new word is #{ new_first_word + new_second_word }"  
end

run_generator
