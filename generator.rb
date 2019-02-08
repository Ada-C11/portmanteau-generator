# defining is_vowel? method
def is_vowel?(letter)
 vowels = %w[a e i o u]
 if vowels.include?(letter)
  return true
  else
  return false
 end
end

# defining the process to get word_a as a method because it makes the
# run_generator method itself more clear
def get_first_word
  print "Enter your first word:"
  word_a = gets.chomp.to_s

# setting as false so my until loop will run
  found_a_vowel = false

# this section will prompt the user to re-enter the word until the
# length and vowel conditions are met
  until word_a.length >= 2 && found_a_vowel == true
    first_word_array = word_a.split('')
    if first_word_array.any? {|letter| is_vowel?(letter)}
      found_a_vowel = true
    else
      puts "Please enter a word with at least one vowel."
      word_a = gets.chomp.to_s
    end

    if word_a.length < 2
      puts "Please enter a word greater than 1 character long."
      word_a = gets.chomp.to_s
    end
  end
  # returns the word for run_generator to use later
  return word_a
end


# defining the process to get word_b as a method because it makes the
# run_generator method itself more clear
def get_second_word
  print "Enter your second word:"
  word_b = gets.chomp.to_s

# setting as false so my until loop will run
  found_a_vowel = false

# this section will prompt the user to re-enter the word until the
# length and vowel conditions are met
  until word_b.length >= 2 && found_a_vowel == true
    second_word_array = word_b.split('')
    if second_word_array.any? {|letter| is_vowel?(letter)}
      found_a_vowel = true
    end

    if word_b.length < 2
      puts "Please enter a word with at least two characters."
      word_b = gets.chomp.to_s
    end
  end
# returns the word for run_generator to use later
  return word_b
end

# defining run_generator method
def run_generator

# the methods I created earlier
  word_a = get_first_word
  word_b = get_second_word

  last_vowel_index = 0
  index = 0

# looping through each value in the array to find the last vowel
  word_a.each_char do |letter|
    if is_vowel?(letter)
      last_vowel_index = index
    end
    index += 1
  end

  first_portmanteau = word_a[0..(last_vowel_index-1)]

  found_first_vowel = false
  first_vowel_index = 0
  index = 0

# don't need to loop through every value, just need the first vowel
  until found_first_vowel == true || index >= word_b.length
    letter = word_b[index]
    if is_vowel?(letter)
      found_first_vowel = true
      first_vowel_index = index
    end
    index += 1
  end

  second_portmanteau = word_b[(first_vowel_index..-1)]

  puts "#{word_a} + #{word_b} is #{first_portmanteau}" + "#{second_portmanteau}"

end

run_generator

print "Would you like to continue? yes or no:"

answer = gets.chomp.to_s

# asks user if they want to continue
if answer == "yes"
  run_generator
else
  puts "Thanks for playing!"
end
