require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# my_game.enemies.select{|player| player.name = "player1"}

puts "--------------------------"
puts "|Welcome in the figth game|"
puts "|  Surive mother f**ker   |"
puts "--------------------------"
puts "Veuillez renseigner votre nom"
user_name = gets.chomp
my_game = Game.new(user_name)
my_game.show_players
tour = 0
puts "----------------------"
while my_game.is_still_ongoin?
  tour += 1
  puts "Tour #{tour}", ''
  my_game.menu 
  puts "----------------------"
  my_game.menu_choice
  puts "----------------------"
  my_game.enemies_attack
  puts "----------------------"
  my_game.new_players_in_sight
end
my_game.end


binding.pry