def is_vowel?(letter)
  if letter == "a" || letter == "e" || letter == "u" || letter == "o" || letter == "i"
    return true
  else
    return false
  end
end

def run_generator
  puts "Please enter the first word:"
  first_word = gets.chomp
  until first_word.length >= 2
    puts "please enter a word with more than one character:"
    first_word = gets.chomp
  end
  puts "please enter the second word:"
  second_word = gets.chomp
  until second_word.length >= 2
    puts "please enter a word with more than one charactor:"
    second_word = gets.chomp
  end
  new_word = first_word.reverse
  first_array = new_word.chars.to_a
  i = 0
  k = 0
  first_array.each_with_index do |item, index|
    if is_vowel?(item)
      i = index
      k = 1
      break
    end
  end
  if i == 0 && k == 0
    word_a = first_word
  else
    word_a = first_word.slice(0...(first_word.length - (i + 1)))
  end
  second_array = second_word.chars.to_a
  j = 0
  second_array.each_with_index do |item, index|
    if is_vowel?(item)
      j = index
      break
    end
  end
  if j == 0
    word_b = second_word
  else
    word_b = second_word.slice(j..second_word.length)
  end
  portmanteau = word_a + word_b
  puts "First word is #{first_word}"
  puts "Second word is #{second_word}"
  puts "Here is your potmanteau: #{portmanteau}"
end

run_generator
