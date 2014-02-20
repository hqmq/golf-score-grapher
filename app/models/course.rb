class Course < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name

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
    all_individual_scores = games.inject([]) do |list, game|
      unless game.teams?
        game.player_scores.inject(list) do |list, player_score|
          list << player_score[:scores]
        end
      end
      list
    end
    
    all_individual_scores.transpose.map do |hole_scores|
      (hole_scores.map(&:to_f).inject(&:+) / hole_scores.size).round
    end
  end
  
  def records
    return @records unless @records.nil?
    
    @records = games.inject([]) do |list, game|
      next list if game.teams?
      game.scores.inject(list) do |list, score|
        list << CourseRecord.new( score.player, score, game )
      end
    end
    
    @records.sort_by!{ |record| record.sort_value }
    @records = @records.slice(0..4).to_enum.with_index.map { |record, idx| record.rank = idx+1; record  }
  end
end
