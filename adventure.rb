# Classes for adventure

class Person
  attr_accessor :name, :health, :strength, :weapon
  
  def initialize (name, health, strength, weapon)
    @name = name
    @health = health
    @strength = strength
    @weapon = weapon
  end
end

class Hero < Person

  def move
  end

  def power
  end

  def heal
  end

end

class Enemy < Person
  
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


class Weapon
end

class Health
end

class Adventure
  attr_accessor :count, :patharray
  
  def start
    @patharray = []
    pathname = ["Elm Street", "Crystal Lake", "Amityville", "Haddonfield", "Sunset Blvd", "Mulholland Drive", "34th St", "Bates Motel", "Transylvania", "Hogwarts", "Southpark" ]
    rand(1..5).times do |i|
      @patharray << Path.new(pathname[rand(10)])
      @count = i
    end
    
  end
  
  
end

# Methods for Adventure

def battle(hero, enemy)
  hero.health = hero.health - enemy.strength
  enemy.health = enemy.health - hero.strength
  puts "Your health is #{hero.health}, and the enemy has health of #{enemy.health}"
end

game = Adventure.new # instantiate a new Adventure 
game.start # create an Array of paths

enemy = Enemy.new("Dracula", 10, 10, 10) # create a new enemy
hero = Hero.new("Mario", 100, 10, 10) # create a new hero


# Introduce Game

puts "There are #{game.count + 1} paths in your adventure"

while game.count >= 0 
  puts game.patharray[game.count].name # remember to designate array field to display or else function will return objectID
  game.count -= 1
end

# Game Play

battle(hero, enemy)




