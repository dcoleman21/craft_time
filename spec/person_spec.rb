require './lib/person'

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
end