def is_vowel?(letter)
  case letter
  when "a", "e", "i", "o", "u"
    return true
  else
    return false
  end
end

def run_generator
  puts "Input the first word:"
  word_a = gets.chomp.downcase
  while word_a.length <= 1
    puts "Please enter a word that has more than 1 letter:"
    word_a = gets.chomp.downcase
  end

  puts "Input the second word:"
  word_b = gets.chomp.downcase
  while word_b.length <= 1
    puts "Please enter a word that has more than 1 letter:"
    word_b = gets.chomp.downcase
  end

  port_a = word_a
  port_b = word_b
  port_a.reverse.each_char do |c|
    if is_vowel?(c) == false
      port_a = port_a.chop
    else
      port_a = port_a.chop
      break
    end
  end

  # this currently doesn't work! Trying to solve for words with no vowels
  if port_a == nil
    port_a == word_a
  end

  port_b.each_char do |c|
    if is_vowel?(c) == false
      port_b = port_b[1..-1]
    else
      break
    end
  end
  
  # this currently doesn't work! Trying to solve for words with no vowels
  if port_b == nil
    port_a == word_a
  end

  puts port_a + port_b

  puts "Would you like to try again?! Enter 'Y' or 'N'"
  answer = gets.chomp.upcase
  if answer == "Y"
    run_generator
  else
    puts "Thanks for playing!"
  end
end

run_generator
