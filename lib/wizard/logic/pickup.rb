module Wizard::Logic
  class Pickup < Wizard::Logic::Command
    attr_accessor :option

    def initialize
      super
    end

    def exec
      return "Not enough options." if !@option
      if get_objects(@@cur_location).include? @option
        @@items << @option
        "Picked up #{@option}."
      else
        "#{@option} is not #{@@cur_location}"
      end
    end
  end
end

