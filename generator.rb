def get_the_vowel(word)
  word.length > 1 && word =~ /[aeiou]/
end 

puts "Please enter your first word"
first_word = gets.chomp.downcase
 until get_the_vowel(first_word)
  puts "Please enter a word with 2 or more characters and a vowel"
  first_word = gets.chomp.downcase
  end
 
words = []
a = first_word.rindex(/[aeiou].*/)
word_a = first_word[0...a]
words << word_a

puts "Please enter your second word"
second_word = gets.chomp.downcase
  until get_the_vowel(second_word)
  puts "Please enter a word with 2 or more characters and a vowel"
  second_word = gets.chomp.downcase
  end 

b = second_word.split(/([aeiou].*)/)
word_b = b[1]
words << word_b

puts "Word #{word_a} + #{word_b} is #{words.join("")}"

