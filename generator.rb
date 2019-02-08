
#refocus to work around index numbers 


#Make a method named run_generator. This method has no parameters.
#find last instance of vowel
#keep every letter from start to before last vowel


def is_vowel?(letter)
  if ["a", "e", "i", "o", "u"].include?(letter)
    return true
  else
    return false
  end
end

def find_vowel(word)
  part1 = nil
  word.each_char do |letter|
    if is_vowel?(letter) == true
      first_half = word.split(letter)
      part1 = first_half.first
    end
  end
  return part1
end

def run_generator()
  puts "What is the first word to combine?"
  first = gets.chomp
  if first.length < 2
    puts "Invalid input. Please enter a word that is at least two characters long."
    first = gets.chomp
  end
  puts "What is the second word to combine?"
  second = gets.chomp
  if second.length < 2
    puts "Invalid input. Please enter a word that is at least two characters long."
    second = gets.chomp
  end
  puts "The first input is #{first}."
  puts "The second input is #{second}."
  #puts "in the run_generator method"

  #test_vowel = "i"
  #puts "Is #{test_vowel} a vowel?"
  #puts is_vowel?(test_vowel)

  #test_consonant = "g"
  #puts "Is #{test_consonant} a vowel?"
  #puts is_vowel?(test_consonant)

  puts find_vowel(first) + find_vowel(second)
end


# vowel = letter(a, e, i, o, u)

# end
run_generator()
