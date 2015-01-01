class PlayersController < ApplicationController

  # GET /players/1
  # GET /players/1.json
  def show
    @player = Player.find(params[:id])
  end

  def awesomest
    @players = directory.most_awesome(5)
  end
end
