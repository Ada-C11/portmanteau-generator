# Validates if value in word
def is_vowel?(letter)
  if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
    return true
  else
    return false
  end
end

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

  puts "The first word is #{first_word}."
  puts "The second word is #{second_word}."

  first_word_array = first_word.reverse.split(//)

  first_word_array.each do |letter|
    if is_vowel?(letter) == false
      first_word = first_word.chop!
    else
      first_word = first_word.chop!
      break
    end
  end

  part2_index = 0
  vowels2 = 0

  second_word_array = second_word.split(//)

  second_word_array.each do |letter|
    if is_vowel?(letter) == false && vowels2 < 1
      part2_index += 1
    else
      vowels2 += 1
    end
  end

  whole_word = first_word + second_word.slice(part2_index..(second_word.length - part2_index + 1))

  puts "Your complete Portmanteau is: #{whole_word.capitalize}.\n"

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
