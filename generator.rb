# Checks if letter is a vowel
def is_vowel?(letter)
  if ["a", "e", "i", "o", "u"].include?(letter.downcase)
    return true
  else
    return false
  end
end

# Returns an array of index locations of vowels in a word
def get_vowel_index(word)
  vowel_index = []
  word.each_char.with_index do |char, index|
    if is_vowel?(char)
      vowel_index << index
    end
  end
  return vowel_index
end

# Reprompts user until word length is 2 or more characters
def check_word_length(word)
  if word.length < 2
    until word.length >= 2
      puts "Please enter a word greater than 1 character"
      word = gets.chomp
    end
  end
  return word
end

# Reprompts user if word has no vowels
def vowel_check(word)
  while get_vowel_index(word) == []
    puts "That is an invalid word. Please enter a word with at least one vowel."
    word = gets.chomp
  end
  return word
end

# Reruns program if user wants to continue
def continue
  puts "Would you like to continue?"
  user_selection = ""
  until user_selection == "Y" || user_selection == "N"
    print "Enter Y to continue or N to quit: "
    user_selection = gets.chomp.upcase
  end
  if user_selection == "Y"
    puts
    run_generator
  end
end

# Run portmanteau generator
def run_generator
  # reads in word a from user, verifying length and vowels
  puts "What is the first word to combine?"
  word_a = gets.chomp
  word_a = check_word_length(word_a)
  word_a = vowel_check(word_a)

  # reads in word b from user, verifying length and vowels
  puts "What is the second word to combine?"
  word_b = gets.chomp
  word_b = check_word_length(word_b)
  word_b = vowel_check(word_b)

  # Prepare word a
  prepped_word_a = nil
  reversed_a = word_a.reverse
  vowel_index_a = get_vowel_index(reversed_a)
  cut_point_a = vowel_index_a[0]

  if vowel_index_a == []
    prepped_word_a = word_a
  else
    prepped_word_a = reversed_a[cut_point_a + 1..-1]
    prepped_word_a = prepped_word_a.reverse
  end

  # prepare word b
  prepped_word_b = nil
  vowel_index_b = get_vowel_index(word_b)
  cut_point_b = vowel_index_b[0]

  if vowel_index_b == []
    prepped_word_b = word_b
  else
    prepped_word_b = word_b[cut_point_b..-1]
  end

  # Print result
  puts "#{word_a} + #{word_b} is #{prepped_word_a + prepped_word_b}"

  continue
end

run_generator
