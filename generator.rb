def length_check(word)
  until word.length >= 2
    puts "please give me a word at least two characters long"
    word = gets.chomp.to_s
  end
end

def is_vowel?(letter)
  return "aeiou".include?(letter.downcase)
end

def run_generator
  puts "give me the first word"
  first = gets.chomp.to_s
  length_check(first)
  firstArray = []
  first.each_char do |x|
    firstArray << x
  end
  loop do
    #could I just use later method on reversed
    x = firstArray.slice!(-1)
    if is_vowel?(x)
      break
    end
    if firstArray.length == 0
      break
    end
  end
  puts firstArray
  puts "give me a second word"
  second = gets.chomp.to_s
  length_check(second)
  secondArray = []
  second.each_char do |x|
    secondArray << x
  end
  secondArray.each_with_index do |x, i|
    if is_vowel?(x)
      secondArray.slice!(0, i)
      break
    end
  end
  puts "the first input is #{first}"
  puts firstArray
  puts "the second input is #{second}"
  puts secondArray
  puts "in the run_generator method"
  port = ""
  if firstArray.length == 0
    port << first
  else
    firstArray.each do |x|
      port << x
    end
  end
  secondArray.each do |x|
    port << x
  end
  puts port
end

#probable should make a quick optional method for having the program continue
#use more helper methods

run_generator
