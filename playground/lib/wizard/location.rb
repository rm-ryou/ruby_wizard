module Wizard
  module Location

    def initialize
      @living = "you are in the living-room. a wizard is snoring loudly on the couch."
      @garden = "you are in a beautiful garden. there is a well in front of you."
      @attic  = "you are in the attic. there is a giant welding torch in the corner."
    end

    def describe_location(place)
      eval <<-END_OF_DEF
        @#{place}
      END_OF_DEF
    end
  end
end
