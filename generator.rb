# portmanteau-generator 

# Define is_vowel?
def is_vowel?(letter)
  if "aeiou".include?(letter)
    return true
  else
    return false
  end
end

# TO DO : check case of input 
def run_generator
  puts "What is the first word to combine?"
  first_word = gets.chomp
  while first_word.length < 2
    puts "Enter a word that is at least 2 characters in length"
    first_word = gets.chomp
  end

  # iterate through first word character
  # create new variable to store shortened word
  new_first_word = ""
  first_index = first_word.length - 1 #(length of the index is word length - 1 since index starts at 0)
  first_word.reverse! #(reverse the string & make it stay reversed)

  # TO DO ADD CONDITIONAL FOR NO VOWELS
  first_word.each_char do |character|
    if !is_vowel?(character)
      first_index -= 1 # if it is not a vowel, subtract 1 from the index
    else #(if it finds a vowel)
      first_word.reverse! #(put the word back to correct order)
      new_first_word = first_word[0...first_index] #(store the new shortened word in the new variable)
      break # exit the loop
    end
  end

  puts "What is the second word to combine?"
  second_word = gets.chomp
  while second_word.length < 2
    puts "Enter a word that is at least 2 characters in length"
    second_word = gets.chomp
  end

  # iterate through the second
  # create variable to store shortened word
  new_second_word = ""
  second_index = 0

  second_word.each_char do |character|
    if !is_vowel?(character)
      second_index += 1
    else
      new_second_word = second_word[second_index..second_word.length]
      break
    end
  end
  # Output using slice method with index found in variables above
  puts "First word is #{first_word}"
  puts "Second word is #{second_word}"
  puts "The portmanuteau is #{new_first_word}#{new_second_word}"
end

run_generator
