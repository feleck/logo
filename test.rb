def print_board(path, dim)
  puts "\e[H\e[2J"  # clear screen
  (0..dim-1).each do |x|
    (0..dim-1).each do |y|
      if path.include?([x, y])
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

def calculate_path(command, last_point)
  direction, length = command[0], command[1].to_i
  last_x = last_point[0]
  last_y = last_point[1]
  new_points = []
  
  length.times do
    #switch?
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

def valid_command?(command, dim, last_point)
  last_x = last_point[0]
  last_y = last_point[1]
  direction, length = command[0], command[1].to_i
  is_valid = false
  if direction == 'u' && last_x - length >= 0
    return true
  elsif direction == 'd' && last_x + length <= dim
    return true
  elsif direction == 'l' && last_y - length >= 0
    return true
  elsif direction == 'r' && last_y + length <= dim
    return true
  end
  is_valid
end

dim = 11
path = []
path << [(dim/2.0).to_i, (dim/2.0).to_i]

while true do
  print_board(path, dim)
  command = read_command # command[0] - direction, command[1] - length
  exit if command[0] == 'q'
  path.concat(calculate_path(command, path.last)) if valid_command?(command, dim, path.last)
end

