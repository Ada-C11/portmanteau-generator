def prompt_for_input(which_word)
  continue = false

  until continue == true
    print "Please enter the #{which_word} word: "
    word = gets.chomp

    until word.length > 1
      print "Please enter a word with more than one character: "
      word_a = gets.chomp
    end

    continue = validate(word)
    if continue == false
      puts "The word must contain at least one vowel."
    end
  end

  return word
end

def is_vowel?(letter)
  case letter
  when "a", "e", "i", "o", "u", "A", "E", "I", "O", "U"
    return true
  else
    return false
  end
end

def find_vowels(word)
  # create an array to hold the indices of all the vowels in word_a

  vowel_array = []

  #   find each vowel in the word and add its index to the array
  # word.each_char.with_index { |c, i|
  #   if is_vowel?(c)
  #     vowel_array << i
  #   end
  # }

  temp_array = word.split("")
  temp_array.length.times do |i|
    if is_vowel?(temp_array[i])
      vowel_array << i
    end
  end

  return vowel_array
end

def validate(word)
  vowel_array = find_vowels(word)
  if vowel_array == []
    return false
  else
    return true
  end
end

def run_generator
  word_a = prompt_for_input("first")

  word_b = prompt_for_input("second")

  vowel_array_a = find_vowels(word_a)

  # slice the string before the final vowel for the frst word
  slice_point = vowel_array_a[-1] - 1
  word_a_piece = word_a.slice(0..slice_point)

  # slice the string before the first vowel for the second word
  vowel_array_b = find_vowels(word_b)

  slice_point = vowel_array_b[0]
  word_b_piece = word_b.slice((slice_point)..word_b.length)

  portmanteau = word_a_piece + word_b_piece
  return portmanteau
end

run_again = "y"
puts "Welcome to the portmanteau generator!"

while run_again == "y"
  portmanteau = run_generator

  puts "The portmanteau is #{portmanteau.downcase}."

  print "Would you like to make another portmanteau (y/n)? "
  run_again = gets.chomp
  while run_again != "y" && run_again != "n"
    print "Please enter \"y\" for yes or \"n\" for no. "
    run_again = gets.chomp
  end
end

puts "Thank you for using the portmanteau generator."
