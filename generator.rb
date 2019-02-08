def run_generator
  # This creates a method that looks for a vowel. 
  def is_vowel?(letter)
    if "aeiou".include?(letter)
        return true
    else 
        return false
    end 
  end
    puts "What is the first word to combine?"
    first_word = gets.chomp
    if first_word.length < 2 
        puts "Input must be at least two characters long and include a vowel."
        puts "Please enter the first word."
        first_word = gets.chomp
    end 
    puts "What is the second word to combine?"
    second_word = gets.chomp
    if second_word.length < 2
        puts "Input must be at least two characters long and include a vowel."
        puts "Please enter the second word."
        second_word = gets.chomp
    end 

    puts "The first word is #{first_word}"
    puts "The second word is #{second_word}" 
    puts "in the run generator method"
   
  # counts the number of vowels in the second word 
  # iterate through first_word characters
# Still struggling with the second wave. I'm going to update ASAP!

         
    
end 
# make a method for the first word that splits the first word AFTER the vowel.

# make a method that takes the second word and deletes everything before the second vowel.
# Combine both modified words together for the portmanteau.
# vowels = ["a", "e", "i", "o", "u"]

run_generator 
