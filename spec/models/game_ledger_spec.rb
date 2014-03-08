require 'spec_helper'

describe GameLedger do
  describe "#recent_games" do
    it "returns an enumerable list" do
      expect(subject.recent(5)).to be_a(Enumerable)
    end

    it "the list contains game objects" do
      expect(subject.recent(1).first).to be_a(Game)
    end

    it "accepts a limit argument" do
      expect(subject.recent(3).size).to eq(3)
    end
  end
end
