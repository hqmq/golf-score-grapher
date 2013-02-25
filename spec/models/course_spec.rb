require 'spec_helper'

describe Course do
  subject{ Course.new(name: "Trafalga") }

  it "requires a name" do
    c = Course.new
    c.should_not be_valid
    c.name = "Cascad - Arches"
    c.should be_valid
  end

  it "can be found or created" do
    trafalga = Course.find_or_create("Trafalga")
    trafalga.id.should == subject.id

    new_course = Course.find_or_create("new-course")
    new_course.games.size.should == 0
  end

  it "should get a list of recent games" do
    subject.recent_games.size.should == 2
    subject.recent_games.should == [games(:g2), games(:g1)]
  end

  it "should calculate the par for all the holes" do
    subject.calculated_par.should == [2,2,3,3,3,3,3,3,3,2,2,2,3,3,3,4,3,2]
  end

  it "should be created by importing games" do
    ["rj1.csv", "rj2.csv", "rj3.csv"].each do |basename|
      csv_file = File.open(File.expand_path("spec/fixtures/#{basename}"))
      g = Game.build_from_csv(csv_file)
      g.save
    end

    course = Course.where(:name => "ron jon").first
    course.recent_games.count.should == 3
    course.calculated_par.should == [3, 3, 2, 3, 2, 3, 3, 3, 2]
  end

  describe "#records" do
    it "should get a list of course record holders" do
      subject.records.size.should == 5
      top_record = CourseRecord.new(players(:p7), scores(:s5), games(:g1))
      subject.records.first.should == top_record
      subject.records.map{|r| r.total}.should == [46,46,46,49,49]
    end

    it "should not fail for a course with no games" do
      Course.new(name: "ron jon").records.should == []
    end
  end
end
