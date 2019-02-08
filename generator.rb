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

  # word_part_A = wordA[first_letA, last_letA]

  index_first_letA = 0
  index_last_letA = (wordA.length - 1)
  word_part_A = wordA[index_first_letA, index_last_letA]
  # find first vowel
  # first_letB =

  # i = 0
  wordA.reverse.each_char do |this_letter|
    if is_vowel?(this_letter) == false
      index_first_letA -= 1
    else
      break
    end
  end
  puts "word_part_A is #{word_part_A}"
  puts index_first_letA
  puts index_last_letA

  # do similar for word_part_B
  # In the second word, find the first instance of a vowel. The second half of the portmanteau will keep every letter of the second word after and including its first vowel.

  # index_first_letA = 0
  # index_last_letA = (wordA.length - 1)
  # word_part_A = wordA[index_first_letA, index_last_letA]
  # # find first vowel
  # # first_letB =

  # # i = 0
  # wordA.each_char do |this_letter|
  #   if !is_vowel?(this_letter)
  #     index_first_letA += 1
  #   else
  #     break
  #   end
  # end
  # puts "word_part_A is #{word_part_A}"

  #   # word_part_B = wordB
  # end
  # puts "word_part_B is #{word_part_B}"
  # # # check if each letter in the string is a vowel
  # # if not, .pop (or delete) it
  # # stop after finding a vowel
  # wordB.each_char do |letter|
  #   until letter.is_vowel?
  #     letter.pop
  #   end

  # build the portmanteau by assigning it the
  # combination of word part A and word part B

  # portmanteau = word_part_A + word_part_B
  # puts "The current portmanteau is #{portmanteau}"
  # puts "#{wordA} + #{wordB} = #{portmanteau}"
  puts "#{wordA} and #{wordB} in the run_generator method"

  # return portmanteau
end

run_generator
