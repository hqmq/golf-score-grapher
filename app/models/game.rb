class Game < ActiveRecord::Base
  attr_accessible :name, :played_at, :scores
end
