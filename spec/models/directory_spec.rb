require 'spec_helper'

describe ::Directory do
  subject { described_class.new(pg_connection) }

  let(:player){ ::Player.new :guid => 'PLA-guid', :name => 'michael' }

  it "adds a player" do
    expect{
      subject.add(player)
    }.to change{
      pg_connection.exec('SELECT COUNT(*) FROM players')
        .first['count'].to_i
    }.by(1)
  end

  it "looks up a player" do
    subject.add(player)
    lp = subject.lookup_by_guid(player.guid)
    expect(lp).to eq(player)
  end
end
