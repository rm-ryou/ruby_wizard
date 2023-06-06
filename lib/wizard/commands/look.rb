module Wizard
  module Commands
    class Look < Wizard::Commands::Command

      def initialize(option)
        @option = option
      end

      def exec
        return "No option are included in this command." if !!@option
      end
    end
  end
end
__END__
{
  "living": "you are in the living-room.\na wizard is snoring loudly on the couch.",
  "garden": "you are in a beautiful garden.\nthere is a well in front of you.",
  "attic":   "you are in the attic.\nthere is a giant welding torch in the corner."
}
