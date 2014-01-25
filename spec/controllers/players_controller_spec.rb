require 'spec_helper'

describe ::PlayersController do
  let(:directory) { Directory.new }
  before { controller.stub(:directory).and_return(directory) }

  describe "POST /players" do
    it "converts the inputs" do
      directory.better_receive(:add) do |player|
        expect(player.name).to eq("michael")
        expect(player.guid).to eq("PLA-guid")
        expect(player.created_at).to eq(Time.parse("2012-10-14 05:46:28 UTC"))
        expect(player.updated_at).to eq(Time.parse("2013-09-06 22:29:36 UTC"))
      end
      post :create, fixture('michael.json'), :format => :json
      expect(response.body).to be_blank
      expect(response.code).to eq("201")
    end
  end
end
