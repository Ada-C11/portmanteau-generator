
# This creates a method that looks for a vowel. 
def is_vowel?(letter)
  case letter
  when "a", "e", "i", "o", "u"
      return true
  else 
      return false
  end 
end
# Method gets user input for first and second word. Asks user to input again if enter does not meet parametes(must be at least 2 characters long.)
def run_generator 
    puts "What is the first word to combine?"
    word1 = gets.chomp
    if word1.length < 2 
        puts "Input must be at least two characters long and include a vowel."
        puts "Please enter the first word."
        word1 = gets.chomp
        
    end 
    puts "What is the second word to combine?"
    word2 = gets.chomp
    if word2.length < 2
        puts "Input must be at least two characters long and include a vowel."
        puts "Please enter the second word."
        word2 = gets.chomp
    end 


 
#check if first word contains a vowel then deletes at the last vowel. 
counter1 = 0
rev_word1 = word1.reverse

rev_word1.each_char do |letter|
    if !is_vowel?(letter)
        counter1 +=1
    else
        break
    end
end 

puts "Word 1s first vowel when revered is at index #{counter1}"
word_part1 = word1[0...((word1.length - 1)) - counter1]
puts "The first half of your portmanteau is #{word_part1}"

# In the second word, find the first instance of a vowel. Keep every letter of the second word 
# starting after and including the first vowel. 
counter2 = 0
word2.each_char do |letter|
    if !is_vowel?(letter)
      counter2 += 1
    else
      break
    end
  end
  puts "Word 2s first vowel is at index #{counter2}"
  word_part2 = word2[counter2..(word2.length)]
  puts "\nThe second half of your portmanteau is #{word_part2}"

  # build the portmanteau by assigning it the
  # combination of word part A and word part B

  portmanteau = word_part1 + word_part2
  puts "\n#{word1} and #{word2} in the run_generator method"
  puts "The current portmanteau is #{portmanteau}"
  puts "\n#{word1} + #{word2} = #{portmanteau}"
  
  # return portmanteau

end 

puts run_generator 
 

