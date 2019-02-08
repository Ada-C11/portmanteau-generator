# Initiate array of vowels accessible everywhere
VOWELS = ["a", "e", "i", "o", "u"]

# Check if character is a vowel
def is_vowel? (letter)
    if VOWELS.include? (letter)
        true
    else
        false
    end
end

# Get user input to form new word
def run_generator

  puts "What is the first word to combine?"
  word_A = gets.chomp
  until word_A.size >= 2 
    puts "Your word should have at least 2 letters."
    word_A = gets.chomp
  end

  # First segment of new word
  new_A = ""
    
    # If word has no vowels, use entire word
  if word_A.count("aeiou") == 0
    new_A = word_A
  else
    # Select segment from first character to last vowel, exluding last vowel
    i = word_A.length - 1
    word_A.reverse.each_char do |v|
      if is_vowel?(v) == true 
        new_A = word_A[0...i]
        break
      end
      i -= 1
    end
  end

  # Get input for second part of new word
  puts "What is the second word to combine?"
  word_B = gets.chomp
  until word_B.size >= 2
    puts "Your word should have at least 2 letters."
    word_B = gets.chomp
  end
    
  # Second segment of new word
  new_B = ""
    
  # If word has no vowels, use entire word
  if word_B.count("aeiou") == 0
    new_B = word_B
  else
  # Select segment from first vowel until the last character
    i = 0
    word_B.each_char do |v|
      if is_vowel?(v) == true
        new_B = word_B[i..-1]
        break
      end
      i += 1
    end
  end  
  # Display results
  puts "The first word is #{word_A}"
  puts "The second word is #{word_B}"
  puts "Your portmanteu is #{new_A}#{new_B}"

end

run_generator
