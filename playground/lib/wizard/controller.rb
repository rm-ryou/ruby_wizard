module Wizard
  class Controller

    def repl
      line = get_input
      exit if line.match(/quit$/i)
      line = line.split(/\s/)
      if line.size > 2
        puts "too many argument."
      else
        command, err = get_command(line[0])
        if err != nil
          puts err
        else
          command.option = line[1]
          puts command.exec
        end
      end
      repl
    end

    def get_input
      begin
        print "\n> "
        gets.chomp
      rescue Interrupt
        exit
      end
    end

    def get_command(command)
      case command
      when /look/i
        Logic::Look.new
      when /walk/i
        puts "walk"
      when /inventory/i
        Logic::Inventory.new
      when /pickup/i
        puts "pickup"
      when /help/
        Logic::Help.new
      else
        return nil, "invalid command."
      end
    end
  end
end

