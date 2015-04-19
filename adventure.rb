class Hero
  attr_accessor :name, :strength, :weapon
  
  def initialize (name, strength, weapon)
    @name = name
    @strength = strength
    @weapon = weapon
  end

  def move
  end

  def battle
  end

  def power
  end

  def heal
  end

end

class Path
  attr_accessor :name, :enemy_num, :weapon_num, :health_num
  
  def initialize(name)
    @name = name
    @enemy_num = generate
    @weapon_num = generate
    @health_num = generate
  end
  
  def generate()
    @item = rand(10)
  end
  
end

class Enemy
end

class Weapon
end

class Health
end

class Adventure
  def start
      
    
  end
  
  
  def generate()
    @item = rand(10)
  end

end


newpath = Path.new("road")
puts "There are #{newpath.enemy_num} enemies"
puts "There are #{newpath.weapon_num} weapons"
puts "There are #{newpath.health_num} health"