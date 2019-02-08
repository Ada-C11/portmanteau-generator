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
  # needs to include -1 in case there are no vowels in the first word (to include the entirety of the first word in the portmanteau)
  vowel_array = [-1]

  #   find each vowel in the word and add its index to the array
  word.each_char.with_index { |c, i|
    if is_vowel?(c)
      vowel_array << i
    end
  }

  #   if no vowels were found, add a 0 to the array so word_b will be sliced properly
  if vowel_array == [-1]
    vowel_array << 0
  end
  return vowel_array
end

def run_generator
  print "Please enter the first word: "
  word_a = gets.chomp

  until word_a.length > 1
    print "Please enter a word with more than one character: "
    word_a = gets.chomp
  end

  print "Please enter the second word: "
  word_b = gets.chomp

  until word_b.length > 1
    print "Please enter a word with more than one character: "
    word_b = gets.chomp
  end

  vowel_array_a = find_vowels(word_a)

  # slice the string before the final vowel for the frst word
  slice_point = vowel_array_a[-1] - 1
  word_a_piece = word_a.slice(0..slice_point)

  # slice the string before the first vowel for the second word
  vowel_array_b = find_vowels(word_b)
  slice_point = vowel_array_b[1]
  word_b_piece = word_b.slice((slice_point)..word_b.length)

  portmanteau = word_a_piece + word_b_piece
  return portmanteau
end

puts "Welcome to the portmanteau generator!"
portmanteau = run_generator

puts "The portmanteau is #{portmanteau.downcase}."
puts "Thank you for using the portmanteau generator."
