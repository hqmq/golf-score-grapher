require 'spec_helper'

describe ::Directory do
  subject { described_class.new(db) }

  let(:player){ ::Player.new(:guid => 'PLA-guid',
    :name => 'michael',
    :created_at => Time.current,
    :updated_at => Time.current) }

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

  describe "#by_partial_name" do
    it "autocompletes players with names and guids" do
      michael = subject.by_partial_name("Mich").first
      expect(michael.name).to eq('Michael Ries')
      expect(michael.guid).not_to be_nil
    end
  end
end
