require './lib/person'
require './lib/craft'

RSpec.describe Person do 
  describe "Iteration 1" do 
    it "exits and has attributes" do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      expect(person).to be_an_instance_of(Person)
      expect(person.name).to eq('Hector')
      expect(person.interests).to eq(["sewing", "millinery", "drawing"])
      expect(person.supplies).to eq({})
    end

    it "starts with no supplies" do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      expect(person.supplies).to eq({})
    end

    it "can add supplies" do
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

      person.add_supply('fabric', 4)
      person.add_supply('scissors', 1)

      expect(person.supplies).to eq({"fabric"=>4, "scissors"=>1})

      person.add_supply('fabric', 3)

      expect(person.supplies).to eq({"fabric"=>7, "scissors"=>1})
    end
  end

  describe "Iteration 2" do 
    it "#can_build? if has the correct supplies" do 
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

      expect(hector.can_build?(sewing)).to eq(false)

      hector.add_supply('fabric', 7)
      hector.add_supply('thread', 1)
      
      expect(hector.can_build?(sewing)).to eq(false)

      hector.add_supply('scissors', 1)
      hector.add_supply('sewing_needles', 1)

      expect(hector.can_build?(sewing)).to eq(true)
    end
  end
end