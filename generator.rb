# check for vowels
def is_vowel?(letter)
  return "aeiou".include?(letter.downcase)
end

# validate user input
def validate(input)
  until input.length >= 2 && input =~ /["a","e","i","o","u"]/
    puts "Please enter a word of at least 2 characters with at least one vowel:"
    input = gets.chomp.downcase
  end
  return input
end

# In the first word,find the last instance of a vowel.
# The first half of the portmanteau will keep every letter of the first word until and excluding its last vowel.
def gets_first_word(first_word)
  index = 0
  first_word.reverse.each_char { |char|
    if is_vowel?(char)
      break
    end
    index += 1
  }
  # get the first part of portmanteau
  first_part_portmanteau = first_word.reverse[index + 1, first_word.reverse.length - index].reverse
  return first_part_portmanteau
end

# In the second word, find the first instance of a vowel.
# The second half of the portmanteau will keep every letter of the second word after and including its first vowel.
def gets_second_word(second_word)
  index = 0
  second_word.split("").each do |char| # optional enhancement: using another method besides .each_char
    if is_vowel?(char)
      break
    end
    index += 1
  end
  # get the second part of portmanteau
  second_part_portmanteau = second_word[index, second_word.length - index]
  return second_part_portmanteau
end

# get the two words, combine them to create a portmanteau and print
def run_generator
  print "Enter the first word: "
  input = gets.chomp.downcase
  first_word = validate(input)
  first_part_portmanteau = gets_first_word(first_word)
  print "Enter the second word: "
  input = gets.chomp.downcase
  second_word = validate(input)
  second_part_portmanteau = gets_second_word(second_word)
  puts "The first input is \"#{first_word}\""
  puts "The second input is \"#{second_word}\""
  puts "in the run_generator method."
  puts "#{first_word} + #{second_word} is #{first_part_portmanteau}#{second_part_portmanteau}"
  continue?
end

# optional enhancement: ask if the user wants to continue using the program
def continue?
  puts "Do you want to continue? Enter \"Yes\" or \"No\" "
  answer = gets.chomp.downcase
  until answer == "yes" || answer == "no"
    puts "Enter \"Yes\" or \"No\""
    answer = gets.chomp.downcase
  end
  if answer == "yes"
    run_generator
  else
    puts "Thanks for using the program. Goodbye!"
    exit
  end
end

run_generator
