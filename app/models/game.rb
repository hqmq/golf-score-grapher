require 'csv'
require 'matrix'

class Game < ActiveRecord::Base
  attr_accessible :name, :played_at, :num_holes
  
  belongs_to :course
  validates_presence_of [:played_at, :course, :scores]
  validates_uniqueness_of :played_at, :message => "duplicate value"

  has_many :scores

  def self.build_from_csv(file)
    lines = file.read.split("\n")
    first = lines.shift
    second = lines.shift
    first = CSV.parse_line(first)
    game = Game.new
    game.course = Course.find_or_create(first.first)
    game.played_at = DateTime.strptime(first.last, "%m/%d/%y %I:%M %P")
    game.num_holes = CSV.parse_line(lines.first).size - 4
    game.scores = CSV.parse(lines.join("\n"), :headers => true)
      .map{ |csv_record| Score.build_from_csv(csv_record) }
    game
  end

  def player_scores
    scores.sort_by(&:total).map do |score|
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
    totals = player_totals
    holes.map do |hole_num| 
      totals.map do |player_total|
        player_total[:totals][hole_num-1]
      end.inject(0){|sum, score| sum += score } / totals.size
    end
  end

  def player_averages
    avg_vector = Vector.elements(running_average)
    player_totals.map do |player_score|
      totals = Vector.elements(player_score[:totals])
      player_score[:averages] = (totals - avg_vector).to_a
      player_score
    end
  end
  
  def holes
    1.upto(num_holes).to_a
  end
end
