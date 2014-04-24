class Logo
  attr_accessor :path
  def initialize(board_dimensions)
    @dim = board_dimensions.to_i
    @path = []
    @path << [(@dim/2.0).to_i, (@dim/2.0).to_i]
  end

  def print_board
    #puts "\e[H\e[2J"  # clear screen
    (0...@dim).each do |x|
      (0...@dim).each do |y|

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
    command = nil
    while !command do
      print "Enter command: "
      command = $stdin.gets.chomp.downcase
      command = nil unless command =~ /^([udrl] \d+)$|^q$/
    end
    command = command.split
  end

  def calculate_path(command)
  direction, length = command[0], command[1].to_i
  last_x = @path.last[0]
  last_y = @path.last[1]
  new_points = []
  
  length.times do
    if direction == 'u'
      new_x = calc(last_x, -1)
      new_points << [new_x, last_y]
      last_x = new_x
    elsif direction == 'd'
      new_x = calc(last_x, 1)
      new_points <<  [new_x, last_y]
      last_x = new_x
    elsif direction == 'l'
      new_y = calc(last_y, -1)
      new_points << [last_x, new_y]
      last_y = new_y
    elsif direction == 'r'
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

def valid_command?(command)
  last_x = @path.last[0]
  last_y = @path.last[1]
  direction, length = command[0], command[1].to_i
  is_valid = false
  if direction == 'u' && last_x - length >= 0
    return true
  elsif direction == 'd' && last_x + length < @dim
    return true
  elsif direction == 'l' && last_y - length >= 0
    return true
  elsif direction == 'r' && last_y + length <  @dim
    return true
  end
  is_valid
end

end

if ARGV.empty? || ARGV.length > 1 
  puts "Use exactly one arg!"
  exit
elsif
  ARGV[0].to_i <= 1 || ARGV[0].to_i % 2 == 0
  puts "Arg must be number greater than 1 and odd!"
  exit
else
  logo = Logo.new(ARGV[0])
  while true do
    logo.print_board
    command = logo.read_command # command[0] - direction, command[1] - length
    exit if command[0] == 'q'
    logo.path << logo.calculate_path(command) if logo.valid_command?(command)
    #logo.path.concat(logo.calculate_path(command)) if logo.valid_command?(command)
  end
end
