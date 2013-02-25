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

  describe "#records" do
    it "should get a list of course record holders" do
      subject.records.size.should == 5
      top_record = CourseRecord.new(players(:p7), scores(:s5), games(:g1))
      subject.records.first.should == top_record
      subject.records.map{|r| r.total}.should == [46,46,46,49,49]
    end

    it "should not fail for a course with no games" do
      courses(:c2).records.should == []
    end
  end
end
