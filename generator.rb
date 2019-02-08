Program will repeat until user does not answer "yes" to restart prompt at the end
run = "yes"
loop do
  break if run != "yes"
  
  # Method to check letter against string "aeiou" to see if vowel
  def is_vowel?(letter)
    "aeiou".include?(letter)
  end

  # Method to find first vowel
  def find_first_word(word)
    word.split('').each.with_index |char, index|
      if is_vowel?(char)
        return index
      end
    end
    # To return word if no vowel is found
    return 0
  end

  def find_second_word(word)
    last_index = word.length
    word.split('').each.with_index |char, index|
      if is_vowel?(char)
        last_index = index
        return last_index
      end
    end
    # To return word if no vowel is found
    return 0
  end
    
  def create_first_word(word)
    index = find_first_word(word)
    result = word.slice(0,index)
    return result
  end

  def create_second_word(word)
    index = find_second_word(word)
    result = word.slice(0,word.length)
    return result
  end

  def run_generator
  # Initialize variables to store words
    puts "What is the first word to combine?"
    loop do
      word_one = gets.chomp.downcase
      if word_one.length > 1
        break
      end
      puts "Please enter a word greater than 1 character long"
    end

    puts "What is the second word to combine?"
    loop do
      word_two = gets.chomp.downcase
      if word_two.length > 1
        break
      end
      puts "Please enter a word greater than 1 character long"
    end

    # Outputs & sanity check
    puts "The first input is #{word_one}
    The second input is #{word_two}
    Your portmanteau is #{create_first_word(word_one)+create_second_word(word_two)}
    in the run_generator method"
  end

  # Prompt to restart
  puts "Would you like to continue? (yes / no)"
  run = gets.chomp.downcase
end
