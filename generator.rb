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
  word_A.reverse.each_char do |c|
    word_A_chop += 1
    if is_vowel?(c)
      break
    end
  end
  word_A_chop = word_A.length - word_A_chop
  puts word_A[0...word_A_chop]
  # puts "Please enter your second word for the portmanteau."
  # word_B = gets.chomp
  # until word_B.length >= 2
  #   puts "I'm sorry, this word is invalid. Please enter a word that is at least 2 characters long."
  #   word_B = gets.chomp
  # end
  # word_B_end = word_B.length - 1
  # word_B_new = ""
  # word_B.reverse.each_char do |c|
  #   if is_vowel?(c)
  #     word_B_new = word_B_new + c
  #   end
end

run_generator
# puts word_B_new
# vowel_count = 0
# word_A.each_char do |c|
#   if is_vowel?(c)
#     vowel_count += 1
#   else
#     vowel_count += 0
#   end
# end
# word_A_array = word_A.split(//)
# puts word_A_array[0...vowel_count]
# half_A = word_A_array[0...vowel_count].join
# puts half_A

# puts "Thanks! The first word you entered is #{word_A}, and the second word you entered is #{word_B}."
# puts "in the run_generator method"
# end
