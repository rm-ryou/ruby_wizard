module Wizard
  class Command
    include Wizard::Location

    def initialize
      super
      p describe_location("living")
    end
  end
end

