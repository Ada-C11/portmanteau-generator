def is_vowel?(letter)
  vowels = ["a", "e", "i", "o", "u"]
  if vowels.include?(letter.downcase)
    return true
  end
  return false
end


def get_word_from_user(word)
  puts "What is the #{word} to combine?"
  word = gets.chomp.to_s
  while word.length < 2 || word.include?(" ")
    puts "Word must be at least 2 characters long, and must not contain any spaces."
    word = gets.chomp.to_s
  end
  return word
end


def chop_first_word(first_word)
  stop_index = first_word.length - 1

  first_word.reverse.each_char do |letter|
    if is_vowel?(letter)
      return first_word[0...stop_index]
    end
    stop_index -= 1
  end
  stop_index = first_word.length
  return first_word[0...stop_index]
end


def chop_second_word(second_word)
  start_index = 0

  second_word.each_char do |letter|
    if is_vowel?(letter)
      return second_word[start_index..second_word.length]
    end
    start_index += 1
  end
  start_index = 0
  return second_word[start_index..second_word.length]
end


def run_generator
  first_word = get_word_from_user("first word")
  second_word = get_word_from_user("second word")

  first_half = chop_first_word(first_word)
  second_half = chop_second_word(second_word)

  new_word = first_half + second_half

  puts "#{first_word} + #{second_word} is #{new_word}"
end


run_generator
play_again = true

while play_again
  puts "Wasn't that fun? if you would like to try again, please enter 'yes'."
  responce = gets.chomp.to_s
  if responce == "yes"
    run_generator
  else
    play_again = false
  end
end
