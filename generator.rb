# Gather user input of first and second part of portmanteau. Verify at least 2 characters long.
def run_generator
  puts "What is the first word to combine?: "
  first_word = gets.chomp.downcase
  until first_word.length >= 2
    puts "Error. Please submit a word with at least 2 characters:"
    first_word = gets.chomp
  end

  puts "What is the second word to combine?: "
  second_word = gets.chomp.downcase
  until second_word.length >= 2
    puts "Error. Please submit a word with at least 2 characters:"
    second_word = gets.chomp
  end

  # Print user input words to screen.
  puts "The first input is #{first_word}"
  puts "The second input is #{second_word}"
  puts "in the run_generator method"

  # Validates if vowel in word
  def is_vowel?(letter)
    if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
      return true
    else
      return false
    end
  end

  reverse_first_word = first_word.reverse

  first_index = 0
  first_vowel = false
  reverse_first_word.each_char do |c|
    first_index += 1
    if is_vowel?(c)
      first_index += 1
      first_index = first_word.length - first_index
      first_vowel = true
      break
    end
  end

  if !first_vowel
    first_index = first_word.length
  end

  first_word = first_word[0..first_index]

  puts first_word 

  second_index = 0
  second_vowel = false
  second_word.each_char do |c|
    second_index += 1
    if is_vowel?(c)
      second_index -= 1
      second_vowel = true
      break
    end
  end

  if !second_vowel
    second_index = 0
  end

  second_word = second_word[second_index..second_word.length]

  puts second_word


  whole_word = first_word + second_word

  puts "Your complete Portmanteau is: #{whole_word}.\n"

  # Ask the user if they would like to continue.
  puts "Would you like to continue?"
  response = gets.chomp.downcase

  case response
  when "yes", "ya", "yup", "please", "y", "ye", "yep"
    run_generator
  when "no", "nah", "nope", "n"
    puts "Thank you for using this program."
  else
    puts "Invalid input. Have a great day."
  end
end

run_generator
