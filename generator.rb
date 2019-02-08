# establishing the run_generator method
# getting all of the input needed
# storing those pieces of input into variables
# being able to print out those variables
# iterating through individual characters in words to check which characters are vowels

# wave 1:
def is_vowel?(vowel)
    vowels = %w{a e i o u}
    if vowels.include?(vowel)
        return true
    else
        return false
    end
end

# wave 2:
# reversing word to find first vowel and split it there
def first_word(word_no_1)
    vowel_first_word = -1
    word_no_1.each_char { |letter| 
        if is_vowel?(letter) 
            vowel_first_word = word_no_1.rindex(letter)
        end
    }
    
    if vowel_first_word == -1
        return word_no_1
    end
    return word_no_1.slice(0...vowel_first_word)
end

def second_word(word_no_2)
    word_no_2.each_char { |letter|
        if is_vowel?(letter)
            word_2 = word_no_2.index(letter)
            return word_no_2.slice(word_2...word_no_2.length)
        end
    }
    return word_no_2
end

def run_generator
    puts "What is your first word to combine?"
    word_a = gets.chomp

    # validation rule
    until word_a.length >= 2
        puts "Please enter a word greater than 1 character long"
        word_a = gets.chomp
    end

    puts "What is your second word to combine?"
        word_b = gets.chomp

    # validation rule
    until word_b.length >= 2
        puts "Please enter a word greater than 1 character long"
        word_b = gets.chomp
    end

    first_half = first_word(word_a)
    second_half = second_word(word_b)
    puts "The first input is #{ word_a } and the second input is #{ word_b }.  Together, they're #{ first_half + second_half }!"
#    puts "The first input is #{ word_a }"
#    puts "The second input is #{ word_b }"
#    puts "in the run_generator method"
#    puts is_vowel?("g")
#    puts is_vowel?("i")
end

run_generator
