require './lib/craft'

RSpec.describe Craft do 
  describe "Iteration 1" do 
    it "exists and has attributes" do 
      craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

      expect(craft).to be_an_instance_of(Craft)
      expect(craft.name).to eq("knitting")
      expect(craft.supplies_required).to eq({:yarn=>20, :scissors=>1, :knitting_needles=>2})
    end
  end
end