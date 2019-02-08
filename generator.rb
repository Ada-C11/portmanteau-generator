def is_vowel?(letter)
  if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
    puts "true"
  else
    puts "false"
  end
end

def run_generator
  puts "What is the first word to combine?: "
  a = gets.chomp
  if a.length < 2
    puts "Error. Your input is invalid. Please sumbit a word with at least 2 characters."
    until a.length >= 2
      puts "Please provide the first word:"
      a = gets.chomp
    end
  end

  puts "What is the second word to combine?: "
  b = gets.chomp
  if b.length < 2
    puts "Error. Your input is invalid. Please sumbit a word with at least 2 characters."
    until b.length >= 2
      puts "Please provide the second word:"
      b = gets.chomp
    end
  end

  puts "The first input is #{a}."
  puts "The second input is #{b}."
  puts "in the run_generator method"

  i = 0
  part1 = 0
  a.reverse.each_char do |letter|
    if is_vowel?(letter)
      part1 = (a.length + 1) - i
      break
    end
    i += 1
  end

  i = 0
  part2 = 0
  b.each_char do |letter|
    if is_vowel?(letter)
      part2 = i
      break
    end
    i += 1
  end

  whole_word = a[0...part1] + b[part2...b.length]
  puts whole_word
end

run_generator
