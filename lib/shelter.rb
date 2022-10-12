class Shelter
attr_reader :name, :capacity, :pets
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def call_pets
    call_pets_array = @pets.map do |pet|
      pet + '!'
    end
  end
end
