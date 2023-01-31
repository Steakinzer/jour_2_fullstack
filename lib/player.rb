class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{name} a #{@life_points} points de vie"
  end

  def gets_damage(attack)
    puts self.life_points - attack
    if self.life_points - attack <= 0
      puts 'Vous etes mort'
    else
      self.life_points -= attack
      self.life_points
    end
  end

  def attack(player_life)
    damage = compute_damage
    player_life.life_points -= damage
    if player_life.life_points <= 0
      puts "#{self.name} a infligé #{damage} points de dégats à #{player_life.name}, #{player_life.name} est mort"
    else
    puts "#{self.name} a infligé #{damage} points de dégats à #{player_life.name} il lui reste maintenant #{player_life.life_points} points de vie"
    end
  end

  def compute_damage
    rand(1..6)
  end
end

# class pour creer un user humain
class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    super(name)
    @life_points = 100
  end

  def show_state
    puts "#{name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    lvl = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{lvl}"
    if lvl > @weapon_level
      @weapon_level = lvl
      puts 'Tu as trouvé une meilleure arme donc tu la prend'
    else
      puts 'Ton arme était meilleure ou égale donc tu garde ton ancienne arme'
    end
  end

  def search_health_pack
    pack = rand(1..6)
    case pack
    when 1
      puts "Tu n'as rien trouvé"
    when 2..5
      self.life_points += 50
      if self.life_points > 100
        self.life_points = 100
        puts 'Tes points de vie sont au maximum (100)'
      else
        puts 'Bravo tu as gagné 50 points de vie'
      end
    when 6
      self.life_points += 80
      if self.life_points > 100
        self.life_points = 100
        puts 'Tes points de vie sont au maximum (100)'
      else
        puts 'Bravo tu as gagné 80 points de vie'
      end
    end
  end
end
