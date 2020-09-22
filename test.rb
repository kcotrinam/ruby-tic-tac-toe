def game_confirmation(answer)
  while (answer != 'y') && (answer != 'n')
    puts 'Do you want to play? (Y/N)'
    answer = gets.chomp.downcase
  end
  (answer == 'y') ? true : false
end

puts game_confirmation('y')
puts game_confirmation('n')
puts game_confirmation('r')
