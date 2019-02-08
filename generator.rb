# Program will repeat until user does not answer "yes" to restart prompt at the end
run = "yes"
loop do
  break if run != "yes"

  # Method to check letter against string "aeiou" to see if vowel
  def is_vowel?(letter)
    "aeiou".include?(letter)
  end

  # Method to find first vowel
  def find_first_vowel (word)
    word.split('').each.with_index do |char, index|
      if is_vowel?(char)
        # Return the index of that vowel
        return index
      end
    end
    # Return index 0 if no vowel is found
    return 0
  end

  # Method to find last vowel
  def find_last_vowel (word)
    last_index = word.length
    word.split('').each.with_index do |char, index|
      if is_vowel?(char)
        last_index = index
      end
    end
    # Return index 0 if no vowel is found
    return last_index
  end
  
  # Method to create the first word
  def create_word_one(word)
    index = find_last_vowel(word)
    result = word.slice(0, index)
    return result
  end

  # Method to create the second word
  def create_word_two(word)
    index = find_first_vowel(word)
    result = word.slice(index, word.length)
    return result
  end

  # Method to generate portmanteau
  def run_generator
    # Initialize variables to store words
    word_one, word_two = nil
    # Get first word, with a do while loop to reprompt if input is invalid
    puts "What is the first word to combine?"
    loop do
      word_one = gets.chomp.downcase
      if word_one.length > 1
        break
      end
      puts "Please enter a word greater than 1 character long"
    end
    # Get second word
    puts "What is the second word to combine?"
    loop do
      word_two = gets.chomp.downcase
      if word_two.length > 1
        break
      end
      puts "Please enter a word greater than 1 character long"
    end
    # Outputs & generate portmanteau
    puts "The first input is #{word_one}"
    puts "The second input is #{word_two}"
    return create_word_one(word_one) + create_word_two(word_two)
  end

  # Run generator & outputs result
  result = run_generator
  puts "Your portmanteau is #{result}"
  
  # Prompt to restart
  puts "Would you like to continue? (yes / no)"
  run = gets.chomp.downcase
end
