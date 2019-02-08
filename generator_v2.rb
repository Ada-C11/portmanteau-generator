# run_generator prompts user for 2 words and prints a portmanteau of the words
# to the screen
def run_generator
  puts "What is the first word to combine?"
  word1 = get_word
  puts "What is the second word to combine?"
  word2 = get_word

  # WAVE 1 CODE
  # puts "Word 1: #{word1}"
  # puts "Word 2: #{word2}"
  # test_vowel = "i"
  # puts "Is #{test_vowel} a vowel?"
  # puts is_vowel?(test_vowel)
  # test_consonant = "g"
  # puts "Is #{test_consonant} a vowel?"
  # puts is_vowel?(test_consonant)
  # puts "in the run_generator method"


  # calculate the end index of the first word. Default value is word length
  # so that the whole word is included if there are no vowels
  index = 0
  word1_end = word1.length
  (word1.reverse).each_char do |letter|
    if is_vowel?(letter)
      word1_end = (word1.length - 1) - index
      break
    end
    index += 1
  end

  # calculate the start index of the second word. Default value is 0
  # so that the whole word is included if there are no vowels
  index = 0
  word2_start = 0
  (word2).each_char do |letter|
    if is_vowel?(letter)
      word2_start = index
      break
    end
    index += 1
  end

  # slice words and make the portmanteau
  portmanteau = word1[0...word1_end] + word2[word2_start...word2.length]

  puts "#{word1} + #{word2} = #{portmanteau}"
end

# get_word checks to see if the word length is greater than or equal to 2
def get_word
  word = gets.chomp
  until (word.length >= 2)
    puts "Please enter a word that is at least 2 characters long"
    word = gets.chomp
  end
  return word
end

# is_vowel? checks to see if a specific character is a vowel
def is_vowel?(letter)
  vowels = ["a", "e", "i", "o", "u"]
  if vowels.include?(letter.downcase)
    return true
  else
    return false
  end
end

run_generator
