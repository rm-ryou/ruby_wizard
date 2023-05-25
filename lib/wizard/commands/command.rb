class Wizard::Commands::Command

  def run
    line = get_input
    if line.size > 2
      puts "too many argument."
    else
      command, option = line.tap { self }
    end
    run
  end

  def get_input
    begin
      print "\n> "
      gets.chomp.split(/\s/)
    rescue Interrupt
      exit
    end
  end
end

