require 'csv'
require 'matrix'

class Game < ActiveRecord::Base
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

  def holes
    1.upto(num_holes).to_a
  end
end
