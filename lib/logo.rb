class Logo
  attr_accessor :path

  def initialize(board_dimensions)
    @dim = board_dimensions.to_i
    @path = []
    @path << [(@dim/2.0).to_i, (@dim/2.0).to_i]
  end

  def print_board
    puts "\e[H\e[2J"  # clear screen
    (0...@dim).each do |y|
      (0...@dim).each do |x|
        if @path.include?([x, y])
          print "x "
        else
          print ". "
        end
      end
      print "\n"
    end
  end

  def read_command
    while true do
      print "Enter command: " 
      command = $stdin.gets.chomp.downcase
      return command.split if command =~ /^([udrl] \d+)$|^q$/
    end
  end

  def valid_command?(command)
    last_x = @path.last[0]
    last_y = @path.last[1]
    direction, length = command[0], command[1].to_i
    is_valid = false
    if direction == 'u' && last_y - length >= 0
      return true
    elsif direction == 'd' && last_y + length < @dim
      return true
    elsif direction == 'l' && last_x - length >= 0
      return true
    elsif direction == 'r' && last_x + length <  @dim
      return true
    end
    is_valid
  end

  def calculate_path(command)
    direction, length = command[0], command[1].to_i
    last_x = @path.last[0]
    last_y = @path.last[1]
    new_points = []
    
    length.times do
      if direction == 'l'
        new_x = calc(last_x, -1)
        new_points << [new_x, last_y]
        last_x = new_x
      elsif direction == 'r'
        new_x = calc(last_x, 1)
        new_points <<  [new_x, last_y]
        last_x = new_x
      elsif direction == 'u'
        new_y = calc(last_y, -1)
        new_points << [last_x, new_y]
        last_y = new_y
      elsif direction == 'd'
        new_y = calc(last_y, 1)
        new_points << [last_x, new_y]
        last_y = new_y      
      end
    end
    new_points
  end

  def calc(param, sign)
    param += sign
  end
end


