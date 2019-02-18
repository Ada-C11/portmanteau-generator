
def length_check(word)
  until word.length >= 2
    puts "please give me a word at least two characters long"
    word = gets.chomp.to_s
  end
end

def is_vowel?(letter)
  return "aeiou".include?(letter.downcase)
end

def notherVowel(string)
  string = string.downcase
  return string.include?(?a) || string.include?(?e) || string.include?(?i) \
           || string.include?(?o) || string.include?(?u)
end

def firstWord()
  puts "give me the first word"
  @first = gets.chomp.to_s
  #the bit below and notherVowel method is only for the optional part, which makes some
  #of the original code not make sense, but needed for earlier assignment paramaters
  until notherVowel(@first)
    puts "try the first word again, but give me a vowel"
    @first = gets.chomp.to_s
  end
  length_check(@first)
  @firstArray = []
  @first.each_char do |x|
    @firstArray << x
  end
  loop do
    x = @firstArray.slice!(-1)
    if is_vowel?(x)
      break
    end
    if @firstArray.length == 0
      break
    end
  end
  puts @firstArray
end

def secondWord()
  puts "give me a second word"
  @second = gets.chomp.to_s
  length_check(@second)
  @secondArray = []
  @second.each_char do |x|
    @secondArray << x
  end
  @secondArray.each_with_index do |x, i|
    if is_vowel?(x)
      @secondArray.slice!(0, i)
      break
    end
  end
end

def run_generator
  firstWord()
  secondWord()
  puts "the first input is #{@first}"
  puts "the second input is #{@second}"
  puts "in the run_generator method"
  port = ""
  if @firstArray.length == 0
    port << @first
  else
    @firstArray.each do |x|
      port << x
    end
  end
  @secondArray.each do |x|
    port << x
  end
  puts port
end

run_generator
loop do
  puts "do you want to keep running the Portmanteau generators? y/n?"
  answer = gets.chomp
  if answer == "yes" || answer == "y"
    run_generator
  else
    break
  end
end
