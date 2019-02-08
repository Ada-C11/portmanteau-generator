def is_vowel?(letter)
  if (letter == "a") || (letter == "e") || (letter == "i") || (letter == "o") || (letter == "u")
    return true
  else
    return false
  end
end

def run_generator
  # Prompts user for the first word
  puts "What is your first word to combine?"
  word_a = gets.chomp
  until word_a.length > 1
    puts "Invalid input, must be at least 2 characters long."
    puts "Please re-enter the input."
    word_a = gets.chomp
  end

  # Prompts user for the 2nd word
  puts "What is your 2nd word to combine?"
  word_b = gets.chomp
  until word_b.length > 1
    puts "Invalid input, must be at least 2 characters long."
    puts "Please re-enter the input."
    word_b = gets.chomp
  end

  # Iteraties through each letter and indexes it, when it
  # hits a vowel it records the placement
  characters = 0
  last_vowel = 0
  word_a.each_char do |alpha|
    characters += 1
    if is_vowel?(alpha)
      last_vowel = characters
    end
  end
  #   puts characters
  #   puts last_vowel

  if last_vowel == 0
    first = word_a
  else
    first = word_a[0...(last_vowel - 1)]
  end

  # Determines the placement of the first vowel
  first_vowel = 0

  word_b.each_char do |alpha|
    first_vowel += 1
    break if is_vowel?(alpha)
  end
  puts first_vowel

  if first_vowel == word_b.length
    last = word_b
  else
    last = word_b[(first_vowel - 1)..-1]
  end

  # prints the portmanteau
  puts first + last
end

run_generator
