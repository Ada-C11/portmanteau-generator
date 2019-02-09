puts "Hello, welcome to the Portmanteau machine"

def is_vowel?(letter)
  if letter =~ /[aeiou]/
    return true
  elsif letter !~ /[aeiou]/
    return false
  end
end

def run_generator
  puts "What is the first word?"
  word_one = gets.chomp

  until word_one.length >= 2
    puts "Your word must have at least 2 characters. Please enter something else"
    word_one = gets.chomp
  end

  new_word_one = ""
  first_index = word_one.length - 1

  word_one.reverse.each_char do |letter|
    if !is_vowel?(letter)
      new_word_one = word_one
    elsif is_vowel?(letter)
      new_word_one = word_one[0...first_index]
      break
    end
    first_index -= 1
  end

  puts "What is the second word?"
  word_two = gets.chomp
  until word_two.length >= 2
    puts "Your word must have at least 2 characters. Please enter something else"
    word_two = gets.chomp
  end

  new_word_two = ""
  second_index = 0
  word_two.each_char do |letter|
    if !is_vowel?(letter)
      new_word_two = word_two
    elsif is_vowel?(letter)
      new_word_two = word_two[(second_index)..word_two.length - 1]
      break
    end
    second_index += 1
  end

  puts "OK, here is your portmanteau: #{new_word_one + new_word_two}"
  puts "Thank you for using the Portmanteau machine!"
end

run_generator
