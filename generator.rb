def run_generator

	print "What is the first word you wanna put in this blender? "
		former_word = gets.chomp
	print "And the second word, please? "
		latter_word = gets.chomp

	split_former = former_word.downcase.rindex(/[aeiou]/)
	split_latter = latter_word.downcase.index(/[aeiou]/)

splits = case
	
		when (split_former != nil) && (split_latter != nil) 
			portma = former_word[0..(split_former - 1)] 
			nteau = latter_word[split_latter..latter_word.length]   
			portmanteau = portma.capitalize + nteau.downcase
			"Your brand-new word is: #{portmanteau}!"
	
		when (split_former == nil) && (split_latter == nil)
			puts "Please try some words with vowels!"
			run_generator
	
		when (split_former == nil) && (split_latter != nil)
			portma = former_word
			nteau = latter_word[split_latter..latter_word.length]
			portmanteau = portma.capitalize + nteau.downcase
			"Your brand-new word is: #{portmanteau}!"
	
		when (split_former != nil) && (split_latter == nil)
			portma = former_word[0..(split_former - 1)]
			nteau = latter_word
			portmanteau = portma.capitalize + nteau.downcase
			"Your brand-new word is: #{portmanteau}!"
	
		else
			puts "Try again, please!"
			run_generator
	
		end
	
	puts "Crunch crunch crunch. The portmantobot chewed up your #{former_word.downcase} and your #{latter_word.downcase}!"
	puts splits

end

run_generator
	
