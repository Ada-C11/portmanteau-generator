# Make sure user inputted argument is long enough. If it's not, reprompt the user. Return new (or original, if already okay) input.
def check_length(word)
  until word.length > 1
    print "Your word must be at least 2 characters long. > "
    word = gets.chomp
  end
  return word
end

# Check if a letter is a vowel. If it is, return true. If not, return false.
def is_vowel?(letter)
  case letter
  when "a", "e", "i", "o", "u"
    return true
  else
    return false
  end
end

# Returns an integer of how many characters there are after the first vowel in an argument.
def segment_length(word)
  chars_before_vowel = 0
  word.each_char do |letter|
    if is_vowel?(letter)
      break
    end
    chars_before_vowel += 1
  end
  length = word.length - chars_before_vowel
  return length
end

# When given a word and a word number (1 or 2, depending on whether it's the first or second word in the Portmanteau), returns the correct word segment.
def make_portmanteau(word, word_number)
  # Return the whole word if there are no vowels.
  if segment_length(word) == 0
    return word
  end
  # Return correct segment of the word/string for the pormanteau.
  if word_number == 1
    # Figure out how many characters there are *before* the *last* vowel in the word (because it's calling the method on the reverse of the word).
    length = segment_length(word.reverse)
    # This segment is the first character in the word up to and not including the last vowel.
    segment1 = word[0...length - 1]
    return segment1
  elsif word_number == 2
    # Figure out how many characters there are after the first vowel in the word.
    length = segment_length(word)
    # Flip the word, cut it up to and including the last vowel, then flip it back so the segment is the first vowel in the word until the end of the word.
    segment2 = word.reverse[0..length - 1].reverse
    return segment2
  end
end

def run_generator
  print "What is your first word to combine? > "
  word_a = gets.chomp
  word_a = check_length(word_a)
  print "What is your second word to combine? > "
  word_b = gets.chomp
  word_b = check_length(word_b)
  portmanteau = make_portmanteau(word_a, 1) + make_portmanteau(word_b, 2)
  puts portmanteau
end

run_generator
