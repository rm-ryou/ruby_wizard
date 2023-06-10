module Wizard
  module Location

    def initialize
      # super
      @location_living = "you are in the living-room. a wizard is snoring loudly on the couch."
      @location_garden = "you are in a beautiful garden. there is a well in front of you."
      @location_attic  = "you are in the attic. there is a giant welding torch in the corner."
    end

    def describe_location(place)
      get_instance_val("location", place)
    end
  end
end
