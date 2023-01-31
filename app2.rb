require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



puts "--------------------------"
puts "|Welcome in the figth game|"
puts "|  Surive mother f**ker   |"
puts "--------------------------"

puts "Choisi ton prénom"
puts ">>"
prenom = gets.chomp
player1 = HumanPlayer.new("#{prenom}")
player2 = Player.new("josé")
player3 = Player.new("andré")

enemies = [player2, player3]
tour = 0
  while player1.life_points > 0 and (player2.life_points and player3.life_points) > 0
    puts "#{player1.show_state}"
    puts "Tour numéro #{tour}"
    puts "Plusieurs options s'offre à vous"
    puts "Pour chercher une arme tapez 'a'"
    puts "Pour chercher un pack de soin tapez 's'"
    puts "Pour attaquer José tapez '1'"
    puts "Pour attaqier André tapez '0'"
      choice = gets.chomp
        case choice
          when "a"
            player1.search_weapon
          when "s"
            player1.search_health_pack
          when "1"
            player1.attack(player2)
          when "0"
            player1.attack(player3)
        end
    puts "Les ennemis vous attaquent"
    enemies.each {|player| if player.life_points.positive? then player.attack(player1) end }
    tour += 1
  end
binding.pry