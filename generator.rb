def is_vowel?(letter)
    letter.each_char do |char|
        if char == "a" || char == "e" || char == "i" || char == "o" || char == "u"
            return true
        else
            return false
        end
    end
end

def input_validation(word)
    while word.length < 2 do
        puts "The word must have 2 or more letters. Please enter again."
        word = gets.chomp
    end
    
    while !(word.include?('a') || word.include?('e') || word.include?('i') || word.include?('o') || word.include?('u')) do
        puts "Input is invalid. The word needs at least 1 vowel. Try again."
        word = gets.chomp
    end
    return word
end

def run_generator
    puts "What is the first word to combine?"
    first_word = input_validation(gets.chomp)

    puts "What is the second word to combine?"
    second_word = input_validation(gets.chomp)
    
    puts "\nThe first input is #{first_word}"
    puts "The second input is #{second_word}"

    i1 = -1 # variable to store the index of the last vowel of the 1st word
    tic1 = -1 # initialize variable to temporarily count indexes to add only if a vowel is found
    first_word.each_char do |v|
        tic1 += 1 # increment so index is now 0
        if is_vowel?(v)
            i1 += tic1 # add the counted indexes when the first vowel is found to get it's index
            tic1 = 0 # restart counting indexes after a vowel is found so that the indexes after last vowel are never added to i1
        end
    end

    first_part = first_word[0..i1]
    puts first_part

# find the index of the first vowel of 2nd word
    i2 = -1 # variable to store the index of the first vowel of the 2nd word
    tic2 = 0    # initialize variable to temporarily count indexes to add only if a vowel is found
    second_word.each_char do |v|
        tic2 += 1 # temporarily count indexes to add only if a vowel is found
        if is_vowel?(v)
            i2 += tic2 # add the counted indexes when the first vowel is found to get it's index
            break
        end
    end

    if i2 < 0 
        second_part = second_word[0..second_word.length]
    else
        second_part = second_word[i2..second_word.length]
    end

    puts second_part

    # puts "\nLast vowel of first word: #{last_vowel} and index is #{i1}"
    # puts "First vowel of second word: #{first_vowel} and index is #{i2}"

    puts "\n\n#{first_word} + #{second_word} is #{first_part}#{second_part}!"
    
end
    
run_generator

answer = "yes"
while answer == "yes" || answer == "y" do
    puts "Do you want to continue?"
    answer = gets.chomp.downcase

    if answer == "yes" || answer == "y"
        run_generator
    else
        break
    end
end
