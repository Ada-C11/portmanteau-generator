def run_generator
  first_word = user_input("first word", first_word)
  second_word = user_input("second word", second_word)

  first_word_part2 = 0
  first_word.each_char do |c|
    if is_vowel?(c)
      first_word_part2 = first_word.rindex(c)
    end
  end

  second_word_part1 = 0
  second_word.each_char do |c|
    if is_vowel?(c)
      second_word_part1 = second_word.index(c)
      break
    else
      second_word_part1 = 0
    end
  end

  combined_word = first_word.slice(0..first_word_part2 - 1) + second_word.slice(second_word_part1..second_word.length - 1)
  puts combined_word
end

def is_vowel?(letter)
  if ["a", "e", "i", "o", "u"].include?(letter)
    return true
  else
    return false
  end
end

def user_input(word, input)
  puts "What is the #{word} to combine?"
  input = gets.chomp.downcase
  return input
  while input.length < 2
    puts "Please enter a word greater than 2 character long"
    input = gets.chomp.downcase
    return input
  end
end

run_generator
