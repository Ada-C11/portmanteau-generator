# WAVE ONE/TWO
# is_vowel? 
def is_vowel?(letter)
    if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
        return true
    else
        return false
    end
end

# run generator
def run_generator #this is a method
# this is a test to make sure it worked properly:
    #   test_vowel = "i"
    #   puts "Is #{test_vowel} a vowel?"
    #   puts is_vowel?(test_vowel)

    #   test_consonant = "g"
    #   puts "Is #{test_consonant} a vowel?"
    #   puts is_vowel?(test_consonant)

# per the instructions in wave one
    puts "what is the first word to combine?"
    first_word = gets.chomp
    puts "what is the last work to combine?"
    second_word = gets.chomp
    puts "Your first word is #{first_word}"
    puts "Your second word is #{second_word}"
    puts "in the run_generator method"

# settiing up the index/dummy word [word1_end] to push values into
# using .reverse to count the first vowel (last vowel) and .each_char
    index = 0
    word1_end = nil
    (first_word.reverse).each_char do |letter|
        if is_vowel?(letter)
            word1_end = (first_word.length - 1) - index
        break
        end 
        index += 1
    end

    # same thing but easier bc we dont have to work backwards (we're looking for the first vowel of the second word. whew.)
    index = 0
    word2_start = nil
    (second_word).each_char do |letter|
        if is_vowel?(letter)
            word2_start = index
            break
        end 
        index += 1
    end

    # this didnt work but i could NOT figure out why
    # first_word_part = first_word.slice(0...word1_end)
    # second_word_part = second_word.slice(word2_start...second_word.length)
    
    # doing the same as above but this one worked(?)
    portmanteau = first_word[0...word1_end] + second_word[word2_start...second_word.length]

    puts portmanteau

end

#run baby run
run_generator
#boom!
