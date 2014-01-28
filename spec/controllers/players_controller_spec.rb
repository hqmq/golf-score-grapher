require 'spec_helper'

describe ::PlayersController do
  let(:directory) { Directory.new(:nil_connection) }
  before { controller.stub(:directory).and_return(directory) }

  describe "POST /players" do
    it "converts the inputs" do
      Timecop.freeze do
        directory.better_receive(:add) do |player|
          expect(player.name).to eq("michael")
          expect(player.guid).to eq("PLA-guid")
          expect(player.created_at).to eq(Time.current)
          expect(player.updated_at).to eq(Time.current)
        end
        post :create, {:player => {:name => 'michael', :guid => 'PLA-guid'}}, :format => :json
        expect(response.body).to be_blank
        expect(response.code).to eq("201")
      end
    end
  end
end
