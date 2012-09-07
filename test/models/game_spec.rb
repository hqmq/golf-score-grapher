require_relative "../minitest_helper"

describe Game do

  # should return a hash keyed by player name
  # each key points to an array of that players
  # running total versus the average running total
  describe "#running_averages_by_player" do
    game = games(:g1)
    stats = game.running_averages_by_player
    #                       [1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9]
    stats["bry"].must_equal [2,3,3,4,5,4,5,5,4,4,4,3,4,3,2,2,2,3]
    stats["Me"].must_equal  [0,-1,-2,-3,-4,-4,-5,-2,-2,0,-1,-1,0,0,2,0,0,-1]
  end
end