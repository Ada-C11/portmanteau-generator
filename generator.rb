# Portmanteau Generator
# Create method is_vowel? to test if included letters are vowels
def is_vowel?(letter)
   if ["a", "e", "i", "o", "u"].include?(letter)
    return true 
   else 
    return false 
   end 
end

# Create method run_generator which takes user input
def run_generator
    puts "What is the first word to combine?"
    first_word = gets.chomp
    # If the first word is less than two, require new user input until it is => to 2
    while (first_word).length < 2
        puts "Input must be at least two characters. Please re-enter the first word."
        first_word = gets.chomp
    end

    puts "What is the second word to combine?"
    second_word = gets.chomp
    # If the second word is less than two, require new user input until it is => to 2
    while (second_word).length < 2
        puts "Input must be at least two characters. Please re-enter the second word."
        second_word = gets.chomp
    end
    # Set new variables for the first words truncated word and index
    first_half = nil
    # Set index of first word equeal to the length of the first word minus 1 (because index starts at zero)
    first_index = first_word.length - 1
    # Reverses the string and use ("!") and keep it reversed
    first_word.reverse!
    # Iterate over each character of the first word to find if its a vowel
    first_word.each_char do |c|
        if !is_vowel?(c) == true
          first_index -= 1
        else
          first_word.reverse!
          first_half = first_word.slice(0...first_index)
        break
        end
        # If there are no vowels use the whole word
        if is_vowel?(c) == false
          first_half = first_word
        end
    end
    # Initialize a variable second_half 
    second_half = nil
    # Iterate over each character of the second word to find vowels and then break
    second_word.each_char do |c|
        if is_vowel?(c) == true
            word2_start = second_word.index(c)
            word2_end = second_word.length
            second_half = second_word.slice(word2_start, word2_end)
        break
        end
        # If there are no vowels use the whole word
         if is_vowel?(c) == false
          second_half = second_word
         end
    end
    # Create the portmanteau by combining the first and second halfs.
    portmanteau = first_half + second_half

    puts "#{first_word} + #{second_word} is #{portmanteau}!"
    # puts "in the run_generator method"
end

# Run the program
run_generator


# Ask if user whants to run program again and runs method run_generator if so
 answer = "y"
 while answer == "y"
    puts "Would you like to run again? y || n"
    answer = gets.chomp
        if answer == "y"
            run_generator
        else 
            break
        end
 end

# Some Pseudocode
# while user input for word 1 & 2 is less than two characters
    # print out message saying invalid, input must be at least two characters
    # ask user to re-enter input for same prompt
# end 


# first word excludes last vowel
# second word keeps every letter after and including last vowel
# combine two words
