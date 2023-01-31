require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



puts "--------------------------"
puts "|Welcome in the figth game|"
puts "|  Surive mother f**ker   |"
puts "--------------------------"
puts "Veuillez renseigner votre nom"
user_name = gets.chomp
my_game = Game.new(user_name)
my_game.show_players
p my_game.enemies[1].name
while my_game.is_still_ongoin?
  my_game.menu
  my_game.menu_choice
  my_game.enemies_attack
end
my_game.end


binding.pry