require "pry"

class Animal
  attr_accessor :name, :age, :species
  @@all = []
  def initialize(args)
    # NOTE: This was commented out since we will loop through these instead:
    # @name = args[:name]
    # @age = args[:age]
    # @species = args[:species]
    # NOTE: This process of looping through key value pairs in this manner is called 'mass assignment':
    args.each_key do |key, value|
      # This is going to send an attribute to the class via 'self':
      # We can use then poke at the key with 'key' while at the breakpoint via 'binding.pry'
      # We can also look at the corresponding value with 'args[key]'
      # By using 'args[key]', we basically will return the following through each iteration:
      # "Jacques",
      # 8,
      # "F.catus"
      binding.pry
      self.send("#{key}=", args[key])
    end
    @@all << self
  end
  def self.all
    @@all
  end
end

cat = {
  name: "Jacques",
  age: 8,
  species: "F.catus"
}

# NOTE: Because we used 'args' above, we no longer need this version of the variable declaration:
# animal = Animal.new(cat[:name], cat[:age], cat[:species])

animal = Animal.new(cat)

binding.pry
