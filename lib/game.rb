# frozen_string_literal: true

# Class qui permet de faire chier
class Game
  attr_accessor :human_player, :enemies, :players_left, :enemies_in_sight

  def initialize(human_player)
    @players_left = 10
    @enemies = []
    @human_player = HumanPlayer.new(human_player)
    4.times do |i|
      @enemies << Player.new("player#{i + 1}")
    end
  end

  def kill_player
    @enemies = @enemies.select { |player| player.life_points.positive? }
  end

  def is_still_ongoin?
    @human_player.life_points.positive? && @enemies.length.positive?
  end

  def show_players
    puts @human_player.show_state
    puts "Il reste #{@enemies.length} joueurs"
  end

  def menu
    puts "#{@human_player.show_state}"
    puts "Plusieurs options s'offre à vous"
    puts "Pour chercher une arme tapez 'a'"
    puts "Pour chercher un pack de soin tapez 's'"
    @enemies.each { |player| puts "Pour attaquer #{player.name} tapez #{@enemies.index(player)+1}" }
  end

    # def kill_player
    #   @enemies[2].life_points = 0
    # end

  
  def menu_choice
    choice = gets.chomp
      case choice
        when "a"
          @human_player.search_weapon
        when "s"
          @human_player.search_health_pack
        when "1"
          @human_player.attack(@enemies[0])
        when "2"
          @human_player.attack(@enemies[1])
        when "3"
          @human_player.attack(@enemies[2])
        when "4"
          @human_player.attack(@enemies[3])
        else
          puts "Pick another number gaddem"
      end
      self.kill_player
  end
  
  def enemies_attack
    @enemies.each { |player| player.attack(@human_player)}
  end

  def end
    if @human_player.life_points.positive?
    puts "Vous avez terminé le jeu Bravo !! "
    else
      puts " Vous avez fini mais vous êtes nul !!"
    end
  end

  @enemies_in_sight = []
  def new_players_in_sight
    if @enemies_in_sight == @players_left
      puts "Tous les ennemis sont en vue"
    else
      dice = rand(1..6)
    case dice
      when 1
        puts "Pas de nouvel ennemie en vue"
      when 2..4
        @enemies_in_sight << Player.new("player#{rand(10..1000)}")
        puts "Nouveau joueur dans le game"
      when 5..6
        2.times do |i|
          @enemies_in_sight << Player.new("player#{rand(10..1000)}")
      end
    end
  end
end
end
  # Si le dé vaut 1, aucun nouveau joueur adverse n'arrive (afficher un message informant l'utilisateur).
  # - Si le dé vaut entre 2 et 4 inclus, un nouvel adversaire arrive en vue. Il faut alors créer un `Player` avec un nom aléatoire du genre "joueur_1234" ou "joueur_6938" (ou ce que tu veux) et injecter ce `Player` dans le array `@enemies_in_sight` . Affiche un message informant l'utilisateur de ce qui se passe.
  # - Si le dé vaut 5 ou 6, cette fois c'est 2 nouveaux adversaires qui arrivent en vue. De même qu'au-dessus, il faut les créer et les rajouter au jeu. Rajoute toujours un message informant l'utilisateur.

  

