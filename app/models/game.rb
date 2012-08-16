class Game < ActiveRecord::Base
  attr_accessible :name, :played_at, :scores
  
  validates_presence_of [:name, :played_at, :scores]
end
