# portmanteau assignment

# ** include code for input without vowels

# Defining a method to identify vowels
def is_vowel?(letter)
  if "aeiou".include?(letter)
    return true
  else
    return false
  end
end

# Make a method named run_generator. This method has no parameters. Start this method by outputting a prompt to ask for a first input word A, and accept some input. Then, ask for a second input word B, and accept some input.
def run_generator
  # Get words to combine from user
  print "What is the first word to combine? "
  word_a = gets.chomp.downcase
  until word_a.length >= 2
    puts "Word must be greater than 1 character! Try again: "
    word_a = gets.chomp.downcase
  end

  # iterate through first word character
  # initialize variable to store new truncated word
  new_word_a = ""
  first_index = word_a.length - 1 # length of the index is word length - 1
  word_a.reverse! # reverse the string. ! makes it stay reversed

  # loop through to word to find vowel + index
  word_a.each_char do |character|
    if !is_vowel?(character)
      first_index -= 1 # if it is not a vowel, subtract 1 from the index
    else
      word_a.reverse! # de-reverse word
      new_word_a = word_a[0...first_index] # storing the truncated word
      break # exits the loop
    end
  end

  print "What is the second word to combine? "
  word_b = gets.chomp.downcase
  until word_b.length >= 2
    puts "Word must be greater than 1 character! Try again: "
    word_b = gets.chomp.downcase
  end

  # iterate through the second
  # initiate variable to store truncated word B
  new_word_b = ""
  second_index = 0

  word_b.each_char do |character|
    if !is_vowel?(character)
      second_index += 1
    else
      new_word_b = word_b[second_index..word_b.length]
      break
    end
  end
  # Output by combining both truncated words
  puts "That makes #{new_word_a}#{new_word_b}. Cool, huh!?"
end

# Invoke the divine power of the generator
puts "Hello, welcome to my wild portmanteau generator!"

run_generator
