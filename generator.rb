def is_vowel?(letter)
  case letter
  when "a", "e", "i", "o", "u"
    true
  else
    false
  end
end

def run_generator
  puts "Please enter the first word you would like to combine."
  word1 = gets.chomp.downcase
  until word1.length >= 2
    puts "Please make sure the word is at least two characters."
    word1 = gets.chomp.downcase
  end

  puts "Please enter the second word you would like to combine."
  word2 = gets.chomp.downcase
  until word2.length >= 2
    puts "Please make sure the word is at least two characters."
    word2.gets.chomp.downcase
  end

  puts "The first word is #{word1} and the second word is #{word2} in the run-generator method."

  chunk1 = word1
  word1.each_char do |c|
    if is_vowel?(c) == true
      word1_chunks = word1.split(c)
      unless word1_chunks == []
        chunk1 = word1.chomp(c + word1_chunks[-1])
      end
    end
  end

  puts "Chunk 1 is #{chunk1}"

  chunk2 = word2
  word2.each_char do |c|
    if is_vowel?(c) == true
      word2_chunks = word2.split(c)
      unless word2_chunks == []
        chunk2 = c + word2_chunks.last
      end
      puts "Chunk 2 is #{chunk2}"
      break
    end
  end

  puts "The Portmanteau is #{chunk1}#{chunk2}!"
end

run_generator

puts "If you would like to continue, please enter yes."
answer = gets.chomp.downcase
while answer == "yes"
  run_generator
  puts "If you would like to continue, please enter yes."
  answer = gets.chomp.downcase
end

puts "Thank you for using this program!"
