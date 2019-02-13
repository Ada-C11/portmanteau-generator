# Portmanteau_generator is a command line interface (CLI) program that allows any user to interact with the command
# line to perform simple manipulation of words and create portmanteaus.
class Portmanteau_generator
  VOWEL = "AEIOU"

  # Method runs generator program and asks if user wants to run again.
  # To exit user enters any key not "Y" or "y".
  def run_generator
    puts "Welcome to the Ada Portmanteau Generator!\n\n"
    user = "Y"
    while user == "Y"
      first = get_word("first")
      second = get_word("second")
      puts "\nThe first input is #{first} and the second"
      puts "input is #{second} in the run-generator method."
      puts "\nHere is your Portmanteau: #{combo(first, second)}"
      print "Enter Y to run again: "
      user = gets.chomp.upcase
    end
    puts "Good-Bye!"
    return true
  end

  # Method gets word from user with min length of 2 and contains at least one vowel.
  # @Param string -> order
  # @Returns string
  def get_word(order)
    print "What is the #{order} word to combine? "
    word = gets.chomp.upcase
    while word.length < 2 || !(has_vowel?(word))
      puts "Please ensure word is greater than one character and contains a vowel!"
      word = gets.chomp.upcase
    end
    return word
  end

  # Method uses combo rules to cancatenate two strings, evaluates to one string.
  # combo rule first -> first[0...(last instance of vowel)]
  #            second -> second[(first intance of vowel)..-1]
  #            use every letter if no vowel*
  #               -> only modify strings with vowels
  #                *LOGIC NOT REQ ANYMORE since program requires user input to include a vowel.
  # @Param string -> first, string -> second
  # @Returns string
  def combo(first, second)
    first_length = first.length
    # Find index of last vowel in first word.
    #    -> subtract index of reversed first's first vowel from the length of first word minus 1.
    indexed_vowel_f = (first_length - 1) - first_vowel(first.reverse)
    # If the first word has a vowel then it chop at the index of the last vowel. (exclusive)
    #    -> if no vowel present indexed_vowel_f will be equal to -1.
    first = first[0...indexed_vowel_f] if indexed_vowel_f != -1
    # Find index of first vowel in second word.
    indexed_vowel_s = first_vowel(second)
    # If the second word has a vowel then chop at the index of the first vowel. (inclusive)
    #    -> if no vowel present indexed_vowel_f will be equal to length of second word.
    second = second[indexed_vowel_s..-1] if indexed_vowel_s != second.length
    return (first + second)
  end

  # Method returns index of first_vowel word. If no vowel in word, method returns length of word.
  # @Param string -> word
  # @Returns int
  def first_vowel(word)
    word.split("").each do |char|
      if is_vowel?(char)
        return word.index(char)
      end
    end
    return word.length
  end

  # Method takes a letter and checks if it is a vowel or if string contains one or more vowels.
  # @Param string -> letter
  # @Returns boolean
  def is_vowel?(letter)
    return letter.count(VOWEL) != 0
  end

  alias_method :has_vowel?, :is_vowel?
end

ada_word_combo = Portmanteau_generator.new
ada_word_combo.run_generator
