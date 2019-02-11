def is_vowel?(letter)
  if "aeiou".include?(letter)
    return true
  else
    return false
  end
end

# Make a method named run_generator. This method has no parameters. Start this method by outputting a prompt to ask for a first input word A, and accept some input. Then, ask for a second input word B, and accept some input.
def run_generator
  # Get words to combine from user
  print "What is the first word to combine? "
  word_a = gets.chomp.downcase
  until word_a.length >= 2
    puts "Word must be greater than 1 character! Try again: "
    word_a = gets.chomp.downcase
  end

  # Truncate word_a: all letters UNTIL and EXCLUDING the last vowel
  # Check for vowels
  word_a.reverse!
  new_word_a = ""
  word_a.each_char.with_index do |letter, index|
    if is_vowel?(letter) == true
      new_word_a = "#{word_a[(index + 1)..-1]}"
      new_word_a = new_word_a.reverse!
      break
    else
      new_word_a = word_a.reverse!
    end
  end

  # Get second word
  print "What is the second word to combine? "
  word_b = gets.chomp.downcase
  until word_b.length >= 2
    puts "Word must be greater than 1 character! Try again: "
    word_b = gets.chomp.downcase
  end
  
  # Truncate word_b: all letters AFTER and INCLUDING first vowel
  # Check for vowels
  new_word_b = ""
  word_b.each_char.with_index do |letter, index|
    if is_vowel?(letter) == true
      new_word_b = "#{word_b[(index + 1)..-1]}"
    else
      new_word_b = word_b
    end
  end

  portmanteau = "#{new_word_a}#{new_word_b}"
  puts "Your new word is #{portmanteau.upcase}. Cool, huh!?"
end

puts "Hello, welcome to my wild portmanteau generator!"
run_generator
