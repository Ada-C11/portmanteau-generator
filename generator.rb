def is_vowel?(letter)
  vowel_array = ["a", "e", "i", "o", "u"]
  if vowel_array.include? letter.downcase
    # if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
    return true
  else
    return false
  end
end

def run_generator
  print "Please enter the first word: "
  wordA = gets.chomp

  #make sure each input for wordA and wordB is two or more characters
  until wordA.length > 1
    print "Please make sure your word is at least two characters long. Try again: "
    wordA = gets.chomp
  end

  print "Please enter the second word: "
  wordB = gets.chomp

  until wordB.length > 1
    print "Please make sure your word is at least two characters long. Try again: "
    wordB = gets.chomp
  end

  #wordA: iterate through word backwards and find the index for the first vowel
  wordA_index = wordA.length - 1
  vowels_tracker = 0
  ## tried attaching downcase method to line 54 but didn't allow .each_char method
  # wordA = wordA.downcase || use if you want output to be lowercased
  wordA.reverse.each_char do |letter|
    if is_vowel?(letter) == false && vowels_tracker < 1
      wordA_index -= 1
    else
      vowels_tracker += 1
    end
  end

  ## OLD CODE
  #iterate through wordA and store until (excluding) that index
  # first_half = ""
  # second_index = 0
  # wordA.each_char do |letter|
  #   if second_index < index
  #     first_half << letter
  #     second_index += 1
  #   end
  # end

  if wordA_index < 0
    first_half = wordA
  else
    first_half = wordA[0...wordA_index]
  end
  
  #wordB: iterate through word and find index for first vowel
  wordB_index = 0
  vowels_tracker = 0
  ## tried attaching downcase method to line 54 but didn't allow .each_char method
  # wordB = wordB.downcase || use if you want output to be lowercased
  wordB.each_char do |letter|
    if is_vowel?(letter) == false && vowels_tracker < 1
      wordB_index += 1
    else
      vowels_tracker += 1
    end
  end
  
 ## OLD CODE
  #store word starting from that index
  #second_half = ""

  # second_index = 0
  # #accounts for words with zero vowels
  # if index >= wordB.length
  #   second_half = wordB
  #   #stores letters until first vowel is hit (including)
  # else
  #   wordB.each_char do |letter|
  #     if second_index >= index
  #       second_half << letter
  #       second_index += 1
  #     else
  #       second_index += 1
  #     end
  #   end
  # end

  if wordB_index == wordB.length
    second_half = wordB
  else
    second_half = wordB[wordB_index..wordB.length - 1]
  end
  
  #add both words together and display
  portmanteau = first_half + second_half
  puts "Your words (#{wordA}) and (#{wordB}) turn into (#{portmanteau})!\n\n"
end

puts "Hello and welcome to the Portmanteau Generator program! You will be asked to enter two words and we will generate a portmanteau for you."

continue_game = "Y"
while continue_game == "Y"
  run_generator

  #option for user to continue or end program.
  print "Continue? (Y/N): "
  continue_game = gets.chomp.upcase!
end
