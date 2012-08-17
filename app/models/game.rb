require 'csv'

class Game < ActiveRecord::Base
  attr_accessible :name, :played_at, :scores
  
  validates_presence_of [:name, :played_at, :scores]
  validates_uniqueness_of :played_at, :message => "duplicate value"
  
  def scores_hash
    CSV.parse( self.scores, :headers => true).map {|rec| rec.to_hash }
  end
end
