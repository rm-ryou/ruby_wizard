module Wizard
  module Commands
    class Command
      attr_accessor :cur_location

      def initialize
        @cur_location = :living
      end

      def run
        line = get_input
        # exit if line.match(/quit/i)
        exit if /quit/i.match(line)
        line = line.split(/\s/)
        if line.size > 2
          puts "too many argument."
        else
          command = get_command_instance(line[0], line[1]) unless line.empty?
          puts command&.exec
        end
        run
      end

      def get_input
        begin
          print "\n> "
          # TODO "        a" でもtoo many argsが出てしまう
          gets.chomp
        rescue Interrupt
          exit
        end
      end

      def get_command_instance(command, option)
        case command
        when /look/i
          puts "look"
        when /walk/i
          puts "walk"
        when /inventory/i
          puts "inventory"
        when /pickup/i
          puts "pickup"
        when /help/i
          Commands::Help.new(option)
        else
          puts "invalid command."
          return run
        end
      end
    end
  end
end

