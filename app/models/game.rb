require 'csv'

class Game < ActiveRecord::Base
  attr_accessible :name, :played_at, :scores
  
  validates_presence_of [:name, :played_at, :scores]
  validates_uniqueness_of :played_at, :message => "duplicate value"
  
  def scores_hash
    @scores_hash ||= CSV.parse( self.scores, :headers => true).map {|rec| rec.to_hash }.sort_by{|obj| [obj["TOT"], obj["Player"]]}
    @scores_hash
  end
  
  def all_scores
    scores_hash.map{|rec| rec.select{|key,val| key =~ /^H\d+/}.map{|hole, score| score} }
  end
  
  def holes
    scores_hash.first.select{|key,val| key =~ /^H\d+/ }.map{|hole, score| hole}
  end
  
  def self.colors
    ["#2f69bf","#a2bf2f","#bf5a2f","#bfa22f","#772fbf"]
  end
end
