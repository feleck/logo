class Logo
  attr_accessor :pos

  def initialize(dim)
    @dim = dim.to_i
#    @pos = [[0,0],[1,1]]
    @initial_position = [(@dim/2.0).round, (@dim/2.0).round]
    print_board

  end


  def print_board
    puts "\e[H\e[2J"  # clear screen
    (1..@dim).each do |i|
      (1..@dim).each do |j|
        if [i, j] == @initial_position
          print "x "
        else
          print ". "
        end
      end
      print "\n"
    end
  puts
  end

  def read_command
    command = nil
    while !command do
      puts "Enter command: "
      command = $stdin.gets.chomp
      command = nil unless command =~ /^[udrlq] \d*/
    end
    puts "Welcome " + command
    puts check_command(command)
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
  puts logo.initial_position.to_s
  test = logo.read_command
end

#initialize board (NxN, x>1, n%2 != 0)
#set_position_initial(round N/2, round N/2)
#read_command()
#case 
# U-up
# R-right
# D-down
# L-left
# Q-quit
#new_position
#draw_board
