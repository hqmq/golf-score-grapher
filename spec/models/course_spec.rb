require 'spec_helper'

describe Course do
  fixtures :courses, :games, :players, :scores
  
  subject{ courses(:c1) }
  it "should get a list of recent games" do
    subject.recent_games.size.should == 2
    subject.recent_games.should == [games(:g2), games(:g1)]
  end
  it "should calculate the par for all the holes" do
    subject.calculated_par.should == [2,2,3,3,3,3,3,3,3,2,2,2,3,3,3,4,3,2]
  end
end
