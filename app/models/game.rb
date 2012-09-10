require 'csv'
require 'narray'

class Game < ActiveRecord::Base
  attr_accessible :name, :played_at, :num_holes
  
  validates_presence_of [:name, :played_at]
  validates_uniqueness_of :played_at, :message => "duplicate value"

  has_many :scores

  def self.build_from_csv(file)
    lines = file.read.split("\n")
    first = lines.shift
    second = lines.shift
    first = CSV.parse_line(first)
    game = Game.new
    game.name = first.first
    game.played_at = DateTime.strptime(first.last, "%m/%d/%y %I:%M %P")
    game.num_holes = CSV.parse_line(lines.first).size - 4
    game.scores = CSV.parse(lines.join("\n"), :headers => true)
      .map{ |csv_record| Score.build_from_csv(csv_record) }
    game
  end

  def player_scores
    scores.sort_by do |score|
      score.total
    end.map do |score| 
      score.to_basic_hash
    end
  end

  def player_totals
    player_scores.map do |player_score|
      running_total = 0
      player_score[:totals] = player_score[:scores].map{ |score| running_total += score; running_total }
      player_score
    end
  end

  def running_average
    arr = NArray.int(num_holes)
    totals = player_totals
    holes.map do |hole_num| 
      totals.map do |player_total|
        player_total[:totals][hole_num-1]
      end.inject(0){|sum, score| sum += score } / totals.size
    end
  end
  
  def all_average_scores
    holes = 0.upto(self.holes.size-1).to_a
    totals = all_running_totals
    averages = running_average
    totals.map do |scores|
      na = NArray.int(num_holes) + scores
      (na - averages).to_a
    end
  end

  def player_averages
    player_totals.map do |player_score|
      player_score[:averages] = ((NArray.int(num_holes) + player_score[:totals]) - running_average).to_a
      player_score
    end
  end
  
  def holes
    1.upto(num_holes).to_a
  end
end
