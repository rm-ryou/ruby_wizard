module Wizard
  module ConnectPlace

    def initialize
      super
      @downstairs = :living
      @east = :living
      @west = :garden
      @upstairs = :attic
    end

    def move_place(place, directions)
      eval <<-END_OF_DEF
        directions.each { |val| return @#{place} if val.to_s == place }
        return nil
      END_OF_DEF
    end
  end
end
