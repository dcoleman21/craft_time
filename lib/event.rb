class Event
  attr_reader :name, 
              :crafts, 
              :attendees

  def initialize(name, crafts, attendees)
    @name      = name
    @crafts    = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name 
    end
  end

  def craft_with_most_supplies
    @crafts.max_by do |craft|
      craft.supplies_required.count
    end.name
  end

  def supply_list
    list = []
    @crafts.map do |craft|
      craft.supplies_required.each_key do |supply|
        list << supply.to_s
      end
    end
    list.uniq
  end
end