require 'spec_helper'

describe ::Directory do
  subject { described_class.new(db) }

  let(:player){ ::Player.new :guid => 'PLA-guid', :name => 'michael' }

  it "adds a player" do
    expect{
      subject.add(player)
    }.to change{
      db[:players].count
    }.by(1)
  end

  it "looks up a player" do
    subject.add(player)
    lp = subject.lookup_by_guid(player.guid)
    expect(lp).to eq(player)
  end
end
