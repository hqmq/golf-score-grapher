require 'spec_helper'

describe ::PlayersController do
  let(:directory) { Directory.new(:nil_connection) }
  before { controller.stub(:directory).and_return(directory) }

  let(:player_guid) { 'PLA-guid' }

  describe "POST /players" do
    let(:player_params) {
      {:player => {:name => 'michael', :guid => player_guid}}
    }

    it "converts the inputs" do
      Timecop.freeze do
        directory.better_receive(:add) do |player|
          expect(player.name).to eq("michael")
          expect(player.guid).to eq(player_guid)
          expect(player.created_at).to eq(Time.current)
          expect(player.updated_at).to eq(Time.current)
        end
        post :create, player_params
        expect(response.body).to be_blank
        expect(response.code).to eq("201")
      end
    end
  end

  describe "GET /players/:id" do
    let(:player){ ::Player.new( :guid => player_guid ) }

    it "looks up a player" do
      directory.better_receive(:lookup_by_guid)
        .with(player_guid)
        .and_return(player)

      get :show, :id => player_guid
    end
  end
end
