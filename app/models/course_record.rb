class CourseRecord
  attr_accessor :rank
  def initialize(player,score,game)
    @player = player
    @score = score
    @game = game
    @rank = rank
  end
  
  def total
    @score.total
  end

  def score
    @score
  end
  
  def score_array
    @score.score_array
  end
  
  def date
    @game.played_at
  end
  
  def name
    @player.name
  end

  def player
    @player
  end

  def course
    @game.course
  end
  
  #some unique key that identifies this record (used for comparison)
  def to_a
    [@game.id,@player.id]
  end
  
  def sort_value
    [total,date,name]
  end
  
  def ==(other)
    self.to_a == other.to_a
  end
  
  def <=>(other)
    if self.sort_value < other.sort_value
      -1
    elsif self.sort_value > other.sort_value
      1
    else
      0
    end
  end
end
