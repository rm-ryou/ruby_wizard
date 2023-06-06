module Wizard::Logic
  class Command
    include Wizard::Location
    include Wizard::Object
    include Wizard::Edge

    attr_accessor :cur_location

    def initialize
      @@cur_location = :living
      @@items = []
      super
    end

  end
end

