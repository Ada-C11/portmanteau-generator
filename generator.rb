# method to test whether a letter is a vowel or consonant (found some help on https://www.ruby-forum.com/t/need-regex-to-check-for-consonants-and-put-number-after-each-consonant/224144)
def is_vowel?(letter)
  vowels = ["a", "e", "i", "o", "u"]
  if vowels.include?(letter)
    return true
  end
  return false
end

# method to validate user words
def valid_test(input)
  result = true
  if input.length < 2
    puts "Your word needs at least two letters. Try again."
    result = false
  end

  if input !~ /[aeiou]/
    puts "Your word needs at least one vowel. Try again."
    result = false
  end

  if input == 0
    puts "I don't think that was a valid word. Try again."
    result = false
  end
  return result
end

# method for asking user for input
def get_input
  input = gets.chomp.to_str.downcase
  until valid_test(input)
    puts "Please enter another word."
    input = gets.chomp.to_str.downcase
  end
  return input
end

# method for slicing first word (found some help on https://code-maven.com/iterate-over-character-of-a-string-in-ruby)
def make_first_half(word)
  last_vowel = -1
  word.each_char { |c|
    if is_vowel?(c)
      # used reverse index to start right to left
      last_vowel = word.rindex(c) 
    end
  }
# Notes from class collaboration:
# another way to achieve each_char would be to set a loop with word.length and then iterate through that number of characters
# instead of reverse index, you could reverse the string itself
# I could have also used break to end the iteration through the word. What I did instead was set up a new variable named last_vowel and that's how I kept my spot and sliced from there

  if last_vowel == -1
    return word
  end
  return word.slice(0...last_vowel)
end

# method for slicing second word
def make_second_half(word)
  word.each_char { |c|
    if is_vowel?(c)
      i = word.index(c)
      return word.slice(i...word.length)
    end
  }
  return word
end

# greeting
puts "Welcome to Portmanteau-Palooza!"

# main method
def run_generator
  puts "What is your first word to combine?"
  # refers back to get_input method and stores the return of that method as first_word within this method.
  first_word = get_input

  # refers back to get_input method and stores the return of that method as second_word within this method.
  puts "What is your second word to combine?"
  second_word = get_input

  # refers back to make_first_half method and stores return as first_half within this method.
  first_half = make_first_half(first_word)

  # refers back to make_second_half method and stores return as second_half within this method.
  second_half = make_second_half(second_word)

  puts "The portmanteau for #{first_word} and #{second_word} is #{first_half + second_half}! Goofy, huh?"
end

# wanna play again?

answer = "y"
until answer == "n"

run_generator
puts "Would you like to do another portmanteau? (y/n)? "
answer = gets.chomp.downcase
  case
    when answer == "n"
    puts "Thanks for playing!"
  end
end
