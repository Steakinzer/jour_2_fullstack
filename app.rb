require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("josé")
player2 = Player.new("andré")
player3 = HumanPlayer.new("pascalop")

puts player1.show_state
puts player2.show_state
puts "Que le combat commence"
puts "----------------------"
while player1.life_points > 0 and player2.life_points > 0 do
  if player1.life_points > 0 
    player1.attack(player2)
  end
  if player2.life_points > 0 
    player2.attack(player1)
  end
  puts "-----------------"
end






binding.pry