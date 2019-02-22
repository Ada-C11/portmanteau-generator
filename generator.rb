def is_vowel?(word)
    word.each_char do |char|
        if char == "a" || char == "e" || char == "i" || char == "o" || char == "u"
            return true
        else
            return false
        end
    end
end

def input_validation(word)
    
    while !(word.include?('a') || word.include?('e') || word.include?('i') || word.include?('o') || word.include?('u')) || (word.length < 2) do

        puts "Input is invalid. The word needs at least 1 vowel and at least 2 characters. Try again."
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

    # variable to store the index of the last vowel of the 1st word
    index_1 = -1 
    # initialize variable to temporarily count indexes to add only if a vowel is found
    temp_index_counter_1 = -1 
    first_word.each_char do |v|
        # increment so index is now 0
        temp_index_counter_1 += 1 
        if is_vowel?(v)
            # add the counted indexes when the first vowel is found to get it's index
            index_1 += temp_index_counter_1 
            # restart counting indexes after a vowel is found so that the indexes after last vowel are never added to i1
            temp_index_counter_1 = 0 
        end
    end

    first_part = first_word[0..index_1]
    puts first_part

# find the index of the first vowel of 2nd word
    # variable to store the index of the first vowel of the 2nd word
    index_2 = -1 
    # initialize variable to temporarily count indexes to add only if a vowel is found
    temp_index_counter_2 = 0    
    second_word.each_char do |v|
        # temporarily count indexes to add only if a vowel is found
        temp_index_counter_2 += 1 
        if is_vowel?(v)
            # add the counted indexes when the first vowel is found to get it's index
            index_2 += temp_index_counter_2 
            break
        end
    end

    if index_2 < 0 
        second_part = second_word[0..second_word.length]
    else
        second_part = second_word[index_2..second_word.length]
    end

    puts second_part

    puts "\n\n#{first_word} + #{second_word} is #{first_part}#{second_part}!"
    
end
    
run_generator

answer = "yes"
loop do
    puts "Do you want to continue?"
    answer = gets.chomp.downcase

    break if answer == "no" || answer == "n"
    run_generator
end
