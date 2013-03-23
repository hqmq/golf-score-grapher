require 'spec_helper'

describe Player do
  fixtures :courses, :games, :players, :scores
  let(:me){ players(:me) }
  let(:matt){ players(:matt) }

  it "tracks course records" do
    me.course_records.size.should == 1
    me.course_records.first.rank.should == 4
    matt.course_records.size.should == 2
  end

  it "tracks a cumulative score" do
    #score total:
    #  games_played * 1
    #  1st place records * 10
    #  2nd place records * 5
    #  3rd place records * 3
    me.points.should == 2
    matt.points.should == 2 + 5 + 3
  end
end
