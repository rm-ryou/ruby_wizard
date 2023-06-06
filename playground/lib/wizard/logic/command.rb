module Wizard::Logic
  class Command
    include Wizard::Location
    include Wizard::Object
    include Wizard::Edge

    attr_accessor :cur_location
    @@cur_location = :living

    def initialize
      super
    end

  end
end

