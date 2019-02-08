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
  first_array = first_word.chars.to_a
  first_length = first_array.length
  until first_length >= 2
    puts "please enter a word greater than one charactor long:"
    first_word = gets.chomp
    first_array = first_word.chars.to_a
    first_length = first_array.length
  end
  i = 0
  first_array.each do |item|
    n = is_vowel?(item)
    if n == true
      k = i
    else
      i += 1
    end
  end
  if i == 0
    word_a = first_word.slice(1..first_length)
  else
    word_a = first_word.slice(0...i)
  end
  puts "please enter the second word:"
  second_word = gets.chomp
  second_array = second_word.chars.to_a
  second_length = second_array.length
  until second_length >= 2
    puts "please enter a word greater than one charactor long:"
    second_word = gets.chomp
    second_array = second_word.chars.to_a
    second_length = second_array.length
  end

  i = 0
  second_array.each do |item|
    n = is_vowel?(item)
    if n == true
      l = i
    else
      i += 1
    end
  end

  if i < second_length
    word_b = second_word.slice((i - 1)..second_length)
  elsif i = second_length
    word_b = second_word
  end
  puts "The first word is #{first_word}"
  puts "The second word is #{second_word}"
  portmanteau = word_a + word_b

  puts "portmanteau is #{portmanteau}"
end

puts "That was your portmanteau #{run_generator}!"
