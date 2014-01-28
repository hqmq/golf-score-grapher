require 'spec_helper'

describe ::Directory do
  subject { described_class.new(pg_connection) }

  let(:player){ ::Player.new }

  it "adds a player" do
    expect{
      subject.add(player)
    }.to change{
      pg_connection.exec('SELECT COUNT(*) FROM players')
        .first['count'].to_i
    }.by(1)
  end
end
