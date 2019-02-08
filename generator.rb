def is_vowel?(letter)
    result = false
    if (letter == "a"|| letter == "e" || letter == "i" || letter == "o" || letter == "u")
        result = true
    end
    return result
end

    #test1 = "i"
    #puts "Is #{test1} a vowel?"
    #puts is_vowel?(test1)

    #test2= "v"
    #puts "Is #{test2} a vowel?"
    #puts is_vowel?(test2)

def run_generator
    puts "Please enter your first word:"
    first_word = gets.chomp.downcase
    until first_word.length >= 2
        puts "Please enter a word 2 character or longer"
        first_word = gets.chomp.downcase
    end

    first_word_array = []
    first_word.each_char{|x| first_word_array.push(is_vowel?(x))}
    until first_word_array.include?(true) == true
        puts "Please enter a word with a vowel:"
        first_word = gets.chomp.downcase
        first_word_array = []
        first_word.each_char{|x| first_word_array.push(is_vowel?(x))}
    end

    puts "Please enter your second word:"
    second_word = gets.chomp
    until first_word.length >= 2
        puts "Please enter a word 2 character or longer"
        first_word = gets.chomp
    end

    second_word_array = []
    second_word.each_char{|x| second_word_array.push(is_vowel?(x))}
    until second_word_array.include?(true) == true
        puts "Please enter a word with a vowel:"
        second_word = gets.chomp.downcase
        second_word_array = []
        second_word.each_char{|x| second_word_array.push(is_vowel?(x))}
    end


    puts "The first word is #{first_word} and the second word is #{second_word} in the run_generator method"
    

i = first_word.length - 1
until is_vowel?(first_word[i]) == true
  i = i - 1
end

first_half = first_word[0, i]

i = 0
until is_vowel?(second_word[i]) == true
    i = i + 1
end

second_half = second_word[i, second_word.length]

word = first_half + second_half
puts word
end

run_generator
