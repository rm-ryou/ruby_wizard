class Game
  def initialize(engine)
    @engine = engine
  end

  def start
    line = get_input
    puts line
    @engine.exec(line)
    start
  end

  private

  def get_input
    # stty_save = `stty -g`.chomp
    begin
      Readline.readline("> ", true)
    rescue Interrupt
      # system("sttry", stty_save)
      exit
    end
  end




  def validate_input(line)
    input_validation = InputValidation.new
    input_validation.input(line)
    puts input_validation.message if input_validation.message
  end
end
