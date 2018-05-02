require_relative 'ConnectFour'

board = Board.new

puts 'You are getting to play connect four as the R player'
puts 'Try and beat the robot, the O player'

loop do
  board.print
  # TODO: make this safer, better
  puts 'enter your move in the form \'x\' where x is the column'
  puts 'or, enter your move in \'px\' where x is the column to pop the the bottom ring out of'
  move = gets
  if move[0] == 'p'
    # inputs should look like 'p0', 'p1' etc
    board.pop_move Integer(move[1])
  else
    move = Integer(move)
    board.addDisc(:R, move)
  end

  if board.hasWon? :R
    puts 'Congrats buddy, you won'
    break
  end
  board.robot_move
  if board.hasWon? :O
    puts 'Jesus buddy, the robot won'
    break
  end
end

