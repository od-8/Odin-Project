def legal_moves(cords)
  x = cords[0]
  y = cords[1]
  possible_moves = []

  # All the possible moves above where the night is currently
  possible_moves << [x + 1, y + 2] if (x + 1).between?(0, 7) && (y + 2).between?(0, 7)
  possible_moves << [x - 1, y + 2] if (x - 1).between?(0, 7) && (y + 2).between?(0, 7)

  # All the possible moves below where the knight is currently
  possible_moves << [x + 1, y - 2] if (x + 1).between?(0, 7) && (y - 2).between?(0, 7)
  possible_moves << [x - 1, y - 2] if (x - 1).between?(0, 7) && (y - 2).between?(0, 7)

  # All the possible moves to the left of where the knight is currently
  possible_moves << [x - 2, y - 1] if (x - 2).between?(0, 7) && (y - 1).between?(0, 7)
  possible_moves << [x - 2, y + 1] if (x - 2).between?(0, 7) && (y + 1).between?(0, 7)

  # All the possible moves to the right of where the knight is currently
  possible_moves << [x + 2, y - 1] if (x + 2).between?(0, 7) && (y - 1).between?(0, 7)
  possible_moves << [x + 2, y + 1] if (x + 2).between?(0, 7) && (y + 1).between?(0, 7)

  possible_moves.shuffle
end

def knight_moves(start_cords, end_cords)
  # base case (equal)
  # number incrementor
  # bfs 
end

# legal_moves([3, 3])

queue = [[1,2], [3,4], [5,7], [2,1], [4,3], [7,5]]
visited = []

until queue.empty?
  current_path = queue.shift
  current_position = current_path.last

  visited << current_position

  p current_path
  p current_position
  p queue
  p visited
  puts ''
end