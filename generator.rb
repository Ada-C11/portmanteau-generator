def is_vowel?(letter)
  return ["a", "e", "i", "o", "u"].include?(letter)
end

def length_validation(word)
  until word.length >= 2 && word.count("aeiou") > 0
    puts "Please enter a word greater than one character long that also has at least one vowel"
    word = gets.chomp
  end
  return word
end

# method to find the index of desired vowel, whether it be first or last vowel
# char_idx represents index for the letter that you want to start iterating at
def find_vowel_index(word, char_idx, count_direction)
  vowel_index = char_idx
  word.length.times do
    if is_vowel?(word[char_idx])
      vowel_index = char_idx
      break
    end
    char_idx += count_direction
  end
  return vowel_index
end

def run_generator
  puts "What is the first word to combine?"
  first_word = length_validation(gets.chomp)
  puts "What is the second word to combine?"
  second_word = length_validation(gets.chomp)
  puts "The first word is #{first_word}. The second word is #{second_word} in the run_generator method"
  first_word_last_vowel = find_vowel_index(first_word, -1, -1)
  # addresses special case that the last letter in the first word is a consonant, since it should not be chopped off
  if first_word_last_vowel == -1 && is_vowel?(first_word[-1]) == false
    first_portion = first_word
  else
    first_portion = first_word[0...first_word_last_vowel]
  end
  second_word_first_vowel = find_vowel_index(second_word, 0, 1)
  second_portion = second_word[second_word_first_vowel..-1]
  puts "Portmanteau: #{first_portion}" + "#{second_portion}"
end

run_generator

puts "\nWould you like to continue the generator? Please enter yes to continue, or enter anything else to exit"
while gets.chomp.downcase == "yes"
  run_generator
  puts "\nWould you like to continue the generator? Please enter yes to continue, or enter anything else to exit"
end
