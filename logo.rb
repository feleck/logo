class Logo
  attr_accessor :dim

  def initialize(board_dimensions)
    @path = []
    @dim = board_dimensions.to_i
#    @pos = [[0,0],[1,1]]
    @initial_position = [(@dim/2.0).round, (@dim/2.0).round]
    @current_postion = @initial_position
    @path << @current_postion
    print_board
    add_to_path(read_command)
  end

  def add_to_path(command)
    direction, length = command[0], command[1].to_i
    puts direction
    puts length
    if command[1].to_i > @dim
      puts "Out of range!"
    else
      @path << calc_move(direction, length)
    end
  end

  def calc_move(direction, length)
    puts @current_postion.to_s
    if direction == 'l'
#      puts 'left' + length.to_s
      if @current_postion[1].to_i - length > 0
        puts 'left' + length.to_s
        
        #temp_postion = @current_postion.dup
        length.times do
          temp_postion = @current_postion.dup
          temp_postion[1] -= 1
          @path << temp_postion
        end
        puts @path.to_s
        print_board
      end
    elsif direction == 'r'
#      puts 'right' + length.to_s
      if @current_postion[1].to_i + length > @dim
      end
    elsif direction == 'u'
      puts 'up' + length.to_s
      if @current_postion[0].to_i - length > 0
      end
    elsif direction == 'd'
      if @current_postion[0].to_i + length > @dim
      end
    end
  end

  def 

  def print_board_old
    puts "\e[H\e[2J"  # clear screen
    (1..@dim).each do |i|
      (1..@dim).each do |j|
        if [i, j] == @initial_position
 #         print "x "
          print "[#{i},#{j}]"
        else
          #print ". "
          print "[#{i},#{j}]"
        end
      end
      print "\n"
    end
  end

  def print_board
    #puts "\e[H\e[2J"  # clear screen
    (1..@dim).each do |i|
      (1..@dim).each do |j|
        if @path.include?([i, j])
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
    exit if command == 'q'
    command = command.split
  end

  def move(direction, lenght)
  end

  def initial_position
    @initial_position
  end
  

  def set_position
  end
  
  def check_command(command)
  end

  def stearing
    #command = read_command
    command = 'u'
    while ['u'].include(command) do
      puts "#{command} in ['u']"
    end
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
  puts "ARGS OK!"
  logo = Logo.new(ARGV[0])
  #puts logo.initial_position.to_s
#  test = logo.read_command
#  puts test.to_s
#  puts test[1]
#  puts @dim
#  if test[1].to_i < logo.dim
#    puts 'OK'

end

