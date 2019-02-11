# portmanteau-generator

# Define method that checks if a letter is a vowel
def is_vowel?(letter)
  if "aeiou".include?(letter)
    return true
  else
    return false
  end
end

# Define method that checks if a word contains a vowel
def includes_vowel?(word)
  if word.include?("a") || word.include?("e") || word.include?("i") || word.include?("o") || word.include?("u")
    return true
  else
    return false
  end
end

# Define method that runs the portmanteau generator
# Get words to make into a portmanteau from user & check that the words are at least 2 characters long
def run_generator
  puts "What is the first word to combine?"
  first_word = gets.chomp.downcase
  while first_word.length < 2
    puts "Enter a word that is at least 2 characters in length"
    first_word = gets.chomp.downcase
  end

  # Create new empty variable to store shortened first word (first half of portmanteau)
  new_first_word = ""

  # Create index for first word (to use to cut word)
  # (length of the index is string length - 1 since index starts at 0)
  first_index = first_word.length - 1

  # Reverse the first word string and keep it reversed
  first_word.reverse!

  # Check if first word contains a vowel 
  # If it doesn't contain a vowel, leave as is
  # If it does contain a vowel iterate through the letters in the string.
  # Put every letter of the first word until and excluding its last vowel in the new variable
  first_include_vowel_result = includes_vowel?(first_word)
  if first_include_vowel_result == true
    first_word.each_char do |character|
      if !is_vowel?(character)
        first_index -= 1
      else
        first_word.reverse!
        new_first_word = first_word[0...first_index]
        break
      end
    end
  else
    new_first_word = first_word.reverse!
  end

  # Get second word from user
  # Check if has at least 2 characters
  puts "What is the second word to combine?"
  second_word = gets.chomp.downcase
  while second_word.length < 2
    puts "Enter a word that is at least 2 characters in length"
    second_word = gets.chomp.downcase
  end

  # Check if second word contains a vowel 
  # If it doesn't contain a vowel, leave as is
  # If it does contain a vowel iterate through the letters in the string.
  # Add letters after and including its first vowel to the new variable 
  new_second_word = ""
  second_index = 0
  second_include_vowel_result = includes_vowel?(second_word)
  if second_include_vowel_result == true
    second_word.each_char do |character|
      if !is_vowel?(character)
        second_index += 1
      else
        new_second_word = second_word[second_index..second_word.length]
        break
      end
    end
  else
    new_second_word = second_word
  end

  # Output original words and new portmanteau
  puts "First word is #{first_word}"
  puts "Second word is #{second_word}"
  puts "The portmanuteau is #{new_first_word}#{new_second_word}"
end

# Run method
run_generator

# Ask user if they want to run program again
puts "Do you want to make another portmanteau? yes/no"
answer = gets.chomp.downcase

# Keep running program until user chooses to exit
while answer == "yes"
  run_generator
  puts "Do you want to make another portmanteau? yes/no"
  answer = gets.chomp.downcase
  break if answer == "no" || answer == "exit"
end
