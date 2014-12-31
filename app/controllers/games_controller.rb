require 'csv'

class GamesController < ApplicationController
  def recent
    @games = game_ledger.recent(20)
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_ledger
    @game_ledger ||= GameLedger.new
  end
end
