def length_validation(word)
  while word.length < 2
    puts "Please enter a word greater than one character long"
    word = gets.chomp
  end
  word = word
end

def is_vowel?(letter)
  if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
    return true
  else
    return false
  end
end

def find_first_vowel(word)
  word_index = -1
  word.each_char do |letter|
    word_index += 1
    if is_vowel?(letter) == true
      break
    end
  end
  return word_index
end

def run_generator
  puts "What is the first word to combine?"
  first_word = length_validation(gets.chomp)
  puts "What is the second word to combine?"
  second_word = length_validation(gets.chomp)
  puts "The first word is #{first_word}. The second word is #{second_word} in the run_generator method"
  index_1 = nil
  # if loop to address special case of all consonants in first_word
  if first_word.include?("a" || "e" || "i" || "o" || "u")
    index_1 = find_first_vowel(first_word)
  else
    index_1 = -1
  end
  index_2 = nil
  if second_word.include?("a" || "e" || "i" || "o" || "u")
    index_2 = find_first_vowel(second_word)
  else
    index_2 = 0
  end
  first_portion = first_word.slice(0...index_1)
  second_portion = second_word.slice(index_2..-1)
  puts "#{first_portion}" + "#{second_portion}"
end

run_generator
