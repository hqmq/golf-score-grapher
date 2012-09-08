require 'spec_helper'

describe Game do
  fixtures :games
  it "can be created" do
    ->{
      Game.new.should be_an_instance_of(Game)
    }.should_not raise_exception
  end

  describe "#"
end
