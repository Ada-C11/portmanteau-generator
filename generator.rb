# portmanteau generator due 2/8
# purpose of program is get user input for two words and combine them based on vowel placement

def is_vowel?(letter)
  vowels = ["a", "e", "i", "o", "u"]

  # .downcase accounts for words written in uppercase
  if vowels.include?(letter.downcase)
    return true
  else
    return false
  end
end

# check if user inputted word with length < 2 - if not, reprompt
def length_check(word)
  while word.length < 2
    puts "Please enter a word greater than 1 character!"
    word = gets.chomp
  end
end

def run_generator
  puts "\nWhat's the first word to combine?"
  first_word = gets.chomp
  length_check(first_word)

  puts "What's the second word to combine?"
  second_word = gets.chomp
  length_check(second_word)

  index = 0
  end_letter = nil

  # from the first word we want every letter until right before the last vowel
  # .reverse flips the word since we want the last vowel and not the first

  first_word.reverse.each_char do |letter|
    if is_vowel?(letter)
      # end_letter is a variable to express the index of the last vowel
      end_letter = (first_word.length - 1) - index
      break
    end
    index += 1

    # if there are no vowels, index will tick up till it gets to the end of the word so:
    if index == first_word.length
      end_letter = first_word.length
    end
  end

  index = 0
  first_letter = nil

  # from the second word we want ever letter after and including the first vowel

  second_word.each_char do |letter|
    # if the character is a vowel, make first_letter equal that index
    if is_vowel?(letter)
      first_letter = index
      break
    end
    index += 1

    # if there are no vowels, make the first_letter the first index (0) i.e. start at the beginning of the word
    if index == second_word.length
      first_letter = 0
    end
  end

  first_part_word = first_word.slice(0...end_letter)
  second_part_word = second_word.slice(first_letter...second_word.length)

  puts "\nThe first word is #{first_word}"
  puts "The second word is #{second_word}"
  puts "The portmanteau for these two words is: #{first_part_word}#{second_part_word}"
end

# invoke the method:
run_generator
