class Course < ActiveRecord::Base
  attr_accessible :name

  validates_uniqueness_of :name

  has_many :games

  def self.find_or_create(name)
  	c = Course.find_by_name(name)
  	return c if c
  	Course.new(:name => name)
  end
  
  def recent_games
    games.order("played_at DESC").limit(3)
  end
  
  def calculated_par
    all_scores = games.inject([]) do |list, game|
      game.player_scores.inject(list) do |list, player_score|
        list << player_score[:scores]
      end
    end
    
    all_scores.transpose.map do |hole_scores|
      (hole_scores.map(&:to_f).inject(&:+) / hole_scores.size).round
    end
  end
end
