# Portmanteau generator program

# checks letters for if it is a vowel
def is_vowel?(letter)
    return letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
end

# validates if word is long enough to continue
def input_validation
    # request user input
    input = gets.chomp

    # word length validation
    until input.length > 1
        puts "Please enter more than one character."
        input = gets.chomp
    end
    return input.downcase
end

# finds last vowel of a word
def last_vowel(word)
    i = 0
    last_vowel = word.length
  
    word.each_char do |letter|
        if is_vowel?(letter)
            last_vowel = i
        end
        i += 1 
    end
    # returns word from first letter to letter before last vowel
    # note for dee ==> I assumed that if the first letter of the first word is a vowel that the whole first word would be used
    return word[0..last_vowel-1]
end

# finds first vowel of a word
def first_vowel(word)
    i = 0
    first_vowel = 0
    
    word.each_char do |letter|
        if is_vowel?(letter)
            first_vowel = i
            break
        end
        i += 1 
    end
    # returns word from first vowel to the last letter
    return word[first_vowel..word.length]
end

# requests word input from user and displays inputs
def run_generator
    # requests first word from user
    puts "\nWhat is the first word to combine?\n"

    # stores valid input
    word_a = input_validation

    # requests second word from user
    puts "\nWhat is the second word to combine?\n"

    # stores valid input
    word_b = input_validation

    # displays both words on screen
    puts "\nThe first input is #{word_a}"
    puts "The second input is #{word_b}"
    puts "in the run_generator method"

    # returns first word from first letter to letter before last vowel 
    word1 = last_vowel(word_a)

    # returns second word from first vowel to the last letter
    word2 = first_vowel(word_b)

    # generates portmanteau
    portmanteau = word1 + word2

    # displays user's portmanteau 
    return "\nYour portmanteau is: #{portmanteau}"
end

# runs generator
puts run_generator
