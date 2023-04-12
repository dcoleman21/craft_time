class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(info)
    @name      = info[:name]
    @interests = info[:interests]
    @supplies  = Hash.new(0)
  end

  def add_supply(type, qty)
    @supplies[type] += qty
  end

  def can_build?(craft)
   supply_check = craft.supplies_required.map do |supply, qty|
    @supplies[supply.to_s] >= qty
   end
   supply_check.all?
  end
end