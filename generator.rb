def run_generator
  puts "What is the first word to combine?"
  word_A = gets.chomp

  until (word_A.length > 1 && word_A =~ /[aeiou]/)
    puts "Invalid input - must be more than two characters and contain a vowel."
    word_A = gets.chomp
  end

  puts "What is the second word to combine?"
  word_B = gets.chomp

  until (word_B.length > 1 && word_B =~ /[aeiou]/)
    puts "Invalid input - must be more than two characters and contain a vowel."
    word_B = gets.chomp
  end

  index_A = word_A.rindex(/[aeiou]/, -2)
  arr_A = []
  arr_A[0] = word_A[0...index_A] #try with 3 . remove -1

  index_B = word_B.split(/([aeiou].*)/)
  arr_B = index_B[1]

  final = arr_A.join
  final << arr_B

  puts "The first input is #{word_A} and the second input is #{word_B} in the run_generator method. Your new portmanteau is #{final}."

  puts "Would you like to continue? (Y or N)"
  answer = gets.chomp.upcase

  if answer == "Y"
    run_generator
  elsif answer == "N"
    puts "Bummer. See ya."
  elsif puts "I said put Y or N."
    answer = gets.chomp.upcase
  end
end

run_generator
