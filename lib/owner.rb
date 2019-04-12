require 'pry'

class Owner
  attr_accessor :name, :pets 
  attr_reader :species
  @@all = []
  
  def initialize(species)
    @species = species
    @pets = {:fishes => [],
    :dogs => [],
    :cats => []}
    @@all << self
  end 
  
  def species
    @species.dup.freeze
  end 
  
  def say_species
    "I am a #{@species}."
  end 
  
  def buy_fish(fish_name)
    
    @pets[:fishes] << self.new(fish_name)
  end 
  
  def buy_cat(cat_name)
    @pets[:cats] << Cat.new(cat_name)
  end 
  
  def buy_dog(dog_name)
    @pets[:dogs] << Dog.new(dog_name)
  end 
  
  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end 
  
  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end 
  
  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end 
  
  def sell_pets 
    @pets.each do |type, pet|
      pet.each do |animal|
        animal.mood = "nervous"
      end 
      pet.clear
    end 
  end 
  
  def list_pets
    fish_count = @pets[:fishes].count 
    dog_count = @pets[:dogs].count 
    cat_count = @pets[:cats].count 
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end 
  
  def self.all
    @@all
  end 
  
  def self.count 
    @@all.count  
  end 
  
  def self.reset_all 
    @@all.clear
  end 
  
end