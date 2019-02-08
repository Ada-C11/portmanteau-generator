# from hw document, to find a vowel
def is_vowel?(letter)
  case letter
    when "a", "e", "i", "o", "u", "A", "E", "I", "O", "U" 
      return true
    else 
        return false
    end
end

# my attempt at getting the game to play again
play_game = true

while play_game

    def run_generator
      # To make sure that the input is greater than one character
      puts "Please enter the first word:"
      first_word = gets.chomp
      until first_word.length > 1
        puts "Please enter a word greater than 1 character long: "
        first_word = gets.chomp
      end
      
      puts "Please enter the second word:"
      last_word = gets.chomp
      until last_word.length > 1
        puts "Please enter a word greater than 1 character long: "
        last_word = gets.chomp
      end

            
      puts "The first input is #{first_word}"
      puts "The second input is #{last_word}"
      puts "in the run generator method."

      #initialize the new truncated word variables
      first_new_word = ""
      last_new_word = ""

      # first word, iterate through and from -1 index to last vowel join those letters and assign to first_new_word
      i = first_word.length - 1
      first_word.reverse.each_char do |letter|
        if is_vowel?(letter)
          first_new_word = first_word[0...i]
          break
        else # if first word doesn't have a vowel
            first_new_word = first_word
        end
        i -= 1
      end

        i = 0
        last_word.each_char do |letter|
            if is_vowel?(letter)
                last_new_word = last_word[i..-1]
                break
            else #if last_word doesn't have a,e,i,o, or u
                last_new_word = last_word
            end
            i += 1
        end

    # combine words
    def combine_words(first, last)
    first + last
    end
        
    output = combine_words(first_new_word, last_new_word)
    puts output
    
    end

    run_generator
# outside of the run_gen method, asks if you want to do it again
puts "Do you want to play again?(y/n)"
    answer = gets.chomp

until answer == "y" || answer == "n"
    puts "please enter y or n:"
    answer = gets.chomp
end
if answer != "y"
    play_game = false
end
end
