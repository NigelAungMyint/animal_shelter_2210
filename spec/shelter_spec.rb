require 'rspec'
require './lib/shelter'

RSpec.describe Shelter do

  # Iteration 1
  describe '#initialize' do
    it 'is a Shelter' do


      shelter = Shelter.new('Denver Animal Shelter', 5)
      expect(shelter).to be_a(Shelter)
    end

    it 'can read the name' do


      shelter = Shelter.new('Denver Animal Shelter', 5)
      expect(shelter.name).to eq('Denver Animal Shelter')
    end

    it 'can read the capacity' do


      shelter = Shelter.new('Denver Animal Shelter', 5)
      expect(shelter.capacity).to eq(5)
    end

    it 'has a minimum capacity of 1' do

      shelter = Shelter.new('Austin Pets Alive!', 0)
    end

    it 'has no pets by default' do


      shelter = Shelter.new('Denver Animal Shelter', 5)
      expect(shelter.pets).to eq []
    end
  end

  # Iteration 2
  describe '#add_pet' do
    it 'returns a list of pets' do


      shelter = Shelter.new('Denver Animal Shelter', 5)
      shelter.add_pet('Salem')
      shelter.add_pet('Beethoven')
      shelter.add_pet('Spot')
      shelter.add_pet('Jonesy')

      expect(shelter.pets).to eq(['Salem', 'Beethoven', 'Spot', 'Jonesy'])
    end
  end

  describe '#call_pets' do
      it 'returns a list of names with exclamation points appended' do


        shelter = Shelter.new('Denver Animal Shelter', 5)
        shelter.add_pet('Salem')
        shelter.add_pet('Beethoven')
        shelter.add_pet('Spot')
        shelter.add_pet('Jonesy')

        expect(shelter.call_pets).to eq(['Salem!', 'Beethoven!', 'Spot!', 'Jonesy!'])
      end
    end

    describe '#over_capacity?' do
      it 'shows if shelter is over_capacity' do
        shelter = Shelter.new('Denver Animal Shelter', 5)
        shelter.add_pet('Salem')
        shelter.add_pet('Beethoven')
        shelter.add_pet('Spot')
        shelter.add_pet('Jonesy')
        shelter.add_pet('Wishbone')
        expect(shelter.pets.length).to eq 5
        expect(shelter.over_capacity?).to be false

        shelter.add_pet('Dogmeat')

        expect(shelter.pets.length).to eq 6
        expect(shelter.over_capacity?).to be true
      end
    end

    describe '#adopt' do
      it 'can remove pets from shelter' do
        shelter = Shelter.new('Denver Animal Shelter', 5)
        shelter.add_pet('Salem')
        shelter.add_pet('Beethoven')
        shelter.add_pet('Spot')
        shelter.add_pet('Jonesy')
        shelter.add_pet('Wishbone')
        shelter.add_pet('Dogmeat')

        expect(shelter.pets.length).to eq 6
        expect(shelter.over_capacity?).to be true

        shelter.adopt('Dogmeat')

        expect(shelter.pets.length).to eq 5
        expect(shelter.over_capacity?).to be false
      end

      it 'says no to adoption if pet is not at shelter' do
        shelter = Shelter.new('Denver Animal Shelter', 5)
        shelter.add_pet('Dogmeat')

        expect(shelter.adopt('Dogmeat')).to eq("Congratulations on bringing Dogmeat home with you!")
        expect(shelter.adopt('Wishbone')).to eq("Sorry that dog isn't at our shelter")

      end
    end
end
