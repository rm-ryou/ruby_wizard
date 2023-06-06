module Wizard::Logic
  class Walk < Wizard::Logic::Command
    attr_accessor :option

    def initialize
      super
    end

    def exec
      return "Not enough options." if !@option
      location = move_place(@option, get_edge(@@cur_location))
      return "Cannot move #{@option}." if !location
      @@cur_location = location
      return Look.new.exec
    end
  end
end
