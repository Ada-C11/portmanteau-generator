
# Method that collects user input.  If input is less than 2 characters, the user must try again.
def ask(prompt)
  print "#{prompt} "
  input = gets.chomp.downcase

  until input.length > 1
    puts "Oops!  Invalid entry.  Please enter a word with 2 or more characters."
    print "#{prompt} "
    input = gets.chomp.downcase
  end
  return input
end

# Method that determines whether a letter is a vowel
VOWELS = ["a", "e", "i", "o", "u"]

def is_vowel?(letter)
  if VOWELS.include?(letter)
    return true
  else
    return false
  end
end

# Method that incoporates the above methods.  It does the following:
#   1) Collects two words (2 or more characters long) from the user
#   2) Finds and records the LAST instance of a vowel in the first word
#   3) Finds and records the FIRST instance of a vowel in the second word
#   4) Slices and combines both words based on the rules outlined in the assignment
def run_generator
  # Collects two word from the user
  first_word = ask("\nWhat is the first word to combine?")
  second_word = ask("\nWhat is the second character to combine?")

  # Finds the last instance of a vowel in the first word, then records that vowel's index number.
  i = 0
  index_of_vowel = 0
  includes_vowel = false
  first_word.each_char do |letter|
    vowel = is_vowel?(letter)

    if vowel
      index_of_vowel = i
      includes_vowel = true
    end

    i += 1
  end

  # If the first word doesn't include a vowel, then it's left unchanged.
  # Otherwise, assigns every letter of first word -- up to and exluding the last vowel -- to "first_half"
  if !includes_vowel
    first_half = first_word
  else
    first_half = first_word.slice(0...index_of_vowel)
  end

  # Finds the first instance of a vowel in the second word, then records the vowel's index number
  index_of_vowel = 0
  includes_vowel = false
  second_word.each_char do |letter|
    vowel = is_vowel?(letter)
    if vowel
      includes_vowel = true
      break
    end

    index_of_vowel += 1
  end

  # If the second word doesn't include a vowel, then it's left unchanged.
  # Otherwise, assigns every letter after -- and including -- the vowel to "second_half"
  if !includes_vowel
    second_half = second_word
  else
    second_half = second_word.slice(index_of_vowel..second_word.length)
  end

  # Combines both halves into a portmanteau
  portmanteau = first_half + second_half
  puts portmanteau
end

run_generator
