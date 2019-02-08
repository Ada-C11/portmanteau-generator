# method to determine if letter is a value
def is_vowel?(letter)
  if ["a", "e", "i", "o", "u"].include?(letter)
    return true
  else return false   end
end

def run_generator
  # Gets input from user for first word, will not accept fewer than two letters
  puts "What's the first word you would like to combine?: "
  word_a = gets.chomp.downcase
  until word_a.length >= 2
    puts "Your word must be 2 characters or longer."
    puts "Please try again and enter your first word: "
    word_a = gets.chomp.downcase
  end
  # Gets input from user for second word, will not accept fewer than two letters
  puts "What's the second word you would like to combine?: "
  word_b = gets.chomp.downcase
  until word_b.length >= 2
    puts "You word must be 2 characters or longer."
    puts "Please try again and enter your second word: "
    word_b = gets.chomp.downcase
  end
  puts "The first word is #{word_a}"
  puts "The second word is #{word_b} in the run generator method"
  # Array of true or false based on vowels in first word
  word1 = []
  word1_vowels = []
  word_a.each_char do |letter|
    word1 << is_vowel?(letter)
  end
  # Finds where in the array index all of the true values are (vowels)
  # Finds the highest index of all of the true indices (to find the last vowel in the word)
  # Adds the letters up to but not including the last vowel
  word1_vowels = word1.each_index.select { |wordletters| word1[wordletters] == true }
  last_vowel = word1_vowels.max
  if last_vowel == nil
    last_vowel = word_a.length
  end
  word = word_a[0...last_vowel]

  # Array of true or false based on vowels in second word
  word2 = []
  word2_vowels = []
  word_b.each_char do |letters2|
    word2 << is_vowel?(letters2)
  end
  # Finds where in the array index all of the true values are (vowels)
  # Finds the lowest index of all of the true indices (to find the first vowel in the word)
  # Adds the letters from the first vowel to the end of the word
  word2_vowels = word2.each_index.select { |word2letters| word2[word2letters] == true }
  word2_length = word2.length
  first_vowel = word2_vowels.min
  if first_vowel == nil
    first_vowel = 0
  end
  word << word_b[first_vowel..word2_length]

  return word
end

puts "Here is your portmanteau: #{run_generator}"
