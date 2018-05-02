# Ruby Assignment Code Skeleton
# Nigel Ward, University of Texas at El Paso
# April 2015
# borrowing liberally from Gregory Brown's tic-tac-toe game

#------------------------------------------------------------------
class Board
  def initialize
    @board = [[nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil]]
  end

  # process a sequence of moves, each just a column number
  def addDiscs(firstPlayer, columns)
    if firstPlayer == :R
      players = [:R, :O].cycle
    else
      players = [:O, :R].cycle
    end
    columns.each { |c| addDisc(players.next, c) }
  end

  def addDisc(player, column)
    if column >= 7 || column < 0
      puts "  addDisc(#{player},#{column}): out of bounds"
      return false
    end
    firstFreeRow =  @board.transpose.slice(column).index(nil)
    if firstFreeRow == nil
      puts "  addDisc(#{player},#{column}): column full already"
      return false
    end
    update(firstFreeRow, column, player)
    return true
  end

  def update(row, col, player)
    @board[row][col] = player
  end

  def print
    puts @board.map { |row| row.map { |e| e || " " }.join("|") }.join("\n")
    puts "\n"
  end

  def toString
    return @board.map { |row| row.map { |e| e || " " }.join("|") }.join("\n")
  end

  def hasWon?(player)
    return verticalWin?(player) | horizontalWin?(player) |
           diagonalUpWin?(player) | diagonalDownWin?(player)
  end

  def verticalWin?(player)
    (0..6).any? { |c| (0..2).any? { |r| fourFromTowards?(player, r, c, 1, 0) } }
  end

  def horizontalWin?(player)
    (0..3).any? { |c| (0..5).any? { |r| fourFromTowards?(player, r, c, 0, 1) } }
  end

  def diagonalUpWin?(player)
    (0..3).any? { |c| (0..2).any? { |r| fourFromTowards?(player, r, c, 1, 1) } }
  end

  def diagonalDownWin?(player)
    (0..3).any? { |c| (3..5).any? { |r| fourFromTowards?(player, r, c, -1, 1) } }
  end

  def fourFromTowards?(player, r, c, dx, dy)
    return (0..3).all? { |step| @board[r + step * dx][c + step * dy] == player }
  end

  # methods i have written

  # adds discs so that they fall down instead of up
  def addDiscReverse(player, column)
    if column >= 7 || column < 0
      puts "  addDisc(#{player},#{column}): out of bounds"
      return false
    end
    firstFreeRow =  @board.transpose.slice(column).rindex(nil)
    if firstFreeRow == nil
      puts "  addDisc(#{player},#{column}): column full already"
      return false
    end
    update(firstFreeRow, column, player)
    return true
  end

  # robot makes the move on the current state
  # :O is always the robot in version
  def robot_move
    col = rand(0...7)
    addDisc(:O, col)
  end

  def pop_move(column)
    if column >= 7 || column < 0
      puts "  addDisc(#{player},#{column}): out of bounds"
      return false
    end

    # rotate array, then set the last element to nil.
    # ['R', 'O'] => ['O', 'R'] => ['O', nil], this is what we want.
    row = @board.transpose.slice!(column).rotate!
    row[-1] = nil
    row.each_with_index do |val, index|
      update(index, column, val)
    end
  end

end # Board
#------------------------------------------------------------------

#------------------------------------------------------------------
def testResult(testID, move, targets, intent)
  if targets.member?(move)
    puts("testResult: passed test #{testID}")
  else
    puts("testResult: failed test #{testID}: \n moved to #{move}, which wasn't one of #{targets}; \n failed #{intent}")
  end
end

#------------------------------------------------------------------
