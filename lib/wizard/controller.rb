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
        Commands::Look.new
      when /walk/i
        Commands::Walk.new
      when /inventory/i
        Commands::Inventory.new
      when /pickup/i
        Commands::Pickup.new
      when /help/
        Commands::Help.new
      else
        return nil, "invalid command."
      end
    end
  end
end

