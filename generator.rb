def is_vowel?(letter)
  case letter
  when "a", "e", "i", "o", "u"
    letter = true
  else
    letter = false
  end
  return letter
end

def run_generator
  puts "Please enter your first word for the portmanteau. It must be at least 2 characters long."
  word_A = gets.chomp
  until word_A.length >= 2
    puts "I'm sorry, this word is invalid. Please enter a word that is at least 2 characters long."
    word_A = gets.chomp
  end
  word_A_chop = 0
  word_A_last = word_A.length - 1
  word_A.reverse.each_char do |c|
    if !is_vowel?(c) && word_A_chop == word_A_last #Ensures words with no vowels will include the full word in portmanteau.
      break
    elsif is_vowel?(c)
      break
    end
    word_A_chop += 1
  end
  if word_A_chop == word_A_last #Ensures words with no vowels will include the full word in portmanteau.
    puts "The first half of your word is #{word_A}."
  else
    word_A = word_A[0...(word_A_last - word_A_chop)]
    puts "The first half of your word is #{word_A}."
  end
  puts "Please enter your second word for the portmanteau."
  word_B = gets.chomp
  until word_B.length >= 2
    puts "I'm sorry, this word is invalid. Please enter a word that is at least 2 characters long."
    word_B = gets.chomp
  end
  word_B_chop = 0
  word_B_last = word_B.length - 1
  word_B.each_char do |c|
    if is_vowel?(c) && word_B_chop == 0 #Ensures words beginning with vowels will include entire word in portmanteau.
      break
      # elsif is_vowel?(c) && word_B_chop == word_B_last #If word's first vowel is the word's last letter, last letter will be the only letter in the second half of portmanteau.
      #   break
    elsif is_vowel?(c)
      # word_B_chop += 1
      break
    elsif !is_vowel?(c) && word_B_chop == word_B_last
      word_B_chop = 0 #Reset to 0 so that all-consonant words will include entire word in portmanteau.
      break
    else
      word_B_chop += 1
    end
  end
  word_B = word_B[word_B_chop..word_B_last]
  puts "The second half of your word is #{word_B}."
  puts "\nYour portmanteau is #{word_A + word_B}."
end

run_generator
