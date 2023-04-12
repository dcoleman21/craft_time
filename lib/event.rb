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

  def attendees_by_craft_interest
    by_craft_interest = {}
    @crafts.each do |craft|
      by_craft_interest[craft.name] = [] unless by_craft_interest.has_key?(craft.name)
      @attendees.each do |attendee|
        if attendee.interests.include?(craft.name)
          by_craft_interest[craft.name] << attendee
        end
      end
    end
    by_craft_interest
  end

  def crafts_that_use(item)
    @crafts.select do |craft|
      craft.supplies_required.keys.to_s.include?(item)
    end
  end

  def assign_attendees_to_crafts
    assignment = {}
    @crafts.each do |craft|
      assignment[craft] = [] if !assignment.has_key?(craft)
    end
    @attendees.each do |attendee|
      sample = ""
      until sample.class == Craft do
        @crafts.each do |craft|
          if attendee.interests.sample == craft.name
            sample = craft
          end
        end
      end
      assignment[sample] << attendee
    end
    assignment
  end
end