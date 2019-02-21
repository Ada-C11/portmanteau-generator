# This is the is_vowel? method. It gets used in the run_generator method.
def is_vowel?(letter)
  case letter
  when "a", "e", "i", "o", "u"
    return true
  else
    return false
  end
end

# This is the portmanteau generator method.
# The inputs are collected inside of the method (no parameters passed).
def run_generator
  puts "Please enter the first word: "
  wordA = gets.chomp

  until wordA.length >= 2
    puts "Oops! This word needs to consist of at least two characters. 
    Please enter the first word: "
    wordA = gets.chomp
  end

  puts "Thanks! Now enter the second word: "
  wordB = gets.chomp.downcase

  until wordB.length >= 2
    puts "Oops! This word needs to consist of at least two characters. 
    Please enter the second word: "
    wordB = gets.chomp
  end

  # Instructions:
  # In the first word, find the last instance of a vowel. The first half of the
  # portmanteau will keep every letter of the first word until and excluding its last vowel.

  # Approach:
  # calculate the first partial word by
  # finding the index of the first vowel
  # and then generating the partial word using the indices
  # store the first partial word into variable word_part_A, class of string

  counterA = 0

  wordA.reverse.each_char do |this_letter|
    if !is_vowel?(this_letter)
      counterA += 1
    else
      break
    end
  end

  word_part_A = wordA[0...((wordA.length - 1)) - counterA]

  # if there are no vowels in the first word, use all of its letters
  if wordA.length == (counterA)
    word_part_A = wordA
  end

  # Instructions:
  # In the second word, find the first instance of a vowel. The second half of the
  # portmanteau will keep every letter of the second word after and including
  # its first vowel.

  # Approach:
  # do the same as word_part_A except there's no need to reverse, and the
  # index should include the counter, which is excluded in word_part_A
  counterB = 0

  wordB.each_char do |this_letter|
    if !is_vowel?(this_letter)
      counterB += 1
    else
      break
    end
  end

  word_part_B = wordB[counterB..(wordB.length)]

  # if there are no vowels in the second word, use all of its letters
  if wordB.length == (counterB)
    word_part_B = wordB
  end

  # build the portmanteau by assigning it the
  # combination of word_part_A and word_part_B

  portmanteau = word_part_A + word_part_B
  puts "Here is your portmanteau: \n#{wordA} + #{wordB} = #{portmanteau}"

  return portmanteau
end

run_generator
