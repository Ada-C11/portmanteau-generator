def find_favorite_dessert(dessert_list)

  favorite_dessert = nil
  # 1:
  # puts "The value of favorite_dessert: #{favorite_dessert}"
  best_score = 0

  dessert_list.each do |dessert|
    puts "On a scale of 1 to 10, how much do you like #{dessert}?"
    score = gets.chomp.to_i
    if score > best_score
      favorite_dessert = dessert
      best_score = score
    end
  end

  # 2:
  # puts "The value of score: #{score}"

  # 3:
  # puts "The value of best_score: #{best_score}"

  # 4:
  # puts "The value of favorite_dessert: #{favorite_dessert}"

  return favorite_dessert

end

# 5:
# puts "The value of dessert: #{dessert}"

dessert = find_favorite_dessert(['pie', 'cake', 'ice cream'])

# 6:
# puts "The value of dessert: #{dessert}"

puts "Sounds like you're a big fan of #{dessert}!"

# Look, a change!
