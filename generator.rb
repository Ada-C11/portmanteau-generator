
# Validates if there is a value in the word
def is_vowel?(letter)
  letters_to_compare = ["a", "e", "i", "o", "u"]
  if letters_to_compare.include?(letter)
    return true
  else
    return false
  end
end
# Finds the index for the vowels
def word_index?(array)
  iterations = 0
  ind = 0
  (array).each_with_index do |val, index|
    if is_vowel?(val)
      ind = index
    end
  end
  return ind
end

def run_generator
  word_user = ""
  part = 0
  # Evaluates that the input's lenght is higher than two characters.
  # The second piece of statement after the or is to cotrol the flow
  # and direct the interpreter to the right if conditional statement.
  while word_user.length < 2 || part < 2
    puts "Please enter the  word number #{part + 1} you want to combine:"
    word_user = gets.chomp.to_s.downcase
    word = word_user.split("")
    part += 1

    # After the user has given a valid input for the word number 1
    # part 1 will execute.
    if part == 1
      # Validates if the word given by the user contains a vowel
      if word_index?(word) > 0
        word_one = word_user
        first_part = word_user[0...word_index?(word)]
        # If there is not a vowel I will just store the whole word.
      else
        word_one = word_user
        first_part = word_one
      end
    end

    # After the user has given a valid input for the word number 2
    # part 2 will execute.
    if part == 2 && word_index?(word.reverse) > 0
      word_two = word_user
      index_reversed = -(word_index?(word) + 1)
      second_part = word_user[index_reversed..word.length]
      # If there is not a vowel I will just store the whole word.
    else
      word_two = word_user
      second_part = word_two
    end
  end
  portmanteau = first_part + second_part
  puts " #{word_one} + #{word_two} = #{portmanteau}"
end

run_generator
