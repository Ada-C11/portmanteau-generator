def is_vowel?(letter)
  vowels = ["a", "e", "i", "o", "u"]
  return vowels.include?(letter)
end

def is_valid(input)
  result = true
  if input.length < 2
    puts "Your input should be at least two characters."
    result = false
  end

  if input !~ /[aeiou]/
    puts "Your input should contain at least one vowel."
    result = false
  end

  return result
end

def get_input
  input = gets.chomp.downcase
  until is_valid(input)
    puts "Please enter a different word: "
    input = gets.chomp.downcase
  end
  return input
end

def create_first_half(word)
  word.reverse.each_char { |c|
    if is_vowel?(c)
      i = word.length - 1 - word.reverse.index(c)
      return word.slice(0...i)
    end
  }
  return word
end

def create_second_half(word)
  word.each_char { |c|
    if is_vowel?(c)
      i = word.index(c)
      return word.slice(i...word.length)
    end
  }
  return word
end

def run_generator
  puts "Please enter a word to begin the portmanteau: "
  first_word = get_input

  puts "Please enter a word to end the portmanteau: "
  second_word = get_input

  first_half = create_first_half(first_word)
  second_half = create_second_half(second_word)
  puts "#{first_word} + #{second_word} is #{first_half + second_half}"
end

answer = "yes"
until answer == "no"
  run_generator
  puts "Do you want to keep playing (Yes or No)? "
  answer = gets.chomp.downcase
end
