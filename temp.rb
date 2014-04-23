dim = 5
initial = (dim/2).round
path = []
path << [initial, initial]
length = 3
direction = 'u'
#puts path.to_s, length.to_s, direction
current_x = path.last[0]
current_y = path.last[1]


if (direction == 'l' || direction == 'r') && length <= [current_x, dim-current_x].min
  puts "Left or Right IN"
elsif (direction == 'u' || direction == 'd') && length <= [current_y, dim-current_y].min
  puts "Up or Down IN"
else
  puts "OUT"
end


if direction == 'l'
  if current_x - length >= 0
    length.times do 
      current_x -= 1
      path << [current_x , current_y]
    end
  else
    puts "out of board"
  end
elsif direction == 'r'
  if current_x + length < dim
    length.times do 
      current_x += 1
      path << [current_x , current_y]
    end
  else
    puts "out of board"
  end
elsif direction == 'u'
  if current_y - length >= 0
    length.times do 
      current_y -= 1
      path << [current_x , current_y]
    end
  else
    puts "out of board"
  end
elsif direction == 'd'
  if current_y + length < dim
    length.times do 
      current_y += 1
      path << [current_x , current_y]
    end
  else
    puts "out of board"
  end
end    


def add_to_path(current, length, tmp)
    tmp = -1
    length.times do 
      current += tmp
      path << [current, current_y]
    end
end



puts path.to_s
puts path.last.to_s
