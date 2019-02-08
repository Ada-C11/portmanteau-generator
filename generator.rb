# Make "is_vowel?" method

def is_vowel?(test_vowel)
  case test_vowel.downcase
  when "a", "e", "i", "o", "u"
    return true
  else
    return false
  end
end

# Make "run_generator" method
def run_generator
  puts "What is the first word to combine?"
  word_1 = gets.chomp

  until word_1.length > 1
    puts "Please eneter a word greater than 1 character long"
    word_1 = gets.chomp
  end

  puts "What is the second word to combine?"
  word_2 = gets.chomp

  until word_2.length > 1
    puts "Please eneter a word greater than 1 character long"
    word_2 = gets.chomp
  end

  puts "The first input is #{word_1}"
  puts "The second input is #{word_2}"
  puts "in the run_generator method"

  # Find index of the last vowel from word_1

  # Create the last_vowel index variable to store the index of the last_vowel
  last_vowel_index = 0

  # Loop through each character of word_1 and apply the is_vowel? method to identify if a character is a vowel. Since the loop goes through each character, the index of the last vowel will be assigned to last_vowel_index variable
  n = word_1.length
  (0..n - 1).each do |i|
    if (is_vowel? (word_1[i]))
      last_vowel_index = i
    end
  end
  # Use the slice method to get substring [start index ..last index]
  word_1_prefix = word_1[0..last_vowel_index - 1]

  # Find index of the first vowel from word_2
  first_vowel_index = 0

  # Use break to stop the loop when the first vowel is identified so the first_vowel_index would take the index of the first vowel
  n = word_2.length
  (0..n - 1).each do |i|
    if (is_vowel? (word_2[i]))
      first_vowel_index = i
      break
    end
  end

  word_2_suffix = word_2[first_vowel_index..word_2.length - 1]

  portmanteau = word_1_prefix + word_2_suffix
  puts portmanteau
end

#2. Evoke run_generator
run_generator
