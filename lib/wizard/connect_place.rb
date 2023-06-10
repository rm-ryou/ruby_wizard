module Wizard
  module ConnectPlace

    def initialize
      super
      @connect_downstairs = :living
      @connect_east = :living
      @connect_west = :garden
      @connect_upstairs = :attic
    end

    def move_place(place, directions)
      directions.each { |val| return get_instance_val("connect", place) if val.to_s == place }
      return nil
    end
  end
end
