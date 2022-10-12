class Shelter
attr_reader :name, :capacity, :pets
  def initialize(name, capacity)
    @name = name
    @capacity = sanitize_capacity(capacity)
    @pets = []
  end

  def sanitize_capacity(capacity)
    if capacity < 1
      @capacity = 1
    else
      @capacity = capacity
    end
  end

  def add_pet(pet)
    @pets << pet
  end

  def call_pets
    call_pets_array = @pets.map do |pet|
      pet + '!'
    end
  end

  def over_capacity?
    if pets.length > capacity
      true
    else
      false
    end
  end

  def adopt(pet)
    if @pets.delete(pet) == nil
      "Sorry that dog isn't at our shelter"
    else
      @pets.delete(pet)
      "Congratulations on bringing #{pet} home with you!"
    end
  end
end
