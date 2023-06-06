module Wizard::Logic
  class Commands
    attr_accessor :cur_location

    def initialize
      @cur_location = :living
    end
  end
end

