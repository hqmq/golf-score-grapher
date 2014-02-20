class Score < ActiveRecord::Base
  belongs_to :game
  belongs_to :player

  # takes a parsed CSV record.
  # Called from Game::build_from_csv
  def self.build_from_csv(record)
    score = Score.new
    score.player = Player.find_or_create(record["Player"])
    score.hole01 = record["H1"]
    score.hole02 = record["H2"]
    score.hole03 = record["H3"]
    score.hole04 = record["H4"]
    score.hole05 = record["H5"]
    score.hole06 = record["H6"]
    score.hole07 = record["H7"]
    score.hole08 = record["H8"]
    score.hole09 = record["H9"]
    score.hole10 = record["H10"]
    score.hole11 = record["H11"]
    score.hole12 = record["H12"]
    score.hole13 = record["H13"]
    score.hole14 = record["H14"]
    score.hole15 = record["H15"]
    score.hole16 = record["H16"]
    score.hole17 = record["H17"]
    score.hole18 = record["H18"]
    score
  end

  def score_array
    game.holes.map do |hole_num|
      method = format("hole%02d", hole_num).to_sym
      self.send(method)
    end
  end

  def total
    score_array.inject(0){ |sum, score| sum += score }
  end

  def to_basic_hash
    {
      :player => player.name,
      :player_id => player.id,
      :scores => score_array
    }
  end
end
