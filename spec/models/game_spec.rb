require 'spec_helper'

describe Game do
  fixtures :games
  it "can be created" do
    ->{
      Game.new.should be_an_instance_of(Game)
    }.should_not raise_exception
  end

  describe "#scores_hash" do
  	subject{games(:g1).scores_hash}
  	it "should return a hash for each player" do
  		subject.size.should == 5
  		me_hash = subject.select{ |h| h["Player"] == "Me" }
  		me_hash.size.should == 1
  		me_hash = me_hash.first
  		me_hash["TOT"].to_i.should == 49
  	end
  end

  describe "#player_scores" do
  	subject{games(:g1).player_scores}
  	it "should return a standardized hash for each player" do
  		subject.size.should == 5
  		me_hash = subject.select{ |h| h[:player] == "Me" }
  		me_hash.size.should == 1
  		me_hash = me_hash.first
  		me_hash[:scores].should == [2,1,1,2,1,4,2,6,3,4,2,3,4,3,5,2,3,1]
  	end
  end

  describe "#player_totals" do
  	subject{games(:g1).player_totals}
  	it "should return a standardized hash for each player" do
  		subject.size.should == 5
  		me_hash = subject.select{ |h| h[:player] == "Me" }
  		me_hash.size.should == 1
  		me_hash = me_hash.first
  		me_hash[:totals].should == [2,3,4,6,7,11,13,19,22,26,28,31,35,38,43,45,48,49]
  	end
  end

  describe "#player_averages" do
  	subject{games(:g1).player_averages}
  	it "should return a standardized hash for each player" do
  		subject.size.should == 5
  		me_hash = subject.select{ |h| h[:player] == "Me" }
  		me_hash.size.should == 1
  		me_hash = me_hash.first
  		me_hash[:averages].should == [0,-1,-2,-3,-4,-4,-5,-2,-2,0,-1,-1,0,0,2,0,0,-1]
  	end
  end
end
