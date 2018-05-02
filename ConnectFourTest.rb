require_relative 'ConnectFour.rb'

# test some robot-player behaviors
testboard1 = Board.new
testboard1.addDisc(:R, 0)
testboard1.addDisc(:O, 0)
testboard1.print
testboard1.pop_move 0
testboard1.print




=begin
testboard1.addDisc(:O, 4)
testboard1.addDisc(:R, 5)
testboard1.addDisc(:O, 5)
testboard1.addDisc(:R, 6)
testboard1.addDisc(:O, 6)
testResult(:block1, robotMove(:R, testboard1), [3], 'robot should block horiz')
testboard1.print

testboard2 = Board.new
testboard2.addDiscs(:R, [3, 1, 3, 2, 3]);
testResult(:block2, robotMove(:O, testboard2), [3], 'robot should block vert')
testboard2.print

testboard2 = Board.new
testboard2.addDiscs(:O, [3, 1, 3, 2, 3, 4]);
testResult(:block2, robotMove(:O, testboard2), [3], 'robot should complete stack')
testboard2.print

testboard2 = Board.new
testboard2.addDiscs(:R, [3, 1, 4, 5, 2, 1, 6, 0, 3, 4, 5, 3, 2, 2, 6]);
testResult(:block2, robotMove(:O, testboard2), [3], 'robot should complete diag')
testboard2.print

testboard3 = Board.new
testboard3.addDiscs(:O, [1, 1, 2, 2, 3, 3])
testResult(:avoid, robotMove(:O, testboard3), [0, 6], 'robot should avoid giving win')
testboard3.print
=end
