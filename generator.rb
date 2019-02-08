# check for vowels
def is_vowel?(letter)
  if ["a", "e", "i", "o", "u"].include?(letter.downcase)
    return true
  else
    return false
  end
end

# validate user input for at least 2 characters
def validate
  word = gets.chomp.downcase
  until word.length > 1
    puts "Input must be at least 2 characters."
    print "Enter again: "
    word = gets.chomp.downcase
  end
  return word
end

# ask user to enter the first word, then check if it contains at least one vowel
def enter_first_word
  print "Enter the first word: "
  @first_word = validate
  @index = 0
  @first_word.reverse.each_char { |char|
    if is_vowel?(char)
      break
    end
    @index += 1
  }
  while @index == @first_word.length # there is no vowel in the first word
    puts "Invalid input. Please enter a word containing at least one vowel."
    enter_first_word
  end

  # get the first part of portmanteau
  first_part = @first_word.reverse[@index + 1, @first_word.reverse.length - @index].reverse
  return first_part
end

# ask user to enter the second word, then check if it contains at least one vowel
def enter_second_word
  print "Enter the second word: "
  @second_word = validate
  @index_second = 0
  @second_word.split("").each { |char| # optional enhancement: using another method besides .each_char
    if is_vowel?(char)
      break
    end
    @index_second += 1
  }
  # optional enhancement: handle input that does not contain a vowel
  while @index_second == @second_word.length # there is no vowel in the second word
    puts "Invalid input. Please enter a word containing at least one vowel."
    enter_second_word
  end

  # get the second part of portmanteau
  second_part = @second_word[@index_second, @second_word.length - @index_second]
  return second_part
end

# get the two words, then combine and print
def run_generator
  first_part = enter_first_word
  second_part = enter_second_word
  puts "The first input is \"#{@first_word}\""
  puts "The second input is \"#{@second_word}\""
  puts "in the run_generator method."

  puts "#{@first_word} + #{@second_word} is #{first_part}#{second_part}"
  continue?
end

# optional enhancement: ask if the user wants to continue using the program
def continue?
  puts "Do you want to continue? Enter \"Yes\" or \"No\" "
  answer = gets.chomp.downcase
  if answer == "yes"
    run_generator
  elsif answer == "no"
    puts "Thanks for using the program. Goodbye!"
    exit
  else
    puts "Enter \"Yes\" or \"No\""
  end
end

run_generator
