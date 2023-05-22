class Game
  def initialize(engine)
    @engine = engine
  end

  def start
    # puts @engine.help
    repl
  end


  private

  def repl
    line = get_input
    if line.size > 2
      puts "too many args."
    else
      command, option = line.tap { self }
      @engine.exec_operation(command, option)
    end
    repl
  end

  def get_input
    begin
      print "\n> "
      gets.chomp.split(/\s/)
    rescue Interrupt
      exit
    end
  end




  def validate_input(line)
    input_validation = InputValidation.new
    input_validation.input(line)
    puts input_validation.message if input_validation.message
  end
end
