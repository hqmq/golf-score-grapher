require 'spec_helper'

describe Game do
  fixtures :courses, :games, :players, :scores
  it "can be created" do
    ->{
      Game.new.should be_an_instance_of(Game)
    }.should_not raise_exception
  end

  it "can be created from a CSV file" do
    csv_file = File.open(File.expand_path("spec/fixtures/rj1.csv"))
    g = Game.build_from_csv(csv_file)
    g.save
    g.played_at.should == Time.zone.parse("2012-08-16 20:59:00")
    g.course.name.should == "ron jon"
    g.scores.size.should ==  4
    me_score = g.scores.find do |score|
      score.player.name == "Me"
    end
    me_score.total.should == 20
    me_score.score_array.should == [2,4,2,3,1,3,1,2,2]
  end

  it "a list of holes" do
    game = games(:g1)
    game.holes.should == [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]
    game.num_holes.should == 18

    game = games(:g3)
    game.holes.should == [1,2,3,4,5,6,7,8,9]
    game.num_holes.should == 9
  end
end
