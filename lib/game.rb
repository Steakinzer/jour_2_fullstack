# frozen_string_literal: true

# Class qui permet de faire chier
class Game
  attr_accessor :human_player, :enemies, :players_left, :enemies_in_sight

  def initialize(human_player)
    @players_left = 6
    @enemies_in_sight = []
    @human_player = HumanPlayer.new(human_player)
    4.times do |i|
      @enemies_in_sight << Player.new("player#{i + 1}")
    end
  end

  def kill_player
    @enemies_in_sight = @enemies_in_sight.select { |player| player.life_points.positive? }
  end

  def is_still_ongoin?
    @human_player.life_points.positive? && @enemies_in_sight.length.positive?
  end

  def show_players
    @human_player.show_state
    puts "Il reste #{@enemies_in_sight.length} joueurs"
  end

  def menu
    puts "#{@human_player.show_state}"
    puts "Plusieurs options s'offre à vous"
    puts "Pour chercher une arme tapez 'a'"
    puts "Pour chercher un pack de soin tapez 's'"
    @enemies_in_sight.each { |player| puts "Pour attaquer #{player.name} tapez #{@enemies_in_sight.index(player)}" }
  end

    # def kill_player
    #   @enemies[2].life_points = 0
    # end

  
  def menu_choice
    
    choice = gets.chomp
    if choice =~ /[0-9]/
      choice = choice.to_i
    end
      case choice
        when "a"
          @human_player.search_weapon
        when "s"
          @human_player.search_health_pack
        when 0...@enemies_in_sight.length
          @human_player.attack(@enemies_in_sight[choice])
        else
          puts "Pick another number gaddem"
      end
      self.kill_player
  end
  def enemies_attack
    @enemies_in_sight.each { |player| player.attack(@human_player)}
  end

  def end
    if @human_player.life_points.positive?
    puts "Vous avez terminé le jeu Bravo !! "
    else
      puts " Vous avez fini mais vous êtes nul !!"
    end
  end

  
  def new_players_in_sight
    if  @players_left <= 0
      puts "Tous les ennemis sont en vue"
    else
      dice = rand(1..6)
    case dice
      when 1
        puts "Pas de nouvel ennemie en vue"
      when 2..4
        @enemies_in_sight << Player.new("player#{rand(10..1000)}")
        puts "ATTENTION ! Un nouveau joueur en vue", ''
        @players_left -= 1
        puts "Il reste #{@players_left} joueurs cachés en tout"
      when 5..6
          @enemies_in_sight << Player.new("player#{rand(10..1000)}")
          @enemies_in_sight << Player.new("player#{rand(10..1000)}")
          puts "ATTENTION !! Deux nouveaux joueurs en vue", ''
          @players_left -= 2
          puts "Il reste #{@players_left} joueurs cachés en tout", ''

      
    end
    
  end
end
end
  # Si le dé vaut 1, aucun nouveau joueur adverse n'arrive (afficher un message informant l'utilisateur).
  # - Si le dé vaut entre 2 et 4 inclus, un nouvel adversaire arrive en vue. Il faut alors créer un `Player` avec un nom aléatoire du genre "joueur_1234" ou "joueur_6938" (ou ce que tu veux) et injecter ce `Player` dans le array `@enemies_in_sight` . Affiche un message informant l'utilisateur de ce qui se passe.
  # - Si le dé vaut 5 ou 6, cette fois c'est 2 nouveaux adversaires qui arrivent en vue. De même qu'au-dessus, il faut les créer et les rajouter au jeu. Rajoute toujours un message informant l'utilisateur.

  

