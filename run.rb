#!/usr/bin/ruby

require './lib/logo'

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
    logo.path.concat(logo.calculate_path(command)) if logo.valid_command?(command)
  end
end