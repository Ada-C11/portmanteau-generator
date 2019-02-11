def is_vowel?(letter)
  case letter
  when "a", "e", "i", "o", "u"
    return true
  else
    return false
  end
end

def run_generator
  puts "Please enter the first word: "
  wordA = gets.chomp

  until wordA.length >= 2
    puts "Oops! This word needs to consist of at least two characters. 
    Please enter the first word: "
    wordA = gets.chomp
  end

  puts "Thanks! Now enter the second word: "
  wordB = gets.chomp

  until wordB.length >= 2
    puts "Oops! This word needs to consist of at least two characters. 
    Please enter the second word: "
    wordB = gets.chomp
  end

  # test_vowel = "o"
  # test_consonant = "q"
  # puts "is #{test_vowel} a vowel?"
  # puts is_vowel?(test_vowel)
  # puts "Is #{test_consonant} a vowel?"
  # puts is_vowel?(test_consonant)

  # calculate the first partial word by
  # finding the index of the first vowel
  # and then generating the partial word using the
  # indices
  # store the first partial word into variable word_part_A, class of string
  # In the first word, find the last instance of a vowel. The first half of the portmanteau will keep every letter of the first word until and excluding its last vowel.

  counterA = 0
  # rev_wordA = wordA.reverse

  wordA.reverse.each_char do |this_letter|
    if !is_vowel?(this_letter)
      counterA += 1
    else
      break
    end
  end

  puts "wordA's first vowel when reversed is at index #{counterA}"
  word_part_A = wordA[0...((wordA.length - 1)) - counterA]

  # if there are no vowels in the first word, use all of its letters
  if wordA.length == (counterA)
    word_part_A = wordA
  end

  puts "The first half of our portmanteau is #{word_part_A}"

  # In the second word, find the first instance of a vowel. The second half of the portmanteau will keep every letter of the second word after and including its first vowel.
  counterB = 0

  wordB.each_char do |this_letter|
    if !is_vowel?(this_letter)
      counterB += 1
    else
      break
    end
  end
  puts "wordB's first vowel is at index #{counterB}"
  word_part_B = wordB[counterB..(wordB.length)]

  # if there are no vowels in the second word, use all of its letters
  if wordB.length == (counterB)
    word_part_B = wordB
  end

  puts "The second half of our portmanteau is #{word_part_B}"

  # build the portmanteau by assigning it the
  # combination of word part A and word part B

  portmanteau = word_part_A + word_part_B
  puts "The current portmanteau is: \n#{wordA} + #{wordB} = #{portmanteau}"
  # puts "#{wordA} and #{wordB} in the run_generator method"

  return portmanteau
end

run_generator
