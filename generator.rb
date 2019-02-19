def is_vowel(letter)
  case letter
  when "a", "e", "i", "o", "u"
    return "true"
  else
    return "false"
  end
end

def rev_str(strg)
  aa = strg.split("")
  rev = Array.new
  aa.length.times do
    rev << aa.pop
  end
  rev = rev.join
  return rev
end

def check_length(word)
  if word.length < 2
    until word.length > 1
      puts "Your word must be 2 or more characters."
      word = gets.chomp
    end
    return word
  else
    return word
  end
end

def vowel_index(word)
  count = 0
  word.each_char { |letter|
    if is_vowel(letter) == "false"
      count += 1
    else
      break
    end
  }
  return count
end

def check_contain_vowel(word)
  count = vowel_index(word)
  if count == word.length
    until count != word.length
      puts "Word must contain a vowel."
      word = gets.chomp
      count = vowel_index(word)
    end
  end
  return word
end

def run_generator
  #----get first and second word from caller----
  puts "What is the first word to combine?"
  a = gets.chomp.downcase
  a = check_length(a)
  a = check_contain_vowel(a)
  # get second word
  puts "What is the second word to combine?"
  b = gets.chomp.downcase
  b = check_length(b)
  b = check_contain_vowel(b)

  #----find vowel indices
  #first word
  rev = rev_str(a) #reverse string
  count1 = vowel_index(rev)
  #since word was reversed, find index of original word
  index1 = a.length - count1 - 1

  #second word
  count2 = vowel_index(b)
  index2 = count2

  #----splice words according to rules
  #first word
  #if no vowels found then print out entire word, otherwise extract substrings
  if count1 == a.length
    firstword = a
  else
    firstword = a.slice(0...index1)
  end
  #second word
  #if no vowels found then print out entire word, otherwise extract substrings
  if count2 == b.length
    secondword = b
  else
    secondword = b.slice(index2..b.length)
  end

  #----combine words
  word = firstword + secondword
  #print out combined word
  puts word
end

run_generator
rerun = nil
until rerun == "n" || rerun == "no"
  puts "Would you like to re-run this program? Write 'Y' for yes and 'N' for no."
  rerun = gets.chomp.downcase
  case rerun
  when "yes", "y"
    run_generator
  else
  end
end
