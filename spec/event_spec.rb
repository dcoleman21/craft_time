require './lib/event'
require './lib/craft'
require './lib/person'


RSpec.describe Event do 
  describe "Iteration 1" do 
    it "exists and has attributes" do 
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      event = Event.new("Carla's Craft Connection", [craft], [person])

      expect(event).to be_an_instance_of(Event)
      expect(event.name).to eq("Carla's Craft Connection")
      expect(event.crafts).to eq([craft])
      expect(event.attendees).to eq([person])
    end
  end

  describe "Iteration 2" do 
    it "can get attendee names" do 
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])
      
      expect(event.attendee_names).to eq(["Hector", "Toni"])
    end

    it "can get teh craft with most supplies" do 
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

      expect(event.craft_with_most_supplies).to eq("sewing")
    end

    it "can get a supply list" do 
      hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

      expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
    end
  end
end