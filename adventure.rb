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

  def power
  end

  def heal
  end
  
  def status
    puts "#{name} has #{health} health, #{strength} strength and #{weapon} weapons" 
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
    rand(2..5).times do |i|
      @patharray << Path.new(pathname[rand(10)])
      @count = i
    end
    @patharray = @patharray.reverse
    
  end
  
end

# Methods for Adventure

def battle(hero, enemy)
  hero.health = hero.health - enemy.strength
  enemy.health = enemy.health - hero.strength
  puts "Your health is #{hero.health}, and the enemy has health of #{enemy.health}"
end

def cycleprint(object)
  i = 1
  while object.count >= 0
    puts "#{i} ) " + object.patharray[object.count].name # remember to designate array field to display or else function will return objectID
    i += 1
    object.count -= 1
  end
end

def move(object)
  puts "Pick Your Path Number:"
  selection = object.count - gets.to_i
  puts "You have selected #{object[selection].name}"
  puts "You have discovered #{object[selection].enemy_num} enemy and #{object[selection].weapon_num} weapons and #{object[selection].health_num} health"
end  


game = Adventure.new # instantiate a new Adventure 
game.start # create an Array of paths

enemy = Enemy.new("Dracula", 10, 10, 10) # create a new enemy



# Introduce Game
puts ""
puts ""
puts "Welcome to the Choose Your Own Adventure Game"
puts " --------------------------------------------"
puts "Enter Name of our Hero to Begin:" 
heroname = gets.chomp
hero = Hero.new(heroname, 100, 10, 10) # create a new hero
puts " --------------------------------------------"
puts "Our hero #{hero.name} has been created."
hero.status
puts " --------------------------------------------"
puts "There are #{game.count + 1} paths in your adventure"

cycleprint(game) 
puts " --------------------------------------------"

# Game Play

move(game.patharray)
battle(hero, enemy)
