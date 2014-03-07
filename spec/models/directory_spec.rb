require 'spec_helper'

describe Directory do
  fixtures :players

  it "lists the most awesome players" do
    most_awesome = subject.most_awesome(3)
    most_awesome.size.should == 3
    most_awesome.first.name.should == "Me"
  end
end
