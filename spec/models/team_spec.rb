require 'spec_helper'

describe Team do
  fixtures :players, :players_teams
  let(:team){ players(:me_and_bry) }

  it "links to players" do
    team.players.size.should == 2
    team.players.map(&:name).sort.should == ['Me','bry']
  end
end
