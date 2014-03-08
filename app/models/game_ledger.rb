class GameLedger
  def recent(how_many = 10)
    Game.order(:created_at => :desc).limit(how_many).to_a
  end
end
