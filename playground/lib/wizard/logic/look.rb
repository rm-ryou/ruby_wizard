module Wizard::Logic
  class Look < Wizard::Logic::Command
    attr_accessor :option

    def initialize
      super
    end

    def exec
      msg = []
      msg << describe_location(@@cur_location) <<
        describe_object(@@cur_location) <<
        describe_edge(@@cur_location)
      msg.join("\n")
    end
  end
end
