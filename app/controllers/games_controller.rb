require 'csv'

class GamesController < ApplicationController
  include GamesHelper

  # GET /games
  # GET /games.json
  def index
    @games = game_ledger.recent(20)
    @players = directory.most_awesome(5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  def recent
    @games = game_ledger.recent(20)
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.build_from_csv(params[:file])

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private

  def game_ledger
    @game_ledger ||= GameLedger.new
  end
end
